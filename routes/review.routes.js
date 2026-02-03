const router = require('express').Router();
const multer = require('multer');
const path = require('path');

const connection = require('../config/db');

// [맛집 리뷰 - 목록] 조회 review
router.get('/review', (req, res) => {
  connection.query(
    `SELECT board_review.*, restaurant.rt_name, restaurant.rt_cate, restaurant.rt_location, users.u_nick
    FROM board_review
    INNER JOIN restaurant 
      ON board_review.br_rt_no = restaurant.rt_no
      INNER JOIN users 
      ON board_review.br_user_no = users.u_no
    ORDER BY br_date DESC`,
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'DB 조회 오류' });
      }
      res.json(result);
    }
  );
});

// [맛집 - 상세] 조회 안에 있는 [맛집 리뷰 - 목록] 조회
router.get('/review/:rt_no', (req, res) => {
  const rt_no = req.params.rt_no;

  connection.query(
    `SELECT board_review.*, restaurant.rt_name, restaurant.rt_cate, restaurant.rt_location 
    FROM board_review
    INNER JOIN restaurant 
      ON board_review.br_rt_no = restaurant.rt_no
    WHERE rt_no = ?
    ORDER BY br_date DESC`,
    [rt_no],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'DB 조회 오류' });
      }
      res.json(result);
    }
  );
});

// [맛집 리뷰 - 상세] 조회 review/detail
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
      if (err) return res.status(500).json({ error: 'DB 조회 오류' });
      res.json(result[0]);
    }
  );
})

// [맛집 - 목록] 조회 review/restaurant
router.post('/restaurant', (req, res) => {
  const { category, filter } = req.body || {};
  let orderBy = 'rt_rank DESC';

  if (filter === 'review') orderBy = 'rt_review DESC';
  if (filter === 'name') orderBy = 'rt_name';

  const sql = category
    ? `SELECT * FROM restaurant WHERE rt_cate = ? ORDER BY ${orderBy}`
    : `SELECT * FROM restaurant ORDER BY rt_no DESC`;

  const params = category ? [category] : [];

  connection.query(sql, params, (err, result) => {
    if (err) {
      console.log('DB ERROR:', err);
      return res.status(500).json({ error: 'DB 조회 오류' });
    }
    res.json(result);
  });
});


// [맛집 - 상세] 조회 review/restaurant/detail
router.get('/restaurant/detail/:rt_no', (req, res) => {
  const rt_no = req.params.rt_no;

  connection.query(
    'SELECT * FROM restaurant WHERE rt_no = ?',
    [rt_no],
    (err, result) => {
      if (err) {
        console.log('DB ERROR:', err);
        return res.status(500).json({ error: 'DB 조회 오류' });
      }
      res.json(result[0]);
    }
  )
})

// [글쓰기 - 맛집 리뷰] write/review
// 맛집명 검색
router.post('/restaurant/search', (req, res) => {
  const { word } = req.body;

  connection.query(
    `SELECT * FROM restaurant WHERE rt_name LIKE ?`,
    [`%${word}%`],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'DB 맛집 조회 오류' });
      }

      res.json(result);
    }
  )
})

// 업로드 저장 위치/파일명 설정
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/review'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `review_${Date.now()}${ext}`);
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

// 입력 쿼리문
router.post('/write/review', upload.single('br_img'), (req, res) => {
  const { br_user_no, br_rank, br_desc, br_rt_no } = req.body;
  const br_img = req.file ? req.file.filename : null;

  connection.query(
    'INSERT INTO board_review(br_user_no, br_rank, br_img, br_desc, br_rt_no) VALUES(?, ?, ?, ?, ?)',
    [br_user_no, br_rank, br_img, br_desc, br_rt_no],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'DB 입력 오류' });
      }

      res.json({ success: '등록 성공' });
    }
  )
})

module.exports = router;
