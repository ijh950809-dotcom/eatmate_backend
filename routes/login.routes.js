const router = require('express').Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const connection = require('../config/db');
const { SECRET_KEY, EXPIRES_IN } = require('../config/jwt');

// 회원가입

// 로그인

module.exports = router;
