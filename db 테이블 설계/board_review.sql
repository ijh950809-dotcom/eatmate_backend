-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 26-01-28 03:55
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

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `board_review`
--
ALTER TABLE `board_review`
  ADD PRIMARY KEY (`br_no`),
  ADD KEY `fk_br_user` (`br_user_no`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `board_review`
--
ALTER TABLE `board_review`
  MODIFY `br_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '리뷰 게시글 번호', AUTO_INCREMENT=53;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `board_review`
--
ALTER TABLE `board_review`
  ADD CONSTRAINT `fk_br_user` FOREIGN KEY (`br_user_no`) REFERENCES `users` (`u_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
