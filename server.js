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

//-------조회-------
// commmunitylist 조회
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