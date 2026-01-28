const express = require('express');
const cors = require('cors');

const indexRouter = require('./routes/index.routes');
const communityRouter = require('./routes/community.routes');
const meetupRouter = require('./routes/meetup.routes');
const reviewRouter = require('./routes/review.routes');
const loginRouter = require('./routes/login.routes');

const app = express();

app.use(cors());
app.use(express.json()); // JSON 본문 파싱
app.use(express.urlencoded({ extended: true }));

app.use('/', indexRouter);              // 테스트 라우트
app.use('/', communityRouter);          // communitylist
app.use('/', meetupRouter);             // meetup
app.use('/', reviewRouter);             // review
app.use('/', loginRouter);              // login/join

module.exports = app;
