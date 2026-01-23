-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 26-01-23 09:43
-- 서버 버전: 10.4.32-MariaDB
-- PHP 버전: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `eatmate`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `admin_user`
--

CREATE TABLE `admin_user` (
  `au_no` int(10) UNSIGNED NOT NULL COMMENT '관리자 번호',
  `au_id` varchar(50) NOT NULL COMMENT '관리자 아이디',
  `au_pw` varchar(255) NOT NULL COMMENT '관리자 비밀번호',
  `au_name` varchar(50) NOT NULL COMMENT '이름',
  `au_pic` varchar(255) DEFAULT NULL COMMENT '프로필 사진',
  `au_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `board_community`
--

CREATE TABLE `board_community` (
  `bc_no` int(10) UNSIGNED NOT NULL COMMENT '자유게시판 게시글 번호',
  `bc_board_cate` varchar(50) NOT NULL COMMENT '테이블명(카테고리)',
  `bc_user_no` int(10) UNSIGNED NOT NULL COMMENT '회원 번호 (users.u_no)',
  `bc_title` varchar(200) NOT NULL COMMENT '제목',
  `bc_desc` text NOT NULL COMMENT '본문글',
  `bc_heart` int(10) UNSIGNED DEFAULT 0 COMMENT '하트 수',
  `bc_comment` int(10) UNSIGNED DEFAULT 0 COMMENT '댓글 수',
  `bc_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `board_meetup`
--

CREATE TABLE `board_meetup` (
  `bm_no` int(10) UNSIGNED NOT NULL COMMENT '탐방 게시글 번호',
  `bm_board_cate` varchar(50) NOT NULL COMMENT '테이블명(카테고리)',
  `bm_user_no` int(10) UNSIGNED NOT NULL COMMENT '회원 번호 (users.u_no)',
  `bm_img` varchar(255) DEFAULT NULL COMMENT '대표 사진',
  `bm_img2` varchar(255) DEFAULT NULL COMMENT '서브 사진 1',
  `bm_img3` varchar(255) DEFAULT NULL COMMENT '서브 사진 2',
  `bm_img4` varchar(255) DEFAULT NULL COMMENT '서브 사진 3',
  `bm_img5` varchar(255) DEFAULT NULL COMMENT '서브 사진 4',
  `bm_title` varchar(200) NOT NULL COMMENT '제목',
  `bm_desc` text NOT NULL COMMENT '본문글',
  `bm_m_date` date NOT NULL COMMENT '탐방 날짜',
  `bm_m_res` varchar(100) NOT NULL COMMENT '탐방 맛집명',
  `bm_m_people` int(10) UNSIGNED DEFAULT 0 COMMENT '신청 인원수',
  `bm_m_people_all` int(10) UNSIGNED NOT NULL COMMENT '정원(전체 인원)',
  `bm_heart` int(10) UNSIGNED DEFAULT 0 COMMENT '하트 수',
  `bm_comment` int(10) UNSIGNED DEFAULT 0 COMMENT '댓글 수',
  `bm_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ;

-- --------------------------------------------------------

--
-- 테이블 구조 `board_review`
--

CREATE TABLE `board_review` (
  `br_no` int(10) UNSIGNED NOT NULL COMMENT '리뷰 게시글 번호',
  `br_board_cate` varchar(50) NOT NULL COMMENT '테이블명(카테고리)',
  `br_user_no` int(10) UNSIGNED NOT NULL COMMENT '회원 번호 (users.u_no)',
  `br_rank` decimal(2,1) NOT NULL COMMENT '평점',
  `br_img` varchar(255) DEFAULT NULL COMMENT '대표 사진',
  `br_img2` varchar(255) DEFAULT NULL COMMENT '서브 사진 1',
  `br_img3` varchar(255) DEFAULT NULL COMMENT '서브 사진 2',
  `br_img4` varchar(255) DEFAULT NULL COMMENT '서브 사진 3',
  `br_img5` varchar(255) DEFAULT NULL COMMENT '서브 사진 4',
  `br_desc` text NOT NULL COMMENT '리뷰 본문글',
  `br_rt_name` varchar(100) NOT NULL COMMENT '맛집명',
  `br_heart` int(10) UNSIGNED DEFAULT 0 COMMENT '하트 수',
  `br_comment` int(10) UNSIGNED DEFAULT 0 COMMENT '댓글 수',
  `br_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `comment`
--

CREATE TABLE `comment` (
  `ct_no` int(10) UNSIGNED NOT NULL COMMENT '댓글 번호',
  `ct_user_no` int(10) UNSIGNED NOT NULL COMMENT '회원 번호 (users.u_no)',
  `ct_board_cate` varchar(30) NOT NULL COMMENT '게시판 카테고리 (review/meetup/community 등)',
  `ct_board_no` int(10) UNSIGNED NOT NULL COMMENT '게시물 번호',
  `ct_desc` text NOT NULL COMMENT '댓글 본문글',
  `ct_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `restaurant`
--

CREATE TABLE `restaurant` (
  `rt_no` int(10) UNSIGNED NOT NULL COMMENT '맛집 번호',
  `rt_img` varchar(255) NOT NULL COMMENT '대표 사진',
  `rt_img2` varchar(255) DEFAULT NULL COMMENT '서브 사진 1',
  `rt_img3` varchar(255) DEFAULT NULL COMMENT '서브 사진 2',
  `rt_img4` varchar(255) DEFAULT NULL COMMENT '서브 사진 3',
  `rt_img5` varchar(255) DEFAULT NULL COMMENT '서브 사진 4',
  `rt_name` varchar(100) NOT NULL COMMENT '맛집명',
  `rt_desc` text NOT NULL COMMENT '소개 / 본문글',
  `rt_rank` decimal(2,1) DEFAULT 0.0 COMMENT '평균 평점',
  `rt_review` int(10) UNSIGNED DEFAULT 0 COMMENT '총 리뷰 수',
  `rt_cate` varchar(50) NOT NULL COMMENT '맛집 카테고리',
  `rt_location` varchar(100) NOT NULL COMMENT '위치 (00시 00구 00동)',
  `rt_tel` varchar(20) DEFAULT NULL COMMENT '전화번호',
  `rt_map` varchar(255) DEFAULT NULL COMMENT '길찾기 URL (카카오맵)',
  `rt_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `users`
--

CREATE TABLE `users` (
  `u_no` int(10) UNSIGNED NOT NULL COMMENT '회원 번호',
  `u_id` varchar(50) NOT NULL COMMENT '아이디',
  `u_pw` varchar(255) NOT NULL COMMENT '비밀번호',
  `u_nick` varchar(50) NOT NULL COMMENT '닉네임',
  `u_desc` text DEFAULT NULL COMMENT '내 소개글',
  `u_pic` varchar(255) DEFAULT NULL COMMENT '프로필 사진',
  `u_badge` varchar(20) DEFAULT 'normal' COMMENT '뱃지(vip, gold 등)',
  `u_date` datetime DEFAULT current_timestamp() COMMENT '등록 날짜/시간'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`au_no`),
  ADD UNIQUE KEY `au_id` (`au_id`);

--
-- 테이블의 인덱스 `board_community`
--
ALTER TABLE `board_community`
  ADD PRIMARY KEY (`bc_no`),
  ADD KEY `fk_bc_user` (`bc_user_no`);

--
-- 테이블의 인덱스 `board_meetup`
--
ALTER TABLE `board_meetup`
  ADD PRIMARY KEY (`bm_no`),
  ADD KEY `fk_bm_user` (`bm_user_no`);

--
-- 테이블의 인덱스 `board_review`
--
ALTER TABLE `board_review`
  ADD PRIMARY KEY (`br_no`),
  ADD KEY `fk_br_user` (`br_user_no`);

--
-- 테이블의 인덱스 `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ct_no`),
  ADD KEY `idx_comment_board` (`ct_board_cate`,`ct_board_no`,`ct_date`),
  ADD KEY `idx_comment_user` (`ct_user_no`,`ct_date`);

--
-- 테이블의 인덱스 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rt_no`);

--
-- 테이블의 인덱스 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_no`),
  ADD UNIQUE KEY `u_id` (`u_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `au_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '관리자 번호';

--
-- 테이블의 AUTO_INCREMENT `board_community`
--
ALTER TABLE `board_community`
  MODIFY `bc_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '자유게시판 게시글 번호';

--
-- 테이블의 AUTO_INCREMENT `board_meetup`
--
ALTER TABLE `board_meetup`
  MODIFY `bm_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '탐방 게시글 번호';

--
-- 테이블의 AUTO_INCREMENT `board_review`
--
ALTER TABLE `board_review`
  MODIFY `br_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '리뷰 게시글 번호';

--
-- 테이블의 AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `ct_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '댓글 번호';

--
-- 테이블의 AUTO_INCREMENT `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rt_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '맛집 번호';

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `u_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '회원 번호';

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `board_community`
--
ALTER TABLE `board_community`
  ADD CONSTRAINT `fk_bc_user` FOREIGN KEY (`bc_user_no`) REFERENCES `users` (`u_no`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `board_meetup`
--
ALTER TABLE `board_meetup`
  ADD CONSTRAINT `fk_bm_user` FOREIGN KEY (`bm_user_no`) REFERENCES `users` (`u_no`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `board_review`
--
ALTER TABLE `board_review`
  ADD CONSTRAINT `fk_br_user` FOREIGN KEY (`br_user_no`) REFERENCES `users` (`u_no`) ON DELETE CASCADE;

--
-- 테이블의 제약사항 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_ct_user` FOREIGN KEY (`ct_user_no`) REFERENCES `users` (`u_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
