const router = require('express').Router();
const connection = require('../config/db');

// 자유게시판 목록 조회
router.get('/communitylist', (req, res) => {
  const sql = `
    SELECT board_community.*, users.*
    FROM board_community
    INNER JOIN users ON board_community.bc_user_no = users.u_no
    ORDER BY board_community.bc_no DESC
  `;

  connection.query(sql, (err, results) => {
    if (err) {
      console.log('쿼리문 오류 : ', err);
      return res.status(500).json({ error: 'DB쿼리문 오류' });
    }
    res.json(results);
  });
});

// 자유게시판 상세 페이지 조회
router.get('/community/detail/:bc_no', (req, res) => {
  const bc_no = req.params.bc_no;
  connection.query(
    `SELECT board_community.*, users.*
    FROM board_community
    INNER JOIN users ON board_community.bc_user_no = users.u_no
    WHERE board_community.bc_no = ? `,
    [bc_no],
    (err, results) => {
      if (err) {
        console.log('조회 오류 : ', err);
        return res.status(500).json({ error: '조회 실패' });
      }
      return res.json(results);
    }
  )
})

module.exports = router;
