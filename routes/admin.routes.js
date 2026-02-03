const router = require('express').Router();
const connection = require('../config/db');

router.get('/admin/user', (req, res) => {
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
})
module.exports = router;
