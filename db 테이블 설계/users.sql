-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 26-01-29 07:58
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
-- 테이블의 덤프 데이터 `users`
--

INSERT INTO `users` (`u_no`, `u_id`, `u_pw`, `u_nick`, `u_desc`, `u_pic`, `u_badge`, `u_date`) VALUES
(1, 'user01', 'user01', '먹방러01', '맛집 탐방을 좋아합니다.', 'user01.png', 'normal', '2024-01-01 09:00:00'),
(2, 'user02', 'user02', '혼밥러02', '혼자 먹는 것도 좋아요.', 'user02.png', 'normal', '2024-01-02 09:10:00'),
(3, 'user03', 'user03', '단골러03', '동네 맛집 전문입니다.', 'user03.png', 'silver', '2024-01-03 09:20:00'),
(4, 'user04', 'user04', '미식가04', '전국 맛집 도장깨기!', 'user04.png', 'gold', '2024-01-04 09:30:00'),
(5, 'user05', 'user05', '야식러05', '야식은 못 참죠.', 'user05.png', 'normal', '2024-01-05 09:40:00'),
(6, 'user06', 'user06', '카페덕후06', '카페 투어가 취미.', 'user06.png', 'normal', '2024-01-06 09:50:00'),
(7, 'user07', 'user07', '분식러07', '떡볶이는 사랑.', 'user07.png', 'silver', '2024-01-07 10:00:00'),
(8, 'user08', 'user08', '고기러08', '고기만 보면 행복.', 'user08.png', 'gold', '2024-01-08 10:10:00'),
(9, 'user09', 'user09', '국밥러09', '국밥 순례자.', 'user09.png', 'normal', '2024-01-09 10:20:00'),
(10, 'user10', 'user10', '초밥러10', '초밥은 진리.', 'user10.png', 'vip', '2024-01-10 10:30:00'),
(11, 'user11', 'user11', '라멘러11', '라멘 맛집 위주로 다닙니다.', 'user11.png', 'normal', '2024-01-11 09:00:00'),
(12, 'user12', 'user12', '파스타러12', '파스타랑 와인 좋아해요.', 'user12.png', 'silver', '2024-01-12 09:10:00'),
(13, 'user13', 'user13', '치킨러13', '치킨은 진리입니다.', 'user13.png', 'gold', '2024-01-13 09:20:00'),
(14, 'user14', 'user14', '피자러14', '피자 맛집만 찾아다녀요.', 'user14.png', 'normal', '2024-01-14 09:30:00'),
(15, 'user15', 'user15', '디저트러15', '디저트 투어 중입니다.', 'user15.png', 'vip', '2024-01-15 09:40:00'),
(16, 'user16', 'user16', '술안주16', '술집 안주 맛집 위주.', 'user16.png', 'normal', '2024-01-16 09:50:00'),
(17, 'user17', 'user17', '분식왕17', '분식은 언제나 옳다.', 'user17.png', 'silver', '2024-01-17 10:00:00'),
(18, 'user18', 'user18', '배달러18', '배달 맛집 위주로 리뷰합니다.', 'user18.png', 'normal', '2024-01-18 10:10:00'),
(19, 'user19', 'user19', '노포러19', '노포 맛집 탐방이 취미.', 'user19.png', 'gold', '2024-01-19 10:20:00'),
(20, 'user20', 'user20', '비건러20', '비건 식당 찾아다녀요.', 'user20.png', 'normal', '2024-01-20 10:30:00'),
(21, 'user21', 'user21', '매운맛21', '매운 음식 도전 중.', 'user21.png', 'silver', '2024-01-21 10:40:00'),
(22, 'user22', 'user22', '담백러22', '자극 없는 음식 선호.', 'user22.png', 'normal', '2024-01-22 10:50:00'),
(23, 'user23', 'user23', '신상러23', '신상 맛집 빠르게 가봅니다.', 'user23.png', 'gold', '2024-01-23 11:00:00'),
(24, 'user24', 'user24', '사진러24', '맛집 사진 찍는 게 취미.', 'user24.png', 'normal', '2024-01-24 11:10:00'),
(25, 'user25', 'user25', '혼술러25', '혼술하기 좋은 곳 찾는 중.', 'user25.png', 'vip', '2024-01-25 11:20:00'),
(26, 'user26', 'user26', '브런치26', '브런치 맛집 좋아해요.', 'user26.png', 'normal', '2024-01-26 11:30:00'),
(27, 'user27', 'user27', '모임러27', '맛집 모임 환영합니다.', 'user27.png', 'silver', '2024-01-27 11:40:00'),
(28, 'user28', 'user28', '지도저장28', '지도에 맛집 저장 중.', 'user28.png', 'normal', '2024-01-28 11:50:00'),
(29, 'user29', 'user29', '원정러29', '멀어도 맛집이면 갑니다.', 'user29.png', 'gold', '2024-01-29 12:00:00'),
(30, 'user30', 'user30', '올드테이스트30', '옛날 감성 식당 좋아요.', 'user30.png', 'normal', '2024-01-30 12:10:00');

--
-- 덤프된 테이블의 인덱스
--

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
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `u_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '회원 번호', AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
