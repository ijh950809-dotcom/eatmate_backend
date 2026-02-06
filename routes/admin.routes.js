const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const path = require('path');

const connection = require('../config/db');
const { SECRET_KEY } = require('../config/jwt');

/*** [회원가입] ***/
// 업로드 저장 위치/파일명 설정
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/admin-user'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `admin-user_${Date.now()}${ext}`);
  }
});

const upload = multer({
  storage,
  limits: { fileSize: 5 * 1024 * 1024 }, // 5MB
  fileFilter: (req, file, cb) => {
    if (!file.mimetype.startsWith('image/')) {
      return cb(new Error('이미지 파일만 업로드 가능합니다.'));
    }
    cb(null, true);
  },
});

// 아이디 중복 체크
router.post('/admin/idcheck', (req, res) => {
  const { au_id } = req.body;
  const sql = 'SELECT * FROM admin_users WHERE au_id=?';

  connection.query(sql, [au_id], (err, result) => {
    if (err) return res.status(500).send(err);
    res.json({ exists: result.length > 0 });
  })
});

// 회원가입
router.post('/admin/join', upload.single('au_pic'), async (req, res) => {
  const { au_id, au_pw, au_name } = req.body;
  const au_pic = req.file ? req.file.filename : null;

  try {
    const sql = `INSERT INTO admin_users (au_id, au_pw, au_name, au_pic) VALUES (?,?,?,?)`;
    const hash = await bcrypt.hash(au_pw, 10);

    connection.query(sql, [au_id, hash, au_name, au_pic], (err, results) => {
      if (err) return res.status(500).send(err);
      res.json({ message: '회원가입 성공' });
    });
  } catch (err) {
    res.status(500).send(err);
  }
});

/*** [로그인] ***/
router.post('/admin/login', (req, res) => {
  const { au_id, au_pw } = req.body;

  connection.query(
    'SELECT * FROM admin_users WHERE au_id = ?',
    [au_id],
    async (err, result) => {
      if (err) {
        return res.status(500).json({ error: '서버 오류' });
      }

      if (result.length === 0) {
        return res.status(404).json({ error: '존재하지 않는 아이디입니다. 재확인 후 다시 시도해주세요.' });
      }

      const user = result[0];
      const isMatch = await bcrypt.compare(au_pw, user.au_pw);

      if (!isMatch) {
        return res.status(401).json({ error: '비밀번호가 틀렸습니다. 재확인 후 다시 시도해주세요.' });
      }

      const adminToken = jwt.sign(
        {
          token_no: user.au_no,
          token_id: user.au_id,
          token_name: user.au_name,
          token_profile: user.au_pic,
        },
        SECRET_KEY,
        { expiresIn: '1h' }
      );

      res.json({ adminToken });
    }
  )
})

/*** 관리자_맛집 관리 ***/
// [맛집 등록]
const storage2 = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/restaurant'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `restaurant_${Date.now()}${ext}`);
  }
});

const upload2 = multer({
  storage: storage2,
  limits: { fileSize: 5 * 1024 * 1024 },
  fileFilter: (req, file, cb) => {
    if (!file.mimetype.startsWith('image/')) {
      return cb(new Error('이미지 파일만 업로드 가능합니다.'));
    }
    cb(null, true);
  },
});

router.post('/admin/restaurant', upload2.single('rt_img'), (req, res) => {
  const { rt_name, rt_desc, rt_cate, rt_location, rt_tel } = req.body;
  const rt_img = req.file ? req.file.filename : null;

  connection.query(
    'INSERT INTO restaurant (rt_img, rt_name, rt_desc, rt_cate, rt_location, rt_tel) VALUES (?, ?, ?, ?, ?, ?)',
    [rt_img, rt_name, rt_desc, rt_cate, rt_location, rt_tel],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'DB 맛집 등록 실패' });
      }
      res.json({ success: '등록 완료' });
    }
  )
})


// 맛집(restuarant) 정보 삭제하기 (관리자 기능)
router.delete('/admin/restaurant/:rt_no', (req, res) => {
  const rt_no = req.params.rt_no;
  connection.query(
    'DELETE FROM restaurant WHERE rt_no= ?', [rt_no],
    (err, result) => {
      if (err) {
        console.log('삭제 오류 : ', err);
        return res.status(500).json({ error: '삭제 실패' });
      }
      res.json({ success: '삭제 완료' });
    }
  )
})

// 맛집 리뷰(review) 게시글 삭제하기 (관리자 기능)
router.delete('/admin/review/:br_no', (req, res) => {
  const br_no = req.params.br_no;
  connection.query(
    'DELETE FROM board_review WHERE br_no = ?', [br_no],
    (err, result) => {
      if (err) {
        console.log('삭제 오류 : ', err);
        return res.status(500).json({ error: '삭제 실패' });
      }
      res.json({ success: '삭제 완료' });
    }
  )
})


// 맛집(restaurant) 정보 수정하기 (관리자 기능)

/*** 회원 관리 ***/
// [회원 목록] 출력
router.get('/admin/user', (req, res) => {
  connection.query('SELECT * FROM users ORDER BY u_no DESC', (err, results) => {
    if (err) {
      console.log('쿼리문 오류:', err);
      return res.status(500).json({ error: '쿼리문 오류' });
    }
    res.json(results);
  });
});

// [회원 목록] 삭제
router.delete('/admin/user/:u_no', (req, res) => {
  const u_no = req.params.u_no;

  connection.query(
    'DELETE FROM users WHERE u_no = ?', [u_no],
    (err, results) => {
      if (err) {
        console.log('삭제오류 : ', err);
        res.status(500).json({ error: '삭제실패' });
        return;
      }
      res.json({ success: true });
    }
  )
});

module.exports = router;