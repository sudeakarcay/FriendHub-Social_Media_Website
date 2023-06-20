-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3308
-- Üretim Zamanı: 20 Haz 2023, 18:00:54
-- Sunucu sürümü: 8.0.31
-- PHP Sürümü: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `friendhub`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `FOREIGN_KEY_7` (`post_id`),
  KEY `FOREIGN_KEY_8` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE IF NOT EXISTS `friends` (
  `friend_id` int NOT NULL AUTO_INCREMENT,
  `follower_id` int NOT NULL,
  `followed_id` int NOT NULL,
  PRIMARY KEY (`friend_id`),
  KEY `FOREIGN_KEY_3` (`follower_id`),
  KEY `FOREIGN_KEY_4` (`followed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `friends`
--

INSERT INTO `friends` (`friend_id`, `follower_id`, `followed_id`) VALUES
(140, 55, 53),
(141, 56, 53),
(143, 55, 54),
(144, 54, 53);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `to_user_id` int NOT NULL,
  `from_user_id` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FOREIGN_KEY_1` (`to_user_id`),
  KEY `FOREIGN_KEY_2` (`from_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `notification`
--

INSERT INTO `notification` (`id`, `to_user_id`, `from_user_id`, `message`, `created_at`) VALUES
(143, 55, 56, 'wants to follow you', '2023-06-20 20:54:47'),
(144, 56, 53, 'Removed you from followers', '2023-06-20 20:56:48');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `like_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `like_count`) VALUES
(187, 53, '', 'Hii, I\'m Badem. I\'m a lovely cat :)', 0),
(188, 53, 'badempost.png', 'Hey, let me introduce my best friend!!!!', 0),
(189, 54, 'ron.jpg', 'My best friend is Ron Weasley', 0),
(190, 54, '', 'I\'m happy to be part of the Harry Potter film series!!!', 0),
(191, 54, 'hermonie.jpg', 'Here is my other best friend Hermonie!', 0),
(192, 55, '', 'Today is a beautiful day.', 0),
(193, 55, 'game.png', 'Not today, I\'m busy :)', 0),
(194, 55, 'kedi.jpeg', '', 0),
(195, 56, '', 'Oops! I didn\'t upload a profile pic sorryyyyyy', 0),
(196, 56, 'hermonie.jpg', 'Hello, it\'s mee :)))))', 0),
(197, 56, 'badem.jpg', 'I love you Badeeemm', 0),
(198, 53, 'kocaeli.jpeg', 'Vacation mode', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bdate` date NOT NULL,
  `profilepic` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `surname`, `email`, `password`, `bdate`, `profilepic`) VALUES
(56, 'Hermonie', 'Granger', 'hermonie2000@gmail.com', '$2y$10$8duNcApqhQJpGUOOsQtL3e4x7n21fiahbf0wRQdrFeftt.h8TM62.', '2000-05-15', 'default.jpg'),
(55, 'Ron', 'Weasley', 'ronweasley@gmail.com', '$2y$10$ckR51XPq3cMjZooj9CGp8.G9/n2dUX0eqewZ2qEiWw40ofhM3lqrO', '2012-08-17', 'ron.jpg'),
(54, 'Harry', 'Potter', 'harrypotter@gmail.com', '$2y$10$SFGb7mv0n9rZ641nW3JBFOfA7OX3FzRY0R.j6robKRJiVnAr0jaZm', '2017-05-08', 'harryPotter.jpg'),
(53, 'Badem', 'Akarcay', 'bademakarcay@gmail.com', '$2y$10$H8wS/Rn322D/LC6AAUdr/uZ367XdylSGiHuHuPtKchYU9UAcHtFae', '2023-06-01', 'badem.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
