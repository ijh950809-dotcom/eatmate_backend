const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const path = require('path');

const connection = require('../config/db');

/*** [프로필 수정] ***/
// 로그인한 유저값 가져오기
router.get('/mypage/profile/:user_no', (req, res) => {
  const user_no = req.params.user_no;

  connection.query(
    'SELECT * FROM users WHERE u_no = ?',
    [user_no],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).json({ error: 'DB 조회 오류' });
      }

      res.json(result[0]);
    }
  )
})

// 업로드 저장 위치/파일명 설정
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/user'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `user_${Date.now()}${ext}`);
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

router.put('/mypage/profile/modify', upload.single('u_pic'), async (req, res) => {
  try {
    const { u_id, u_pw, u_desc } = req.body;
    const hash_pw = await bcrypt.hash(u_pw, 10);

    // 이미지 파일을 재선택 했을 떄 쿼리문
    const sqlWithPic = `
      UPDATE users 
      SET u_pw = ?, u_desc = ?, u_pic = ?
      WHERE u_id = ?
    `;

    // 이미지 파일을 재선택 안했을 때 쿼리문
    const sqlWithoutPic = `
      UPDATE users 
      SET u_pw = ?, u_desc = ?
      WHERE u_id = ?
    `;

    if (req.file) {
      const u_pic = req.file.filename;
      connection.query(sqlWithPic, [hash_pw, u_desc, u_pic, u_id], (err) => {
        if (err) return res.status(500).json({ error: '프로필 수정 실패' });
        return res.json({ success: true });
      });
    } else {
      connection.query(sqlWithoutPic, [hash_pw, u_desc, u_id], (err) => {
        if (err) return res.status(500).json({ error: '프로필 수정 실패' });
        return res.json({ success: true });
      });
    }
  } catch (e) {
    return res.status(500).json({ error: '서버 오류' });
  }
});

module.exports = router;
