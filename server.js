const express = require('express'); //express 기본 라우팅
const app = express(); //express 기본 라우팅
const port = 9070;
const bcrypt = require('bcrypt');//해시암호화
const jwt = require('jsonwebtoken');//인증토큰
//const SECRET_KEY = '';//jwt 서명용 비밀키

const cors = require('cors');
app.use(cors());

//모든요청 (post, put, patch)에 대해 공통적용
app.use(express.json());//JSON 본문 파싱 미들웨어


const mysql = require('mysql'); //추가부분 //또는 require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '1234',
  database: 'eatmate'
});

//MYSQL 서버 접속 오류가 있다면 오류 메세지 띄우기
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


app.get('/', (req, res) => {
  res.json('백엔드 서버 정상 동작중...');
});

//meetup테이블 데이터 조회
app.get('/meetup', (req, res) => {
  connection.query('SELECT * FROM board_meetup', (err, results) => {
    if (err) {
      console.log('쿼리문 오류:', err);
      return;
    }
    res.json(results);
  })
})


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

//meetup 게시글 등록하기
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

