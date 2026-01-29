const router = require('express').Router();
const connection = require('../config/db');

// 맛집 리뷰 - 목록 조회 review
router.get('/review', (req, res) => {
  connection.query(
    `SELECT board_review.*, restaurant.rt_name, restaurant.rt_cate, restaurant.rt_location 
    FROM board_review
    INNER JOIN restaurant 
      ON board_review.br_rt_no = restaurant.rt_no
    ORDER BY br_date DESC`,
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'db 조회 오류' });
      }
      res.json(result);
    }
  );
});

// 맛집 리뷰 - 상세 조회 review/detail
router.post('/review/detail/:br_no', (req, res) => {
  const { br_no } = req.params;

  connection.query(
    `SELECT board_review.*, restaurant.rt_name, users.u_nick, users.u_pic, users.u_badge
    FROM board_review
    INNER JOIN restaurant 
      ON board_review.br_rt_no = restaurant.rt_no
    INNER JOIN users 
      ON board_review.br_user_no = users.u_no
    WHERE board_review.br_no = ?`,
    [br_no],
    (err, result) => {
      if (err) return res.status(500).json({ error: 'db 조회 오류' });
      res.json(result[0]);
    }
  );
})

// 맛집 - 목록 조회 review/restaurant
router.post('/restaurant', (req, res) => {
  const { cate } = req.body;

  connection.query(
    'SELECT * FROM restaurant WHERE rt_cate = ? ORDER BY rt_rank',
    [cate],
    (err, result) => {
      if (err) {
        console.log('DB ERROR:', err);
        return res.status(500).json({ error: err.message });
      }
      res.json(result);
    }
  );
});

// 맛집 - 상세 조회 review/restaurant/detail
router.get('/restaurant/detail/:rt_no', (req, res) => {
  const rt_no = req.params.rt_no;

  connection.query(
    'SELECT * FROM restaurant WHERE rt_no = ?',
    [rt_no],
    (err, result) => {
      if (err) {
        console.log('DB ERROR:', err);
        return res.status(500).json({ error: err.message });
      }
      res.json(result[0]);
    }
  )
})

module.exports = router;
