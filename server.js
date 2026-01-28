const express = require('express'); // express 기본 라우팅
const app = express(); // express 기본 라우팅
const port = 9070;
const bcrypt = require('bcrypt'); // 해시암호화
const jwt = require('jsonwebtoken'); // 인증토큰
const SECRET_KEY = ''; // jwt 서명용 비밀키

const cors = require('cors');
app.use(cors());

// 모든요청 (post, put, patch)에 대해 공통적용
app.use(express.json()); // JSON 본문 파싱 미들웨어

const mysql = require('mysql'); // 추가부분 //또는 require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '1234',
  database: 'eatmate'
});

// MYSQL 서버 접속 오류가 있다면 오류 메세지 띄우기
connection.connect((err) => {
  if (err) {
    console.log('MYSQL 연결 실패 :', err);
    return;
  }
  console.log('MYSQL연결성공')
});

app.listen(port, () => {
  console.log('Listening...');
});

// 테스트
app.get('/', (req, res) => {
  res.send('OK');
});

/*** 자유게시판 commmunity ***/
// 목록 조회
app.get('/communitylist', (req, res) => {
  connection.query('SELECT board_community.*, users.* FROM board_community INNER JOIN users ON board_community.bc_user_no = users.u_no ORDER BY board_community.bc_no DESC;', (err, results) => {
    if (err) {
      console.log('쿼리문 오류 : ', err);
      res.status(500).json({ error: 'DB쿼리문 오류' });
      return;
    }

    res.json(results);
  })
})

/*** 맛집 탐방 meetup ***/
// 목록 조회
app.get('/meetup', (req, res) => {
  connection.query('SELECT * FROM board_meetup', (err, results) => {
    if (err) {
      console.log('쿼리문 오류:', err);
      return;
    }
    res.json(results);
  })
})

// 상세 조회
app.get('/meetup/:bm_no', (req, res) => {
  const bm_no = Number(req.params.bm_no);

  connection.query('SELECT * FROM board_meetup WHERE bm_no = ?', [bm_no], (err, results) => {
    if (err) {
      console.log('조회 오류:', err);
      res.status(500).json({ error: '데이터 조회 실패' })
      return;
    }
    if (results.length == 0) {
      res.status(404).json({ error: '해당자료가 존재하지 않습니다.' });
      return;
    }
    res.json(results[0]);
  }
  )
})

// 게시물 등록
app.post('/meetup', (req, res) => {
  const { bm_m_res, bm_title, bm_desc, bm_m_date, bm_m_people_all } = req.body;
  // if (!bm_m_res || !bm_title || !bm_desc || !bm_m_date || !bm_m_people_all) {
  //   return res.status(400).json({ error: '필수항목누락' })
  // }
  connection.query(
    'INSERT INTO board_meetup ( bm_board_cate,  bm_user_no, bm_m_res,bm_title,bm_desc,bm_m_date,bm_m_people_all) VALUES (?,?,?,?,?,?,?)', ['meetup', 1, bm_m_res, bm_title, bm_desc, bm_m_date, bm_m_people_all],
    (err, results) => {
      if (err) {
        console.log('등록오류:', err);
        res.status(500).json({ error: '데이터 등록 실패' });
        return;
      }
      res.json({ success: true, insertId: results.insertId })
    }
  );
});

/*** 맛집 리뷰 review ***/
// 목록 조회
app.get('/review', (req, res) => {
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
