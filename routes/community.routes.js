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

module.exports = router;
