const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const path = require('path');

const connection = require('../config/db');
const { SECRET_KEY, EXPIRES_IN } = require('../config/jwt');

// 업로드 저장 위치/파일명 설정
const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, 'uploads/profile'),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    cb(null, `profile_${Date.now()}${ext}`);
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

// 회원가입
router.post('/join', upload.single('u_pic'), async (req, res) => {
  try {
    const { u_id, u_pw, u_desc } = req.body;
    const u_pic = req.file ? req.file.filename : null;

    const hash_pw = await bcrypt.hash(u_pw, 10);

    connection.query(
      `INSERT INTO users (u_id, u_pw, u_nick, u_desc, u_pic) VALUES (?, ?, ?, ?, ?)`,
      [u_id, hash_pw, u_id, u_desc, u_pic],
      (err) => {
        if (err) return res.status(500).json({ error: '회원가입 실패' });
        res.json({ success: true });
      }
    );
  } catch (e) {
    res.status(500).json({ error: '서버 오류' });
  }
});

// 로그인

module.exports = router;
