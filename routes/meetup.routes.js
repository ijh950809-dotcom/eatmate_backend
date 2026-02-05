const router = require('express').Router();
const connection = require('../config/db');
const jwt = require('jsonwebtoken');
const { SECRET_KEY } = require('../config/jwt');
const multer = require('multer');
const path = require('path');


// 맛집 탐방 meetup - 목록 조회
router.get('/meetup/all', (req, res) => {
  connection.query('SELECT board_meetup.*, users.u_nick FROM board_meetup INNER JOIN users ON board_meetup.bm_user_no = users.u_no ORDER by bm_no DESC', (err, results) => {
    if (err) {
      console.log('쿼리문 오류:', err);
      return res.status(500).json({ error: 'DB쿼리문 오류' });
    }
    res.json(results);
  });
});

// 맛집 탐방 meetup - 상세 조회
router.get('/meetup', (req, res) => {
  const { bm_no, user_no } = req.query;

  let sql = `
    SELECT board_meetup.*, users.u_nick, users.u_pic 
    FROM board_meetup 
    INNER JOIN users ON board_meetup.bm_user_no = users.u_no 
  `
  let params = [];

  if (bm_no) {
    sql += 'WHERE bm_no = ?'; // 맛집 탐방 상세
    params.push(bm_no);
  } else if (user_no) {
    sql += 'WHERE bm_user_no = ? ORDER BY bm_no DESC'; // 마이페이지 - 작성한 게시글
    params.push(user_no);
  }

  connection.query(sql, params, (err, results) => {
    if (err) {
      console.log('조회 오류:', err);
      return res.status(500).json({ error: '데이터 조회 실패' });
    }
    if (results.length === 0) {
      return res.status(404).json({ error: '해당자료가 존재하지 않습니다.' });
    }

    if (bm_no) {
      if (results.length === 0) return res.status(404).json({ error: '해당자료가 존재하지 않습니다.' });
      return res.json(results[0]);
    } else {
      return res.json(results);
    }
  }
  );
});

// 업로드 저장 위치/파일명 설정
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/meetup'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `meetup_${Date.now()}${ext}`);
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

// 맛집 탐방 meetup - 게시물 등록
router.post('/meetup', upload.single('bm_img'), (req, res) => {
  const { bm_user_no, bm_m_res, bm_title, bm_desc, bm_m_date, bm_m_people_all } = req.body;
  const bm_img = req.file ? req.file.filename : null;

  if (!bm_m_res || !bm_title || !bm_desc || !bm_m_date || !bm_img) {
    return res.status(400).json({ error: '필수항목이 누락되었습니다.' });
  }
  const peopleAll = parseInt(bm_m_people_all)
  if (
    bm_m_people_all === '' || Number.isNaN(peopleAll) || peopleAll < 1
  ) {
    return res.status(400).json({ error: '필수항목이 누락되었습니다.' });
  }

  connection.query(
    `INSERT INTO board_meetup
    (bm_board_cate, bm_user_no, bm_m_res, bm_title, bm_desc, bm_m_date, bm_m_people_all, bm_img)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    ['meetup', bm_user_no, bm_m_res, bm_title, bm_desc, bm_m_date, peopleAll, bm_img],
    (err, results) => {
      if (err) {
        console.log('등록오류:', err);
        return res.status(500).json({ error: '데이터 등록 실패' });
      }
      res.json({ success: true, insertId: results.insertId });
    }
  );
});

///////////////////맛집탐방 참석내역에 있는지 확인
router.get('/meetup_join', (req, res) => {

  const { bm_no, user_no } = req.query;

  connection.query(
    `SELECT 1 FROM meetup_join WHERE bm_no = ? AND u_no = ?`,
    [bm_no, user_no],
    (err, rows) => {
      if (err) return res.status(500).json({ error: '조회실패' });
      res.json({ joined: rows.length > 0 });
    }
  );
});

//참석하기
router.post('/meetup_join', (req, res) => {


  const { bm_no, user_no } = req.body;

  connection.query(
    `INSERT INTO meetup_join (bm_no, u_no) VALUES (?,?)`, [bm_no, user_no],
    err => {
      if (err) {
        return res.status(500).json({ error: '참석 실패' });
      }
      connection.query(
        `UPDATE board_meetup SET bm_m_people = bm_m_people+1 WHERE bm_no=?`, [bm_no],
        updateErr => {
          if (updateErr) {
            return res.status(500).json({ error: '업데이트 실패' })
          }
          res.json({ success: true });
        }
      );
    }
  );
});

/////////////참석취소
router.delete('/meetup_join', (req, res) => {
  const { bm_no, user_no } = req.body;

  connection.query(
    `DELETE FROM meetup_join WHERE bm_no=? AND u_no=?`, [bm_no, user_no],
    err => {
      if (err) return res.status(500).json({ error: '취소실패' });

      connection.query(
        `UPDATE board_meetup SET bm_m_people = bm_m_people - 1 WHERE bm_no = ?`,
        [bm_no]
      );
      res.json({ success: true });
    }
  );
})

//맛집 탐방 게시글 삭제하기 (관리자페이지)
router.delete('/admin/meetup/:bm_no', (req, res) =>{
  const bm_no = req.params.bm_no;
  connection.query(
    'DELETE FROM board_meetup WHERE bm_no = ?', [bm_no],
    (err, result) => {
      if (err){
        console.log('삭제 오류 : ', err);
        return res.status(500).json({ error: '삭제 실패' });
      }
      res.json({ success: '삭제 완료'});
    }
  )
})



module.exports = router;
