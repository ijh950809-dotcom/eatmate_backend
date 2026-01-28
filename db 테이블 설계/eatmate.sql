-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 26-01-28 03:56
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
  `br_rank` int(11) NOT NULL COMMENT '평점',
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
(1, 'review', 1, 5, 'r01.jpeg', NULL, NULL, NULL, NULL, '고기 질도 좋고 직원분들도 친절했어요. 재방문 의사 있습니다.', '정육식당 한우집', 8, 2, '2024-01-11 19:10:00'),
(2, 'review', 2, 4, 'r02.jpeg', NULL, NULL, NULL, NULL, '혼자 먹기 좋고 가격도 부담 없어요.', '동네 백반집', 5, 1, '2024-01-12 12:50:00'),
(3, 'review', 3, 5, 'r03.jpeg', NULL, NULL, NULL, NULL, '진짜 숨은 맛집 인정합니다. 주변에 꼭 추천하고 싶어요.', '골목 식당', 12, 4, '2024-01-13 20:00:00'),
(4, 'review', 4, 5, 'r04.jpeg', NULL, NULL, NULL, NULL, '왜 전국구 맛집인지 알겠어요. 멀어도 갈 가치 있습니다.', '전주 비빔밥 명가', 18, 6, '2024-01-14 21:30:00'),
(5, 'review', 5, 4, 'r05.jpeg', NULL, NULL, NULL, NULL, '야식으로 딱 좋았어요. 분위기는 살짝 아쉬움.', '야식 포장마차', 4, 1, '2024-01-15 23:40:00'),
(6, 'review', 6, 4, 'r06.jpeg', NULL, NULL, NULL, NULL, '카페 분위기 좋고 사진 찍기 좋아요.', '브런치 카페 거리', 7, 2, '2024-01-16 17:10:00'),
(7, 'review', 7, 5, 'r07.jpeg', NULL, NULL, NULL, NULL, '떡볶이 매콤달콤 최고입니다.', '즉석 떡볶이집', 10, 3, '2024-01-17 18:40:00'),
(8, 'review', 8, 5, 'r08.jpeg', NULL, NULL, NULL, NULL, '고기 좋아하는 분들이면 무조건 만족할 곳.', '숯불구이 전문점', 15, 5, '2024-01-18 20:50:00'),
(9, 'review', 9, 4, 'r09.jpeg', NULL, NULL, NULL, NULL, '국밥 국물이 진하고 든든합니다.', '국밥 거리', 6, 2, '2024-01-19 08:20:00'),
(10, 'review', 10, 4, 'r10.jpeg', NULL, NULL, NULL, NULL, '가격 대비 퀄리티 괜찮았어요.', '초밥 전문점', 9, 3, '2024-01-20 13:50:00'),
(11, 'review', 1, 4, 'r11.jpeg', NULL, NULL, NULL, NULL, '두 번째 방문인데 역시 만족스러웠어요.', '정육식당 한우집', 6, 1, '2024-01-21 19:20:00'),
(12, 'review', 3, 5, 'r12.jpeg', NULL, NULL, NULL, NULL, '메뉴 구성도 좋고 가성비가 뛰어납니다.', '골목 식당', 11, 3, '2024-01-22 18:10:00'),
(13, 'review', 11, 4, 'r13.jpeg', NULL, NULL, NULL, NULL, '집밥 느낌이라 편하게 먹기 좋았어요.', '할머니 손맛 식당', 5, 1, '2024-01-23 12:10:00'),
(14, 'review', 12, 5, 'r14.jpeg', NULL, NULL, NULL, NULL, '국물이 진하고 반찬도 훌륭했습니다.', '뚝배기 정식집', 9, 3, '2024-01-23 18:40:00'),
(15, 'review', 13, 4, 'r15.jpeg', NULL, NULL, NULL, NULL, '반찬 가짓수가 많아서 만족했어요.', '시골밥상', 7, 2, '2024-01-24 13:20:00'),
(16, 'review', 14, 4, 'r16.jpeg', NULL, NULL, NULL, NULL, '전체적으로 깔끔하고 정갈한 맛입니다.', '한상차림', 6, 1, '2024-01-24 19:10:00'),
(17, 'review', 15, 5, 'r17.jpeg', NULL, NULL, NULL, NULL, '된장찌개가 진짜 밥도둑이에요.', '된장마을', 11, 4, '2024-01-25 12:30:00'),
(18, 'review', 16, 4, 'r18.jpeg', NULL, NULL, NULL, NULL, '김치찌개 맛집 인정합니다.', '김치명가', 8, 2, '2024-01-25 18:50:00'),
(19, 'review', 17, 5, 'r19.jpeg', NULL, NULL, NULL, NULL, '24시간이라 언제 가도 든든해요.', '국밥사랑', 10, 3, '2024-01-26 01:10:00'),
(20, 'review', 18, 4, 'r20.jpeg', NULL, NULL, NULL, NULL, '돌솥비빔밥이 고소하고 맛있어요.', '돌솥비빔', 6, 1, '2024-01-26 13:40:00'),
(21, 'review', 19, 4, 'r21.jpeg', NULL, NULL, NULL, NULL, '집 근처라 자주 가게 됩니다.', '고향식당', 5, 1, '2024-01-27 18:20:00'),
(22, 'review', 20, 3, 'r22.jpeg', NULL, NULL, NULL, NULL, '무난한 한식집이에요.', '한식부엌', 3, 0, '2024-01-27 19:30:00'),
(23, 'review', 21, 5, 'r23.jpeg', NULL, NULL, NULL, NULL, '고기 질이 여전히 최고네요.', '정육식당 한우집', 12, 4, '2024-01-28 20:10:00'),
(24, 'review', 22, 4, 'r24.jpeg', NULL, NULL, NULL, NULL, '혼밥하기 좋아서 자주 옵니다.', '동네 백반집', 6, 1, '2024-01-28 12:00:00'),
(25, 'review', 23, 5, 'r25.jpeg', NULL, NULL, NULL, NULL, '여긴 진짜 숨은 맛집이에요.', '골목 식당', 14, 5, '2024-01-29 19:50:00'),
(26, 'review', 24, 5, 'r26.jpeg', NULL, NULL, NULL, NULL, '전주 가면 무조건 여기 갑니다.', '전주 비빔밥 명가', 13, 4, '2024-01-30 13:10:00'),
(27, 'review', 25, 4, 'r27.jpeg', NULL, NULL, NULL, NULL, '야식으로 딱이에요.', '야식 포장마차', 5, 1, '2024-01-30 23:20:00'),
(28, 'review', 26, 4, 'r28.jpeg', NULL, NULL, NULL, NULL, '브런치 메뉴 구성이 좋아요.', '브런치 카페 거리', 7, 2, '2024-01-31 11:40:00'),
(29, 'review', 27, 5, 'r29.jpeg', NULL, NULL, NULL, NULL, '분식 좋아하면 무조건 추천.', '즉석 떡볶이집', 9, 3, '2024-01-31 18:10:00'),
(30, 'review', 28, 5, 'r30.jpeg', NULL, NULL, NULL, NULL, '고기 굽는 맛이 확실히 달라요.', '숯불구이 전문점', 11, 4, '2024-02-01 20:30:00'),
(31, 'review', 29, 4, 'r31.jpeg', NULL, NULL, NULL, NULL, '국밥 좋아하면 만족할 맛.', '국밥 거리', 6, 2, '2024-02-01 08:20:00'),
(32, 'review', 30, 4, 'r32.jpeg', NULL, NULL, NULL, NULL, '가성비 좋은 초밥집이에요.', '초밥 전문점', 8, 3, '2024-02-01 13:50:00'),
(33, 'review', 7, 5, 'r33.jpeg', NULL, NULL, NULL, NULL, '반찬이 푸짐하고 간도 딱 좋았어요.', '시골밥상', 9, 3, '2024-02-02 12:20:00'),
(34, 'review', 12, 4, 'r34.jpeg', NULL, NULL, NULL, NULL, '된장찌개가 진하고 밥이 술술 들어갑니다.', '된장마을', 7, 2, '2024-02-02 19:10:00'),
(35, 'review', 18, 4, 'r35.jpeg', NULL, NULL, NULL, NULL, '정갈한 한 상이라 부모님 모시고 가기 좋아요.', '한상차림', 5, 1, '2024-02-03 13:05:00'),
(36, 'review', 9, 5, 'r36.jpeg', NULL, NULL, NULL, NULL, '스시 구성도 좋고 회가 신선했어요.', '사쿠라 스시', 12, 4, '2024-02-03 18:40:00'),
(37, 'review', 21, 4, 'r37.jpeg', NULL, NULL, NULL, NULL, '국물 진하고 면도 탱글해서 만족.', '라멘공방', 8, 2, '2024-02-04 12:30:00'),
(38, 'review', 4, 4, 'r38.jpeg', NULL, NULL, NULL, NULL, '돈카츠 바삭하고 소스도 맛있네요.', '가츠하우스', 6, 1, '2024-02-04 19:20:00'),
(39, 'review', 15, 4, 'r39.jpeg', NULL, NULL, NULL, NULL, '불맛 제대로라 볶음밥도 강추.', '홍콩반점', 9, 2, '2024-02-05 13:10:00'),
(40, 'review', 27, 5, 'r40.jpeg', NULL, NULL, NULL, NULL, '마라 향이 적당하고 재료도 신선했어요.', '마라천국', 11, 3, '2024-02-05 19:05:00'),
(41, 'review', 2, 4, 'r41.jpeg', NULL, NULL, NULL, NULL, '딤섬이 촉촉하고 종류도 다양합니다.', '딤섬가든', 7, 1, '2024-02-06 12:40:00'),
(42, 'review', 10, 5, 'r42.jpeg', NULL, NULL, NULL, NULL, '스테이크 굽기 완벽하고 소스가 좋아요.', '스테이크하우스', 14, 5, '2024-02-06 20:10:00'),
(43, 'review', 23, 4, 'r43.jpeg', NULL, NULL, NULL, NULL, '파스타 면 식감 좋고 전체적으로 깔끔.', '파스타룸', 8, 2, '2024-02-07 18:10:00'),
(44, 'review', 6, 4, 'r44.jpeg', NULL, NULL, NULL, NULL, '수제버거 패티가 두툼해서 만족!', '버거스팟', 9, 2, '2024-02-07 12:20:00'),
(45, 'review', 5, 5, 'r45.jpeg', NULL, NULL, NULL, NULL, '떡볶이 양념이 진짜 중독적이에요.', '국민떡볶이', 13, 4, '2024-02-08 18:30:00'),
(46, 'review', 17, 4, 'r46.jpeg', NULL, NULL, NULL, NULL, '튀김 바삭하고 모둠 구성이 좋습니다.', '튀김골목', 7, 2, '2024-02-08 19:10:00'),
(47, 'review', 1, 4, 'r47.jpeg', NULL, NULL, NULL, NULL, '떡튀순 세트로 먹으면 완전 국룰.', '떡튀순집', 10, 3, '2024-02-09 12:10:00'),
(48, 'review', 14, 4, 'r48.jpeg', NULL, NULL, NULL, NULL, '라떼가 부드럽고 작업하기 좋아요.', '라떼하우스', 6, 1, '2024-02-09 15:20:00'),
(49, 'review', 29, 5, 'r49.jpeg', NULL, NULL, NULL, NULL, '원두 향이 좋고 드립 메뉴 추천합니다.', '브루잉랩', 9, 2, '2024-02-10 11:05:00'),
(50, 'review', 20, 5, 'r50.jpeg', NULL, NULL, NULL, NULL, '수제 케이크라 그런지 크림이 안 느끼해요.', '케이크공방', 12, 4, '2024-02-10 16:40:00'),
(51, 'review', 3, 4, 'r51.jpeg', NULL, NULL, NULL, NULL, '마카롱 꼬끄 쫀득하고 필링이 과하지 않아요.', '마카롱샵', 7, 2, '2024-02-11 14:15:00'),
(52, 'review', 25, 4, 'r52.jpeg', NULL, NULL, NULL, NULL, '여러 메뉴를 한 번에 즐길 수 있어서 좋아요.', '글로벌푸드', 6, 1, '2024-02-11 18:10:00');

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
(10, '/img/restaurant/rt10.png', NULL, NULL, NULL, NULL, '초밥 전문점', '가성비 좋은 초밥 구성과 깔끔한 맛으로 만족도가 높은 초밥집입니다.', 4.4, 1, '일식', '서울시 중구 명동', '02-1000-0010', NULL, '2024-01-29 13:35:00'),
(11, '/img/restaurant/kr01.png', NULL, NULL, NULL, NULL, '할머니 손맛 식당', '집밥 같은 한식을 제공하는 식당', 4.3, 25, '한식', '서울시 종로구 익선동', '02-2000-0001', NULL, '2026-01-27 11:53:47'),
(12, '/img/restaurant/kr02.png', NULL, NULL, NULL, NULL, '뚝배기 정식집', '뚝배기 위주의 든든한 한식', 4.1, 18, '한식', '서울시 마포구 연남동', '02-2000-0002', NULL, '2026-01-27 11:53:47'),
(13, '/img/restaurant/kr03.png', NULL, NULL, NULL, NULL, '시골밥상', '반찬이 푸짐한 백반집', 4.5, 42, '한식', '서울시 강서구 화곡동', '02-2000-0003', NULL, '2026-01-27 11:53:47'),
(14, '/img/restaurant/kr04.png', NULL, NULL, NULL, NULL, '한상차림', '정갈한 상차림이 특징', 4.0, 15, '한식', '서울시 서대문구 홍제동', '02-2000-0004', NULL, '2026-01-27 11:53:47'),
(15, '/img/restaurant/kr05.png', NULL, NULL, NULL, NULL, '된장마을', '구수한 된장찌개 전문', 4.6, 38, '한식', '서울시 성동구 성수동', '02-2000-0005', NULL, '2026-01-27 11:53:47'),
(16, '/img/restaurant/kr06.png', NULL, NULL, NULL, NULL, '김치명가', '김치찌개 전문점', 4.2, 22, '한식', '서울시 동대문구 회기동', '02-2000-0006', NULL, '2026-01-27 11:53:47'),
(17, '/img/restaurant/kr07.png', NULL, NULL, NULL, NULL, '국밥사랑', '24시간 국밥집', 4.4, 51, '한식', '부산시 부산진구 서면', '051-2000-0007', NULL, '2026-01-27 11:53:47'),
(18, '/img/restaurant/kr08.png', NULL, NULL, NULL, NULL, '돌솥비빔', '돌솥비빔밥 전문', 4.1, 19, '한식', '전주시 완산구', '063-2000-0008', NULL, '2026-01-27 11:53:47'),
(19, '/img/restaurant/kr09.png', NULL, NULL, NULL, NULL, '고향식당', '집밥 감성 한식', 4.3, 27, '한식', '대구시 수성구', '053-2000-0009', NULL, '2026-01-27 11:53:47'),
(20, '/img/restaurant/kr10.png', NULL, NULL, NULL, NULL, '한식부엌', '깔끔한 한식 메뉴', 3.9, 11, '한식', '서울시 노원구 공릉동', '02-2000-0010', NULL, '2026-01-27 11:53:47'),
(21, '/img/restaurant/jp01.png', NULL, NULL, NULL, NULL, '사쿠라 스시', '신선한 초밥 전문점', 4.6, 44, '일식', '서울시 강남구 논현동', '02-3000-0001', NULL, '2026-01-27 11:53:47'),
(22, '/img/restaurant/jp02.png', NULL, NULL, NULL, NULL, '라멘공방', '진한 국물의 일본 라멘', 4.5, 39, '일식', '서울시 마포구 합정동', '02-3000-0002', NULL, '2026-01-27 11:53:47'),
(23, '/img/restaurant/jp03.png', NULL, NULL, NULL, NULL, '우동집', '수타 우동 전문', 4.1, 20, '일식', '서울시 용산구 이태원', '02-3000-0003', NULL, '2026-01-27 11:53:47'),
(24, '/img/restaurant/jp04.png', NULL, NULL, NULL, NULL, '가츠하우스', '돈카츠 전문점', 4.4, 33, '일식', '서울시 송파구 잠실동', '02-3000-0004', NULL, '2026-01-27 11:53:47'),
(25, '/img/restaurant/jp05.png', NULL, NULL, NULL, NULL, '오마카세진', '오마카세 코스 제공', 4.8, 52, '일식', '서울시 강남구 청담동', '02-3000-0005', NULL, '2026-01-27 11:53:47'),
(26, '/img/restaurant/jp06.png', NULL, NULL, NULL, NULL, '텐동야', '바삭한 텐동 전문', 4.2, 21, '일식', '서울시 영등포구 문래동', '02-3000-0006', NULL, '2026-01-27 11:53:47'),
(27, '/img/restaurant/jp07.png', NULL, NULL, NULL, NULL, '스시노미', '가성비 초밥집', 4.0, 17, '일식', '서울시 동작구 사당동', '02-3000-0007', NULL, '2026-01-27 11:53:47'),
(28, '/img/restaurant/jp08.png', NULL, NULL, NULL, NULL, '이자카야밤', '술안주 위주 일식', 4.3, 29, '일식', '서울시 중구 을지로', '02-3000-0008', NULL, '2026-01-27 11:53:47'),
(29, '/img/restaurant/jp09.png', NULL, NULL, NULL, NULL, '카레하우스', '일본식 카레 전문', 4.1, 16, '일식', '서울시 관악구 봉천동', '02-3000-0009', NULL, '2026-01-27 11:53:47'),
(30, '/img/restaurant/jp10.png', NULL, NULL, NULL, NULL, '스시마루', '동네 초밥집', 3.9, 12, '일식', '서울시 광진구 구의동', '02-3000-0010', NULL, '2026-01-27 11:53:47'),
(31, '/img/restaurant/ch01.png', NULL, NULL, NULL, NULL, '중화반점', '전통 중식당', 4.2, 35, '중식', '서울시 중구 신당동', '02-4000-0001', NULL, '2026-01-27 11:53:47'),
(32, '/img/restaurant/ch02.png', NULL, NULL, NULL, NULL, '짜장면집', '짜장면 전문', 4.0, 28, '중식', '서울시 동대문구 답십리', '02-4000-0002', NULL, '2026-01-27 11:53:47'),
(33, '/img/restaurant/ch03.png', NULL, NULL, NULL, NULL, '홍콩반점', '불맛 중식', 4.3, 41, '중식', '서울시 강서구 마곡동', '02-4000-0003', NULL, '2026-01-27 11:53:47'),
(34, '/img/restaurant/ch04.png', NULL, NULL, NULL, NULL, '마라천국', '마라 요리 전문', 4.5, 37, '중식', '서울시 성북구 안암동', '02-4000-0004', NULL, '2026-01-27 11:53:47'),
(35, '/img/restaurant/ch05.png', NULL, NULL, NULL, NULL, '양꼬치왕', '양꼬치 전문', 4.4, 46, '중식', '서울시 구로구 가산동', '02-4000-0005', NULL, '2026-01-27 11:53:47'),
(36, '/img/restaurant/ch06.png', NULL, NULL, NULL, NULL, '딤섬가든', '딤섬 전문점', 4.1, 23, '중식', '서울시 강남구 삼성동', '02-4000-0006', NULL, '2026-01-27 11:53:47'),
(37, '/img/restaurant/ch07.png', NULL, NULL, NULL, NULL, '차이나하우스', '코스 중식', 4.6, 55, '중식', '서울시 서초구 반포동', '02-4000-0007', NULL, '2026-01-27 11:53:47'),
(38, '/img/restaurant/ch08.png', NULL, NULL, NULL, NULL, '마라탕집', '마라탕 위주', 4.0, 19, '중식', '서울시 노원구 상계동', '02-4000-0008', NULL, '2026-01-27 11:53:47'),
(39, '/img/restaurant/ch09.png', NULL, NULL, NULL, NULL, '훠궈천국', '훠궈 전문', 4.3, 34, '중식', '서울시 용산구 한남동', '02-4000-0009', NULL, '2026-01-27 11:53:47'),
(40, '/img/restaurant/ch10.png', NULL, NULL, NULL, NULL, '중식포차', '중식 안주집', 3.8, 14, '중식', '서울시 금천구 독산동', '02-4000-0010', NULL, '2026-01-27 11:53:47'),
(41, '/img/restaurant/ws01.png', NULL, NULL, NULL, NULL, '이탈리안 키친', '파스타와 피자가 주력인 이탈리안 레스토랑', 4.4, 36, '양식', '서울시 강남구 신사동', '02-5000-0001', NULL, '2026-01-27 11:53:47'),
(42, '/img/restaurant/ws02.png', NULL, NULL, NULL, NULL, '스테이크하우스', '숙성 스테이크 전문', 4.6, 48, '양식', '서울시 서초구 반포동', '02-5000-0002', NULL, '2026-01-27 11:53:47'),
(43, '/img/restaurant/ws03.png', NULL, NULL, NULL, NULL, '브런치테이블', '브런치 메뉴가 인기', 4.2, 27, '양식', '서울시 마포구 상수동', '02-5000-0003', NULL, '2026-01-27 11:53:47'),
(44, '/img/restaurant/ws04.png', NULL, NULL, NULL, NULL, '파스타룸', '수제 파스타 전문점', 4.3, 31, '양식', '서울시 용산구 한남동', '02-5000-0004', NULL, '2026-01-27 11:53:47'),
(45, '/img/restaurant/ws05.png', NULL, NULL, NULL, NULL, '피자마켓', '화덕 피자 맛집', 4.1, 22, '양식', '서울시 광진구 건대입구', '02-5000-0005', NULL, '2026-01-27 11:53:47'),
(46, '/img/restaurant/ws06.png', NULL, NULL, NULL, NULL, '그릴앤바', '그릴 요리와 와인', 4.5, 40, '양식', '서울시 중구 을지로', '02-5000-0006', NULL, '2026-01-27 11:53:47'),
(47, '/img/restaurant/ws07.png', NULL, NULL, NULL, NULL, '샐러드팩토리', '건강식 샐러드 전문', 4.0, 18, '양식', '서울시 송파구 문정동', '02-5000-0007', NULL, '2026-01-27 11:53:47'),
(48, '/img/restaurant/ws08.png', NULL, NULL, NULL, NULL, '버거스팟', '수제버거 전문점', 4.3, 29, '양식', '서울시 성동구 성수동', '02-5000-0008', NULL, '2026-01-27 11:53:47'),
(49, '/img/restaurant/ws09.png', NULL, NULL, NULL, NULL, '와인비스트로', '와인과 양식 안주', 4.4, 34, '양식', '서울시 종로구 삼청동', '02-5000-0009', NULL, '2026-01-27 11:53:47'),
(50, '/img/restaurant/ws10.png', NULL, NULL, NULL, NULL, '크림파스타집', '크림 파스타 특화', 3.9, 15, '양식', '서울시 동작구 흑석동', '02-5000-0010', NULL, '2026-01-27 11:53:47'),
(51, '/img/restaurant/sn01.png', NULL, NULL, NULL, NULL, '국민떡볶이', '매콤달콤 떡볶이', 4.5, 60, '분식', '서울시 종로구 혜화동', '02-6000-0001', NULL, '2026-01-27 11:53:47'),
(52, '/img/restaurant/sn02.png', NULL, NULL, NULL, NULL, '김밥천국', '김밥과 분식 종합', 4.0, 45, '분식', '서울시 마포구 망원동', '02-6000-0002', NULL, '2026-01-27 11:53:47'),
(53, '/img/restaurant/sn03.png', NULL, NULL, NULL, NULL, '분식연구소', '즉석 분식 전문', 4.3, 33, '분식', '서울시 노원구 공릉동', '02-6000-0003', NULL, '2026-01-27 11:53:47'),
(54, '/img/restaurant/sn04.png', NULL, NULL, NULL, NULL, '라볶이집', '라볶이 특화', 4.1, 26, '분식', '서울시 강서구 화곡동', '02-6000-0004', NULL, '2026-01-27 11:53:47'),
(55, '/img/restaurant/sn05.png', NULL, NULL, NULL, NULL, '튀김골목', '튀김 모둠 인기', 4.4, 38, '분식', '서울시 동대문구 제기동', '02-6000-0005', NULL, '2026-01-27 11:53:47'),
(56, '/img/restaurant/sn06.png', NULL, NULL, NULL, NULL, '순대마을', '순대국/순대', 4.2, 41, '분식', '서울시 영등포구 신길동', '02-6000-0006', NULL, '2026-01-27 11:53:47'),
(57, '/img/restaurant/sn07.png', NULL, NULL, NULL, NULL, '어묵바', '부산식 어묵', 4.3, 29, '분식', '부산시 해운대구', '051-6000-0007', NULL, '2026-01-27 11:53:47'),
(58, '/img/restaurant/sn08.png', NULL, NULL, NULL, NULL, '컵밥스토리', '컵밥 전문', 3.9, 17, '분식', '서울시 관악구 신림동', '02-6000-0008', NULL, '2026-01-27 11:53:47'),
(59, '/img/restaurant/sn09.png', NULL, NULL, NULL, NULL, '떡튀순집', '떡튀순 세트', 4.6, 52, '분식', '서울시 중랑구 면목동', '02-6000-0009', NULL, '2026-01-27 11:53:47'),
(60, '/img/restaurant/sn10.png', NULL, NULL, NULL, NULL, '야시장분식', '포장마차 감성', 4.1, 24, '분식', '서울시 중구 명동', '02-6000-0010', NULL, '2026-01-27 11:53:47'),
(61, '/img/restaurant/cf01.png', NULL, NULL, NULL, NULL, '모닝커피', '테이크아웃 전문 카페', 4.0, 30, '카페', '서울시 강남구 역삼동', '02-7000-0001', NULL, '2026-01-27 11:53:47'),
(62, '/img/restaurant/cf02.png', NULL, NULL, NULL, NULL, '라떼하우스', '라떼 메뉴 특화', 4.3, 42, '카페', '서울시 마포구 연남동', '02-7000-0002', NULL, '2026-01-27 11:53:47'),
(63, '/img/restaurant/cf03.png', NULL, NULL, NULL, NULL, '루프탑카페', '뷰가 좋은 카페', 4.5, 55, '카페', '서울시 용산구 이태원', '02-7000-0003', NULL, '2026-01-27 11:53:47'),
(64, '/img/restaurant/cf04.png', NULL, NULL, NULL, NULL, '빈스토리', '원두 전문 카페', 4.2, 28, '카페', '서울시 성동구 성수동', '02-7000-0004', NULL, '2026-01-27 11:53:47'),
(65, '/img/restaurant/cf05.png', NULL, NULL, NULL, NULL, '브루잉랩', '핸드드립 전문', 4.4, 36, '카페', '서울시 서초구 방배동', '02-7000-0005', NULL, '2026-01-27 11:53:47'),
(66, '/img/restaurant/cf06.png', NULL, NULL, NULL, NULL, '노트북카페', '작업하기 좋은 카페', 4.1, 31, '카페', '서울시 관악구 봉천동', '02-7000-0006', NULL, '2026-01-27 11:53:47'),
(67, '/img/restaurant/cf07.png', NULL, NULL, NULL, NULL, '빈앤밀크', '디저트 카페', 4.0, 22, '카페', '서울시 동작구 사당동', '02-7000-0007', NULL, '2026-01-27 11:53:47'),
(68, '/img/restaurant/cf08.png', NULL, NULL, NULL, NULL, '골목카페', '조용한 동네 카페', 4.3, 27, '카페', '서울시 은평구 연신내', '02-7000-0008', NULL, '2026-01-27 11:53:47'),
(69, '/img/restaurant/cf09.png', NULL, NULL, NULL, NULL, '커피연구소', '스페셜티 커피', 4.6, 48, '카페', '서울시 종로구 서촌', '02-7000-0009', NULL, '2026-01-27 11:53:47'),
(70, '/img/restaurant/cf10.png', NULL, NULL, NULL, NULL, '카페하루', '감성 카페', 3.9, 19, '카페', '서울시 중랑구 망우동', '02-7000-0010', NULL, '2026-01-27 11:53:47'),
(71, '/img/restaurant/ds01.png', NULL, NULL, NULL, NULL, '케이크공방', '수제 케이크 전문', 4.5, 46, '디저트', '서울시 마포구 상수동', '02-8000-0001', NULL, '2026-01-27 11:53:47'),
(72, '/img/restaurant/ds02.png', NULL, NULL, NULL, NULL, '마카롱샵', '마카롱 전문', 4.2, 33, '디저트', '서울시 강남구 청담동', '02-8000-0002', NULL, '2026-01-27 11:53:47'),
(73, '/img/restaurant/ds03.png', NULL, NULL, NULL, NULL, '디저트하우스', '디저트 종합 카페', 4.1, 29, '디저트', '서울시 송파구 잠실동', '02-8000-0003', NULL, '2026-01-27 11:53:47'),
(74, '/img/restaurant/ds04.png', NULL, NULL, NULL, NULL, '티라미수집', '티라미수 특화', 4.6, 41, '디저트', '서울시 성북구 성신여대', '02-8000-0004', NULL, '2026-01-27 11:53:47'),
(75, '/img/restaurant/ds05.png', NULL, NULL, NULL, NULL, '크로플바', '크로플 전문', 4.3, 35, '디저트', '서울시 동대문구 회기동', '02-8000-0005', NULL, '2026-01-27 11:53:47'),
(76, '/img/restaurant/ds06.png', NULL, NULL, NULL, NULL, '푸딩샵', '푸딩 전문 디저트', 4.0, 21, '디저트', '서울시 노원구 중계동', '02-8000-0006', NULL, '2026-01-27 11:53:47'),
(77, '/img/restaurant/ds07.png', NULL, NULL, NULL, NULL, '빙수연구소', '수제 빙수', 4.4, 39, '디저트', '서울시 강서구 마곡동', '02-8000-0007', NULL, '2026-01-27 11:53:47'),
(78, '/img/restaurant/ds08.png', NULL, NULL, NULL, NULL, '초코팩토리', '초콜릿 전문', 4.2, 26, '디저트', '서울시 광진구 건대', '02-8000-0008', NULL, '2026-01-27 11:53:47'),
(79, '/img/restaurant/ds09.png', NULL, NULL, NULL, NULL, '베이커리로드', '빵집 겸 디저트', 4.1, 34, '디저트', '서울시 중구 충무로', '02-8000-0009', NULL, '2026-01-27 11:53:47'),
(80, '/img/restaurant/ds10.png', NULL, NULL, NULL, NULL, '수플레집', '수플레 팬케이크', 4.5, 37, '디저트', '서울시 종로구 북촌', '02-8000-0010', NULL, '2026-01-27 11:53:47'),
(81, '/img/restaurant/etc01.png', NULL, NULL, NULL, NULL, '푸드코트A', '다양한 메뉴 한곳에', 3.9, 40, '기타', '서울시 영등포구 여의도', '02-9000-0001', NULL, '2026-01-27 11:53:47'),
(82, '/img/restaurant/etc02.png', NULL, NULL, NULL, NULL, '야시장푸드', '야시장 스타일 음식', 4.2, 53, '기타', '서울시 중구 명동', '02-9000-0002', NULL, '2026-01-27 11:53:47'),
(83, '/img/restaurant/etc03.png', NULL, NULL, NULL, NULL, '비건키친', '비건 전문 식당', 4.4, 31, '기타', '서울시 마포구 공덕동', '02-9000-0003', NULL, '2026-01-27 11:53:47'),
(84, '/img/restaurant/etc04.png', NULL, NULL, NULL, NULL, '푸드트럭존', '푸드트럭 모음', 4.0, 27, '기타', '서울시 강남구 삼성동', '02-9000-0004', NULL, '2026-01-27 11:53:47'),
(85, '/img/restaurant/etc05.png', NULL, NULL, NULL, NULL, '할랄푸드', '할랄 음식 전문', 4.1, 22, '기타', '서울시 용산구 이태원', '02-9000-0005', NULL, '2026-01-27 11:53:47'),
(86, '/img/restaurant/etc06.png', NULL, NULL, NULL, NULL, '글로벌푸드', '세계 음식 모음', 4.3, 35, '기타', '서울시 종로구 인사동', '02-9000-0006', NULL, '2026-01-27 11:53:47'),
(87, '/img/restaurant/etc07.png', NULL, NULL, NULL, NULL, '홈쿠킹샵', '가정식 스타일', 4.0, 19, '기타', '서울시 은평구 불광동', '02-9000-0007', NULL, '2026-01-27 11:53:47'),
(88, '/img/restaurant/etc08.png', NULL, NULL, NULL, NULL, '무국적식당', '퓨전 음식', 4.2, 24, '기타', '서울시 성남시 분당', '031-9000-0008', NULL, '2026-01-27 11:53:47'),
(89, '/img/restaurant/etc09.png', NULL, NULL, NULL, NULL, '푸드라운지', '복합 음식 공간', 4.5, 44, '기타', '서울시 송파구 석촌', '02-9000-0009', NULL, '2026-01-27 11:53:47'),
(90, '/img/restaurant/etc10.png', NULL, NULL, NULL, NULL, '캐주얼다이닝', '편한 분위기 식당', 4.1, 28, '기타', '서울시 강동구 천호동', '02-9000-0010', NULL, '2026-01-27 11:53:47');

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
(10, 'user10', 'user10', '초밥러10', '초밥은 진리.', '/img/user/user10.png', 'vip', '2024-01-10 10:30:00'),
(11, 'user11', 'user11', '라멘러11', '라멘 맛집 위주로 다닙니다.', '/img/user/user11.png', 'normal', '2024-01-11 09:00:00'),
(12, 'user12', 'user12', '파스타러12', '파스타랑 와인 좋아해요.', '/img/user/user12.png', 'silver', '2024-01-12 09:10:00'),
(13, 'user13', 'user13', '치킨러13', '치킨은 진리입니다.', '/img/user/user13.png', 'gold', '2024-01-13 09:20:00'),
(14, 'user14', 'user14', '피자러14', '피자 맛집만 찾아다녀요.', '/img/user/user14.png', 'normal', '2024-01-14 09:30:00'),
(15, 'user15', 'user15', '디저트러15', '디저트 투어 중입니다.', '/img/user/user15.png', 'vip', '2024-01-15 09:40:00'),
(16, 'user16', 'user16', '술안주16', '술집 안주 맛집 위주.', '/img/user/user16.png', 'normal', '2024-01-16 09:50:00'),
(17, 'user17', 'user17', '분식왕17', '분식은 언제나 옳다.', '/img/user/user17.png', 'silver', '2024-01-17 10:00:00'),
(18, 'user18', 'user18', '배달러18', '배달 맛집 위주로 리뷰합니다.', '/img/user/user18.png', 'normal', '2024-01-18 10:10:00'),
(19, 'user19', 'user19', '노포러19', '노포 맛집 탐방이 취미.', '/img/user/user19.png', 'gold', '2024-01-19 10:20:00'),
(20, 'user20', 'user20', '비건러20', '비건 식당 찾아다녀요.', '/img/user/user20.png', 'normal', '2024-01-20 10:30:00'),
(21, 'user21', 'user21', '매운맛21', '매운 음식 도전 중.', '/img/user/user21.png', 'silver', '2024-01-21 10:40:00'),
(22, 'user22', 'user22', '담백러22', '자극 없는 음식 선호.', '/img/user/user22.png', 'normal', '2024-01-22 10:50:00'),
(23, 'user23', 'user23', '신상러23', '신상 맛집 빠르게 가봅니다.', '/img/user/user23.png', 'gold', '2024-01-23 11:00:00'),
(24, 'user24', 'user24', '사진러24', '맛집 사진 찍는 게 취미.', '/img/user/user24.png', 'normal', '2024-01-24 11:10:00'),
(25, 'user25', 'user25', '혼술러25', '혼술하기 좋은 곳 찾는 중.', '/img/user/user25.png', 'vip', '2024-01-25 11:20:00'),
(26, 'user26', 'user26', '브런치26', '브런치 맛집 좋아해요.', '/img/user/user26.png', 'normal', '2024-01-26 11:30:00'),
(27, 'user27', 'user27', '모임러27', '맛집 모임 환영합니다.', '/img/user/user27.png', 'silver', '2024-01-27 11:40:00'),
(28, 'user28', 'user28', '지도저장28', '지도에 맛집 저장 중.', '/img/user/user28.png', 'normal', '2024-01-28 11:50:00'),
(29, 'user29', 'user29', '원정러29', '멀어도 맛집이면 갑니다.', '/img/user/user29.png', 'gold', '2024-01-29 12:00:00'),
(30, 'user30', 'user30', '올드테이스트30', '옛날 감성 식당 좋아요.', '/img/user/user30.png', 'normal', '2024-01-30 12:10:00');

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
  MODIFY `br_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '리뷰 게시글 번호', AUTO_INCREMENT=53;

--
-- 테이블의 AUTO_INCREMENT `comment`
--
ALTER TABLE `comment`
  MODIFY `ct_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '댓글 번호', AUTO_INCREMENT=24;

--
-- 테이블의 AUTO_INCREMENT `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rt_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '맛집 번호', AUTO_INCREMENT=91;

--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `u_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '회원 번호', AUTO_INCREMENT=31;

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
