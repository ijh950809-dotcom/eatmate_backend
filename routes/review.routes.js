const router = require('express').Router();
const connection = require('../config/db');

// 맛집 리뷰 review - 목록 조회
router.get('/review', (req, res) => {
  connection.query(
    'SELECT * FROM board_review ORDER BY br_no DESC',
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: err.message });
      }
      res.json(result);
    }
  );
});

module.exports = router;
