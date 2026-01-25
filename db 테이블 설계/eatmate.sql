-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 26-01-25 14:52
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

--
-- 테이블의 덤프 데이터 `board_community`
--

INSERT INTO `board_community` (`bc_no`, `bc_board_cate`, `bc_user_no`, `bc_title`, `bc_desc`, `bc_heart`, `bc_comment`, `bc_date`) VALUES
(1, 'community', 1, '요즘 핫한 맛집 추천', '최근에 다녀온 맛집 중에 제일 괜찮았던 곳 공유합니다.', 3, 1, '2024-01-11 18:10:00'),
(2, 'community', 2, '혼밥하기 좋은 곳 있나요?', '혼자 가도 눈치 안 보이는 식당 추천 부탁드려요.', 5, 2, '2024-01-12 12:30:00'),
(3, 'community', 3, '동네 숨은 맛집 발견', '우연히 발견한 동네 맛집인데 진짜 맛있어요.', 7, 3, '2024-01-13 19:45:00'),
(4, 'community', 4, '전국 맛집 리스트 공유', '제가 다녀온 맛집들 정리해봤어요.', 12, 5, '2024-01-14 21:00:00'),
(5, 'community', 5, '야식 추천 받습니다', '지금 이 시간에 먹기 좋은 야식 뭐가 있을까요?', 4, 1, '2024-01-15 23:20:00'),
(6, 'community', 6, '카페 투어 후기', '주말에 다녀온 카페 투어 후기 남깁니다.', 6, 2, '2024-01-16 16:40:00'),
(7, 'community', 7, '떡볶이 맛집 논쟁', '여러분이 생각하는 최고의 떡볶이는?', 9, 4, '2024-01-17 18:00:00'),
(8, 'community', 8, '고기 맛집 추천합니다', '고기 좋아하시는 분들 여기 꼭 가보세요.', 11, 3, '2024-01-18 20:10:00'),
(9, 'community', 9, '국밥 어디가 제일 맛있나요?', '국밥 투어 중인데 추천 부탁드려요.', 8, 2, '2024-01-19 07:50:00'),
(10, 'community', 10, '초밥 맛집 질문', '가성비 좋은 초밥집 아시는 분?', 10, 3, '2024-01-20 13:25:00'),
(11, 'community', 1, '맛집 사진 잘 찍는 법', '음식 사진 잘 찍는 팁 공유해요.', 6, 2, '2024-01-21 14:10:00'),
(12, 'community', 2, '혼밥러의 하루', '오늘 혼밥 후기 남깁니다.', 2, 0, '2024-01-22 12:05:00'),
(13, 'community', 3, '단골집 사장님 이야기', '단골집 사장님이 너무 친절하세요.', 5, 1, '2024-01-23 18:30:00'),
(14, 'community', 4, '맛집 원정 다녀왔어요', '멀리 다녀왔지만 후회 없는 선택!', 9, 2, '2024-01-24 20:40:00'),
(15, 'community', 5, '야식 고민 해결', '결국 치킨 먹었습니다.', 7, 1, '2024-01-25 23:55:00');

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

--
-- 테이블의 덤프 데이터 `board_meetup`
--

INSERT INTO `board_meetup` (`bm_no`, `bm_board_cate`, `bm_user_no`, `bm_img`, `bm_img2`, `bm_img3`, `bm_img4`, `bm_img5`, `bm_title`, `bm_desc`, `bm_m_date`, `bm_m_res`, `bm_m_people`, `bm_m_people_all`, `bm_heart`, `bm_comment`, `bm_date`) VALUES
(1, 'meetup', 1, '/img/meetup/m01.png', NULL, NULL, NULL, NULL, '주말 고기 맛집 탐방 같이 가요', '고기 좋아하시는 분들 주말에 같이 맛집 탐방해요.', '2024-02-03', '정육식당 한우집', 3, 5, 6, 2, '2024-01-20 18:10:00'),
(2, 'meetup', 2, '/img/meetup/m02.png', NULL, NULL, NULL, NULL, '혼밥러 환영 소규모 모임', '혼자 오셔도 부담 없는 소규모 탐방입니다.', '2024-02-05', '동네 백반집', 2, 4, 4, 1, '2024-01-21 12:40:00'),
(3, 'meetup', 3, '/img/meetup/m03.png', NULL, NULL, NULL, NULL, '숨은 맛집 같이 가실 분', '동네 숨은 맛집을 같이 가보려고 합니다.', '2024-02-07', '골목 식당', 4, 6, 7, 3, '2024-01-22 19:30:00'),
(4, 'meetup', 4, '/img/meetup/m04.png', NULL, NULL, NULL, NULL, '전국 맛집 원정 1차', '멀지만 정말 유명한 맛집입니다. 함께 가요!', '2024-02-10', '전주 비빔밥 명가', 5, 5, 12, 4, '2024-01-23 21:15:00'),
(5, 'meetup', 5, '/img/meetup/m05.png', NULL, NULL, NULL, NULL, '야식 맛집 탐방 모집', '늦은 시간 야식 맛집 탐방입니다.', '2024-02-01', '야식 포장마차', 3, 4, 5, 1, '2024-01-24 23:00:00'),
(6, 'meetup', 6, '/img/meetup/m06.png', NULL, NULL, NULL, NULL, '카페 투어 함께 하실 분', '분위기 좋은 카페 위주로 돌아봅니다.', '2024-02-04', '브런치 카페 거리', 4, 6, 8, 2, '2024-01-25 16:50:00'),
(7, 'meetup', 7, '/img/meetup/m07.png', NULL, NULL, NULL, NULL, '떡볶이 맛집 투어', '떡볶이 좋아하시는 분들 환영!', '2024-02-06', '즉석 떡볶이집', 5, 6, 10, 3, '2024-01-26 18:20:00'),
(8, 'meetup', 8, '/img/meetup/m08.png', NULL, NULL, NULL, NULL, '고기 러버 모임', '고기만 먹습니다. 설명 끝.', '2024-02-08', '숯불구이 전문점', 6, 6, 15, 5, '2024-01-27 20:30:00'),
(9, 'meetup', 9, '/img/meetup/m09.png', NULL, NULL, NULL, NULL, '국밥 투어 멤버 모집', '국밥 좋아하시는 분들 같이 가요.', '2024-02-02', '국밥 거리', 3, 5, 6, 1, '2024-01-28 08:10:00'),
(10, 'meetup', 10, '/img/meetup/m10.png', NULL, NULL, NULL, NULL, '초밥 맛집 탐방', '가성비 초밥집 탐방 모임입니다.', '2024-02-09', '초밥 전문점', 4, 5, 9, 2, '2024-01-29 13:40:00');

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

--
-- 테이블의 덤프 데이터 `board_review`
--

INSERT INTO `board_review` (`br_no`, `br_board_cate`, `br_user_no`, `br_rank`, `br_img`, `br_img2`, `br_img3`, `br_img4`, `br_img5`, `br_desc`, `br_rt_name`, `br_heart`, `br_comment`, `br_date`) VALUES
(1, 'review', 1, 4.5, '/img/review/r01.png', NULL, NULL, NULL, NULL, '고기 질도 좋고 직원분들도 친절했어요. 재방문 의사 있습니다.', '정육식당 한우집', 8, 2, '2024-01-11 19:10:00'),
(2, 'review', 2, 4.0, '/img/review/r02.png', NULL, NULL, NULL, NULL, '혼자 먹기 좋고 가격도 부담 없어요.', '동네 백반집', 5, 1, '2024-01-12 12:50:00'),
(3, 'review', 3, 4.8, '/img/review/r03.png', NULL, NULL, NULL, NULL, '진짜 숨은 맛집 인정합니다. 주변에 꼭 추천하고 싶어요.', '골목 식당', 12, 4, '2024-01-13 20:00:00'),
(4, 'review', 4, 5.0, '/img/review/r04.png', NULL, NULL, NULL, NULL, '왜 전국구 맛집인지 알겠어요. 멀어도 갈 가치 있습니다.', '전주 비빔밥 명가', 18, 6, '2024-01-14 21:30:00'),
(5, 'review', 5, 3.8, '/img/review/r05.png', NULL, NULL, NULL, NULL, '야식으로 딱 좋았어요. 분위기는 살짝 아쉬움.', '야식 포장마차', 4, 1, '2024-01-15 23:40:00'),
(6, 'review', 6, 4.2, '/img/review/r06.png', NULL, NULL, NULL, NULL, '카페 분위기 좋고 사진 찍기 좋아요.', '브런치 카페 거리', 7, 2, '2024-01-16 17:10:00'),
(7, 'review', 7, 4.6, '/img/review/r07.png', NULL, NULL, NULL, NULL, '떡볶이 매콤달콤 최고입니다.', '즉석 떡볶이집', 10, 3, '2024-01-17 18:40:00'),
(8, 'review', 8, 4.9, '/img/review/r08.png', NULL, NULL, NULL, NULL, '고기 좋아하는 분들이면 무조건 만족할 곳.', '숯불구이 전문점', 15, 5, '2024-01-18 20:50:00'),
(9, 'review', 9, 4.1, '/img/review/r09.png', NULL, NULL, NULL, NULL, '국밥 국물이 진하고 든든합니다.', '국밥 거리', 6, 2, '2024-01-19 08:20:00'),
(10, 'review', 10, 4.4, '/img/review/r10.png', NULL, NULL, NULL, NULL, '가격 대비 퀄리티 괜찮았어요.', '초밥 전문점', 9, 3, '2024-01-20 13:50:00'),
(11, 'review', 1, 4.3, '/img/review/r11.png', NULL, NULL, NULL, NULL, '두 번째 방문인데 역시 만족스러웠어요.', '정육식당 한우집', 6, 1, '2024-01-21 19:20:00'),
(12, 'review', 3, 4.7, '/img/review/r12.png', NULL, NULL, NULL, NULL, '메뉴 구성도 좋고 가성비가 뛰어납니다.', '골목 식당', 11, 3, '2024-01-22 18:10:00');

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

--
-- 테이블의 덤프 데이터 `comment`
--

INSERT INTO `comment` (`ct_no`, `ct_user_no`, `ct_board_cate`, `ct_board_no`, `ct_desc`, `ct_date`) VALUES
(1, 2, 'community', 1, '저도 그 집 가봤는데 괜찮더라구요!', '2024-01-11 19:00:00'),
(2, 3, 'community', 1, '추천 감사합니다. 리스트에 추가했어요.', '2024-01-11 19:10:00'),
(3, 1, 'community', 2, '혼밥하기 좋은 곳 진짜 중요하죠.', '2024-01-12 12:45:00'),
(4, 4, 'community', 2, '백반집 추천드려요!', '2024-01-12 13:00:00'),
(5, 5, 'community', 3, '이런 정보 너무 좋아요.', '2024-01-13 20:00:00'),
(6, 6, 'community', 3, '숨은 맛집 최고죠.', '2024-01-13 20:15:00'),
(7, 7, 'community', 4, '정리 감사합니다. 저장했어요.', '2024-01-14 21:20:00'),
(8, 8, 'community', 4, '와… 리스트 엄청나네요.', '2024-01-14 21:40:00'),
(9, 3, 'meetup', 1, '이 모임 아직 자리 있나요?', '2024-01-20 19:00:00'),
(10, 5, 'meetup', 1, '고기라면 무조건 참여합니다!', '2024-01-20 19:10:00'),
(11, 1, 'meetup', 2, '소규모라서 좋네요.', '2024-01-21 13:00:00'),
(12, 4, 'meetup', 2, '혼자 가도 괜찮을까요?', '2024-01-21 13:10:00'),
(13, 6, 'meetup', 3, '여기 저도 가보고 싶었어요.', '2024-01-22 20:00:00'),
(14, 7, 'meetup', 3, '시간 맞으면 참여할게요.', '2024-01-22 20:15:00'),
(15, 8, 'meetup', 4, '원정까지 가는 모임 멋지네요.', '2024-01-23 21:30:00'),
(16, 2, 'review', 1, '사진만 봐도 맛있어 보이네요.', '2024-01-11 20:00:00'),
(17, 4, 'review', 1, '가격대는 어떤가요?', '2024-01-11 20:10:00'),
(18, 1, 'review', 3, '이 집 진짜 인정입니다.', '2024-01-13 20:20:00'),
(19, 5, 'review', 3, '가성비 좋아 보이네요.', '2024-01-13 20:30:00'),
(20, 6, 'review', 4, '전주 가면 꼭 가야겠어요.', '2024-01-14 21:50:00'),
(21, 7, 'review', 7, '떡볶이 사진 보고 바로 저장했습니다.', '2024-01-17 19:00:00'),
(22, 9, 'review', 8, '고기 상태가 진짜 좋아 보이네요.', '2024-01-18 21:00:00'),
(23, 10, 'review', 10, '가성비 중요하죠 👍', '2024-01-20 14:00:00');

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

--
-- 테이블의 덤프 데이터 `restaurant`
--

INSERT INTO `restaurant` (`rt_no`, `rt_img`, `rt_img2`, `rt_img3`, `rt_img4`, `rt_img5`, `rt_name`, `rt_desc`, `rt_rank`, `rt_review`, `rt_cate`, `rt_location`, `rt_tel`, `rt_map`, `rt_date`) VALUES
(1, '/img/restaurant/rt01.png', NULL, NULL, NULL, NULL, '정육식당 한우집', '한우 전문 정육식당 컨셉으로 신선한 고기를 합리적인 가격에 즐길 수 있는 곳입니다.', 4.4, 2, '고기', '서울시 강남구 역삼동', '02-1000-0001', NULL, '2024-01-20 18:05:00'),
(2, '/img/restaurant/rt02.png', NULL, NULL, NULL, NULL, '동네 백반집', '혼밥도 편한 백반/정식 위주의 든든한 한 끼를 제공하는 곳입니다.', 4.0, 1, '한식', '서울시 마포구 합정동', '02-1000-0002', NULL, '2024-01-21 12:35:00'),
(3, '/img/restaurant/rt03.png', NULL, NULL, NULL, NULL, '골목 식당', '동네 숨은 맛집 스타일로 반찬 구성과 가성비가 좋은 식당입니다.', 4.8, 2, '한식', '서울시 성동구 성수동', '02-1000-0003', NULL, '2024-01-22 19:25:00'),
(4, '/img/restaurant/rt04.png', NULL, NULL, NULL, NULL, '전주 비빔밥 명가', '전주 스타일 비빔밥을 제대로 즐길 수 있는 대표 메뉴 중심의 맛집입니다.', 5.0, 1, '한식', '전북 전주시 완산구', '063-1000-0004', NULL, '2024-01-23 21:05:00'),
(5, '/img/restaurant/rt05.png', NULL, NULL, NULL, NULL, '야식 포장마차', '늦은 시간 가볍게 즐기기 좋은 야식/안주 메뉴가 많은 포장마차입니다.', 3.8, 1, '야식', '서울시 영등포구 여의도동', '02-1000-0005', NULL, '2024-01-24 22:55:00'),
(6, '/img/restaurant/rt06.png', NULL, NULL, NULL, NULL, '브런치 카페 거리', '브런치와 커피를 함께 즐길 수 있는 감성 카페/브런치 라인업이 좋은 곳입니다.', 4.2, 1, '카페', '서울시 서초구 반포동', '02-1000-0006', NULL, '2024-01-25 16:45:00'),
(7, '/img/restaurant/rt07.png', NULL, NULL, NULL, NULL, '즉석 떡볶이집', '즉석 떡볶이 특유의 매콤달콤한 맛을 즐길 수 있는 분식 맛집입니다.', 4.6, 1, '분식', '서울시 종로구 혜화동', '02-1000-0007', NULL, '2024-01-26 18:15:00'),
(8, '/img/restaurant/rt08.png', NULL, NULL, NULL, NULL, '숯불구이 전문점', '숯불 향이 좋은 구이 메뉴 위주로 만족도가 높은 고기 맛집입니다.', 4.9, 1, '고기', '서울시 송파구 잠실동', '02-1000-0008', NULL, '2024-01-27 20:25:00'),
(9, '/img/restaurant/rt09.png', NULL, NULL, NULL, NULL, '국밥 거리', '진한 국물의 국밥을 든든하게 즐길 수 있는 국밥 전문 라인업이 있는 곳입니다.', 4.1, 1, '한식', '부산시 부산진구 서면', '051-1000-0009', NULL, '2024-01-28 08:05:00'),
(10, '/img/restaurant/rt10.png', NULL, NULL, NULL, NULL, '초밥 전문점', '가성비 좋은 초밥 구성과 깔끔한 맛으로 만족도가 높은 초밥집입니다.', 4.4, 1, '일식', '서울시 중구 명동', '02-1000-0010', NULL, '2024-01-29 13:35:00');

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
(1, 'user01', 'user01', '먹방러01', '맛집 탐방을 좋아합니다.', '/img/user/user01.png', 'normal', '2024-01-01 09:00:00'),
(2, 'user02', 'user02', '혼밥러02', '혼자 먹는 것도 좋아요.', '/img/user/user02.png', 'normal', '2024-01-02 09:10:00'),
(3, 'user03', 'user03', '단골러03', '동네 맛집 전문입니다.', '/img/user/user03.png', 'silver', '2024-01-03 09:20:00'),
(4, 'user04', 'user04', '미식가04', '전국 맛집 도장깨기!', '/img/user/user04.png', 'gold', '2024-01-04 09:30:00'),
(5, 'user05', 'user05', '야식러05', '야식은 못 참죠.', '/img/user/user05.png', 'normal', '2024-01-05 09:40:00'),
(6, 'user06', 'user06', '카페덕후06', '카페 투어가 취미.', '/img/user/user06.png', 'normal', '2024-01-06 09:50:00'),
(7, 'user07', 'user07', '분식러07', '떡볶이는 사랑.', '/img/user/user07.png', 'silver', '2024-01-07 10:00:00'),
(8, 'user08', 'user08', '고기러08', '고기만 보면 행복.', '/img/user/user08.png', 'gold', '2024-01-08 10:10:00'),
(9, 'user09', 'user09', '국밥러09', '국밥 순례자.', '/img/user/user09.png', 'normal', '2024-01-09 10:20:00'),
(10, 'user10', 'user10', '초밥러10', '초밥은 진리.', '/img/user/user10.png', 'vip', '2024-01-10 10:30:00');

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
  MODIFY `bc_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '자유게시판 게시글 번호', AUTO_INCREMENT=16;

--
-- 테이블의 AUTO_INCREMENT `board_meetup`
--
ALTER TABLE `board_meetup`
  MODIFY `bm_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '탐방 게시글 번호';

--
-- 테이블의 AUTO_INCREMENT `board_review`
--
ALTER TABLE `board_review`
  MODIFY `br_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '리뷰 게시글 번호', AUTO_INCREMENT=13;

--
-- 테이블의 AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `ct_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '댓글 번호', AUTO_INCREMENT=24;

--
-- 테이블의 AUTO_INCREMENT `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rt_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '맛집 번호', AUTO_INCREMENT=11;

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `u_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '회원 번호', AUTO_INCREMENT=11;

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
