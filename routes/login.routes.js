const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const connection = require('../config/db');
const { SECRET_KEY, EXPIRES_IN } = require('../config/jwt');

// 회원가입
router.post('/join', async (req, res) => {
  const { u_id, u_pw, u_desc } = req.body;

  try {
    const hash_pw = await bcrypt.hash(u_pw, 10);

    connection.query(
      `INSERT INTO users(u_id, u_pw, u_nick, u_desc) VALUES(?, ?, ?, ?)`,
      [u_id, hash_pw, u_id, u_desc],
      (err, result) => {
        if (err) {
          if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ error: '이미 존재하는 아이디입니다.' });
          }
          return res.status(500).json({ error: '회원가입이 실패했습니다. 잠시 후 다시 시도해주세요.' });
        }

        res.json({ success: '등록 성공' });
      }
    );
  } catch (err) {
    return res.status(500).json({ error: '비밀번호 암호화 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.' });
  }
});

// 로그인

module.exports = router;
