const router = require('express').Router();
const connection = require('../config/db');

// 맛집 탐방 meetup - 목록 조회
router.get('/meetup', (req, res) => {
  connection.query('SELECT * FROM board_meetup', (err, results) => {
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

// 맛집 탐방 meetup - 게시물 등록
router.post('/meetup', (req, res) => {
  const { bm_m_res, bm_title, bm_desc, bm_m_date, bm_m_people_all } = req.body;

  if (!bm_m_res || !bm_title || !bm_desc || !bm_m_date) {
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
    (bm_board_cate, bm_user_no, bm_m_res, bm_title, bm_desc, bm_m_date, bm_m_people_all)
    VALUES (?, ?, ?, ?, ?, ?, ?)`,
    ['meetup', 1, bm_m_res, bm_title, bm_desc, bm_m_date, peopleAll],
    (err, results) => {
      if (err) {
        console.log('등록오류:', err);
        return res.status(500).json({ error: '데이터 등록 실패' });
      }
      res.json({ success: true, insertId: results.insertId });
    }
  );
});

// router.get('/users', (req, res) => {
//   connection.query("SELECT users.u_nick FROM users INNER JOIN board_meetup ON users.u_no = board_meetup.bm_user_no", (err, result) => {
//     if (err) {
//       console.log('쿼리문 오류 :', err);
//       return;
//     }
//     //json 데이터로 결과를 저장
//     res.json(result);
//   })
// });


module.exports = router;
