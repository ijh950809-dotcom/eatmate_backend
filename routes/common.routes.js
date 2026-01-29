const router = require('express').Router();
const connection = require('../config/db');

// 댓글
router.post('/common/chat', (req, res) => {
  const { board_cate, board_no } = req.body;

  connection.query(
    `SELECT comment.*, users.u_pic, users.u_nick
    FROM comment
    INNER JOIN users
      ON comment.ct_user_no = users.u_no
    WHERE comment.ct_board_cate = ? && comment.ct_board_no = ?`,
    [board_cate, board_no],
    (err, reslut) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'db 조회 오류' })
      }

      res.json(reslut);
    }
  )
})

module.exports = router;
