const router = require('express').Router();
const connection = require('../config/db');
const bcrypt = require('bcrypt');
const multer = require('multer');
const path = require('path');
const jwt = require('jsonwebtoken');

const { SECRET_KEY } = require('../config/jwt');

// 업로드 저장 위치/파일명 설정
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/user'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `user_${Date.now()}${ext}`);
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

router.get('/admin/user', (req, res) => {
  console.log('body:', req.body);
  console.log('file:', req.file);
  connection.query('SELECT * FROM users', (err, results) => {
    if (err) {
      console.log('쿼리문 오류:', err);
      return res.status(500).json({ error: '쿼리문 오류' });
    }
    res.json(results);
  });
});

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

/////관리자 회원가입
router.post('/admin/idcheck', (req, res) => {
  const { au_id } = req.body;
  const sql = 'SELECT * FROM admin_users WHERE au_id=?';

  connection.query(sql, [au_id], (err, result) => {
    if (err) return res.status(500).send(err);
    res.json({ exists: result.length > 0 });
  })
});


router.post('/admin/join', upload.single('u_pic'), async (req, res) => {
  const { au_id, au_pw, au_name } = req.body;
  const au_pic = req.file ? req.file.filename : null;

  try {
    const hash = await bcrypt.hash(au_pw, 10);

    const sql = `INSERT INTO admin_users (au_id, au_pw, au_name, au_pic) VALUES (?,?,?,?)`;
    connection.query(sql, [au_id, hash, au_name, au_pic], (err, results) => {
      if (err) return res.status(500).send(err);
      res.json({ message: '회원가입성공' });
    });
  } catch (err) {
    res.status(500).send(err);
  }
});

//관리자 로그인
router.post('/admin/login', (req, res) => {
  const { au_id, au_pw } = req.body;


  connection.query('SELECT * FROM admin_users WHERE au_id=?', [au_id], async (err, result) => {
    if (err || result.length == 0) {
      return res.status(401).json({
        error: "아이디 또는 비밀번호가 틀립니다."
      });
    }
    const user = result[0];
    const isMatch = await bcrypt.compare(au_pw, user.au_pw);
    if (!isMatch) {
      return res.status(401).json({ error: '아이디 또는 비밀번호가 틀립니다.' });
    }
    const token = jwt.sign({
      au_id: user.au_id,
    },

      SECRET_KEY, {
      expiresIn: '1h'
    });
    res.json({ token });

  }
  );
});






module.exports = router;
