const router = require('express').Router();
const connection = require('../config/db');
const jwt = require('jsonwebtoken');
const { SECRET_KEY } = require('../config/jwt');
const multer = require('multer');
const path = require('path');

console.log('SECRET_KEY:', SECRET_KEY); // 디버깅용
//토큰
function getUserFromToken(req) {
  const auth = req.headers.authorization;
  if (!auth) return null;

  const token = auth.split(' ')[1];
  if (!token) return null;

  try {
    const payload = jwt.verify(token, SECRET_KEY); // 여기서 실제 문자열 키 사용
    return payload;
  } catch (err) {
    console.log('JWT verify error:', err.message);
    return null;
  }
}
//SELECT * FROM board_meetup

// 맛집 탐방 meetup - 목록 조회
router.get('/meetup', (req, res) => {
  connection.query('SELECT board_meetup.*, users.u_nick FROM board_meetup INNER JOIN users ON board_meetup.bm_user_no = users.u_no ORDER by bm_no DESC', (err, results) => {
    if (err) {
      console.log('쿼리문 오류:', err);
      return res.status(500).json({ error: 'DB쿼리문 오류' });
    }
    res.json(results);
  });
});

// 맛집 탐방 meetup - 상세 조회
router.get('/meetup/:bm_no', (req, res) => {
  const bm_no = Number(req.params.bm_no);

  connection.query(
    'SELECT board_meetup.*, users.u_nick, users.u_pic FROM board_meetup INNER JOIN users ON board_meetup.bm_user_no = users.u_no WHERE bm_no = ?',
    [bm_no],
    (err, results) => {
      if (err) {
        console.log('조회 오류:', err);
        return res.status(500).json({ error: '데이터 조회 실패' });
      }
      if (results.length === 0) {
        return res.status(404).json({ error: '해당자료가 존재하지 않습니다.' });
      }
      res.json(results[0]);
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
router.get('/meetup/join/check', (req, res) => {

  const user = getUserFromToken(req);
  if (!user) return res.json({ joined: false });

  const { bm_no } = req.query;
  const u_no = user.token_no;

  connection.query(
    `SELECT 1 FROM meetup_join WHERE bm_no = ? AND u_no = ?`,
    [bm_no, u_no],
    (err, rows) => {
      if (err) return res.status(500).json({ error: '조회실패' });
      res.json({ joined: rows.length > 0 });
    }
  );
});

//참석하기
router.post('/meetup/join', (req, res) => {


  const user = getUserFromToken(req);
  if (!user) {
    return res.status(401).json({ error: '로그인 필요' });
  }

  const u_no = user.token_no;
  const { bm_no } = req.body;


  connection.query(
    `SELECT bm_m_people, bm_m_people_all FROM board_meetup WHERE bm_no = ?`, [bm_no],
    (err, rows) => {
      if (rows[0].bm_m_people >= rows[0].bm_m_people_all) {
        return res.status(400).json({ error: '마감되었습니다.' });
      }
      connection.query(
        `SELECT 1 FROM meetup_join WHERE bm_no = ? AND u_no = ?`,
        [bm_no, u_no],
        (err, rows2) => {
          if (rows2.length > 0) {
            return res.status(400).json({ error: '이미참여했습니다.' })
          }
          connection.query(
            `INSERT INTO meetup_join (bm_no, u_no) VALUES (?,?)`, [bm_no, u_no],
            err => {
              if (err) {
                console.log('등록오류:', err.code, err.sqlMessage);
                return res.status(500).json({ error: '참석 실패' });
              }
              res.json({ success: true });
            }
          );
        }
      );


    }
  )





});

/////////////



module.exports = router;
