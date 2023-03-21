-- phpMyAdmin SQL Dump
-- version 5.1.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 21, 2023 at 02:15 PM
-- Server version: 10.5.15-MariaDB-0+deb11u1
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grassetd`
--
CREATE DATABASE IF NOT EXISTS `grassetd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `grassetd`;

-- --------------------------------------------------------

--
-- Table structure for table `Administrators`
--

CREATE TABLE `Administrators` (
  `loginUser` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Administrators`
--

INSERT INTO `Administrators` (`loginUser`) VALUES
('Administrateur1'),
('CyrilleN'),
('D4rkuwuGirl'),
('DodoAdmin'),
('JeRévolutionneLeYoutubeFrançais'),
('testAdmin'),
('xXNewAsian34Xx');

-- --------------------------------------------------------

--
-- Table structure for table `Answers`
--

CREATE TABLE `Answers` (
  `idAnswer` int(11) NOT NULL,
  `answerContent` varchar(240) DEFAULT NULL,
  `idSection` int(11) NOT NULL,
  `loginUser` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Answers`
--

INSERT INTO `Answers` (`idAnswer`, `answerContent`, `idSection`, `loginUser`) VALUES
(999, NULL, 24, 'Nathan'),
(1003, 'JE REPONDS', 85756, 'xXAsian2Xx'),
(1021, 'Oui je l\'aime trop c\'est mon gars sur', 85815, 'Dodo'),
(1022, 'Mais quand même l\'affichage au réseau je l\'ai en travers de la gorge', 85816, 'Dodo'),
(1023, 'Je pense que cette question est une bonne question', 85817, 'Utilisateur1'),
(1024, 'Je ne pense pas que cette question est une bonne question', 85817, 'Utilisateur2'),
(1025, 'Réponse 1 : coucou', 85823, 'Utilisateur1'),
(1026, 'Réponse 2 : salut', 85823, 'Utilisateur2'),
(1027, '1 LA RÉPONSE 1', 85828, 'Utilisateur1'),
(1028, '2 LA RÉPONSE 2', 85828, 'Utilisateur2'),
(1029, 'oui', 85829, 'Utilisateur1'),
(1030, 'non', 85830, 'Utilisateur1');

-- --------------------------------------------------------

--
-- Table structure for table `Autors`
--

CREATE TABLE `Autors` (
  `loginUser` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Autors`
--

INSERT INTO `Autors` (`loginUser`) VALUES
('anais1'),
('Auteur1'),
('Dodo'),
('FanclubClement'),
('JeRévolutionneLeYoutubeFrançais'),
('Test'),
('Utilisateur5'),
('xXAsian2Xx');

-- --------------------------------------------------------

--
-- Table structure for table `has_tag`
--

CREATE TABLE `has_tag` (
  `idQuestion` int(11) NOT NULL,
  `idTag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `has_tag`
--

INSERT INTO `has_tag` (`idQuestion`, `idTag`) VALUES
(217, 49),
(256, 44),
(256, 54),
(260, 44),
(260, 52),
(260, 54),
(265, 44),
(265, 52),
(265, 54),
(266, 44),
(266, 52),
(266, 54),
(267, 44),
(267, 52),
(267, 54),
(268, 44),
(268, 52),
(268, 54),
(269, 44),
(269, 52),
(269, 54),
(270, 44),
(270, 52),
(270, 54),
(271, 44),
(271, 52),
(271, 54),
(274, 49),
(274, 62),
(288, 63),
(288, 64),
(288, 65),
(327, 63),
(332, 68),
(332, 69),
(335, 33),
(335, 74),
(336, 33),
(338, 75),
(339, 76),
(341, 77),
(342, 78),
(342, 79);

-- --------------------------------------------------------

--
-- Table structure for table `participate`
--

CREATE TABLE `participate` (
  `loginUser` varchar(50) NOT NULL,
  `idAnswer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `publications`
--

CREATE TABLE `publications` (
  `idPublication` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `idAuteur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publications`
--

INSERT INTO `publications` (`idPublication`, `message`, `date`, `idAuteur`) VALUES
(1, 'Un exemple de publication', '2023-01-30 14:37:50', 1),
(2, '<script>alert(\"message\")</script>', '2023-02-25 07:23:09', 2),
(3, 'J\'ai en tête un en tête #rire', '2023-03-09 14:20:36', 3),
(4, 'Escalope de dindon', '2023-03-15 08:38:54', 4),
(5, 'caca', '2023-03-16 08:59:02', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `idQuestion` int(11) NOT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `dateCreation` datetime NOT NULL,
  `dateStartAnswer` date NOT NULL,
  `dateEndAnswer` date NOT NULL,
  `dateStartVote` date NOT NULL,
  `dateEndVote` date DEFAULT NULL,
  `loginUser` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Questions`
--

INSERT INTO `Questions` (`idQuestion`, `private`, `title`, `description`, `dateCreation`, `dateStartAnswer`, `dateEndAnswer`, `dateStartVote`, `dateEndVote`, `loginUser`) VALUES
(217, 0, 'Test update', 'elle est trop bien cette description', '2023-01-05 14:43:23', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(225, 0, 'Test', 'elle est trop bien cette description', '2023-01-05 15:41:53', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(226, 0, 'Test', 'elle est trop bien cette description', '2023-01-05 15:42:25', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(227, 0, 'Test', 'elle est trop bien cette description', '2023-01-05 15:43:05', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(228, 0, 'Test', 'elle est trop bien cette description', '2023-01-05 16:02:04', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(229, 0, 'Test', 'elle est trop bien cette description', '2023-01-05 16:02:45', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(230, 0, 'Test', 'elle est trop bien cette descrip', '2023-01-05 16:06:24', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(231, 0, 'Test', 'elle est trop bien cette descrip', '2023-01-05 16:11:21', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(232, 0, 'Question test', 'oue', '2023-01-05 16:17:09', '2023-01-05', '2023-01-06', '2023-01-07', '2023-01-08', 'JeRévolutionneLeYoutubeFrançais'),
(234, 0, 'question test 2', 'ouais', '2023-01-05 16:19:16', '2023-01-05', '2023-01-06', '2023-01-07', '2023-01-08', 'JeRévolutionneLeYoutubeFrançais'),
(236, 0, 'Test', 'elle est trop bien cette description', '2023-01-05 16:29:27', '2022-12-27', '2022-12-30', '2023-01-11', '2023-01-25', 'JeRévolutionneLeYoutubeFrançais'),
(240, 0, 'sdjvlmskd', 'lskdjf', '2023-01-05 21:52:42', '3882-09-04', '0983-03-12', '0083-09-10', '0083-09-10', 'JeRévolutionneLeYoutubeFrançais'),
(241, 0, 'sdjvlmskd', 'lskdjf', '2023-01-05 21:53:56', '3882-09-04', '0983-03-12', '0083-09-10', '0083-09-10', 'JeRévolutionneLeYoutubeFrançais'),
(242, 0, 'sdjvlmskd', 'lskdjf', '2023-01-05 21:56:11', '3882-09-04', '0983-03-12', '0083-09-10', '0083-09-10', 'JeRévolutionneLeYoutubeFrançais'),
(243, 0, 'skmjdfndo', 'azlezkfj', '2023-01-05 22:00:15', '0004-03-23', '3283-08-29', '3238-08-20', '0028-03-28', 'JeRévolutionneLeYoutubeFrançais'),
(244, 0, 'skmjdfndo', 'azlezkfj', '2023-01-05 22:04:52', '0004-03-23', '3283-08-29', '3238-08-20', '0028-03-28', 'JeRévolutionneLeYoutubeFrançais'),
(245, 0, 'eedfpopj', 'sodkfdj', '2023-01-05 22:07:25', '9820-04-12', '0482-09-22', '0482-10-01', '0032-04-18', 'JeRévolutionneLeYoutubeFrançais'),
(246, 0, 'eedfpopj', 'sodkfdj', '2023-01-05 22:07:39', '9820-04-12', '0482-09-22', '0482-10-01', '0032-04-18', 'JeRévolutionneLeYoutubeFrançais'),
(248, 0, 'xwkdv,qa', 'qlksdfj', '2023-01-05 22:16:49', '0003-03-21', '0001-02-23', '0003-03-23', '0003-03-22', 'JeRévolutionneLeYoutubeFrançais'),
(249, 0, 'xwkdv,qa', 'qlksdfj', '2023-01-05 22:17:35', '0003-03-21', '0001-02-23', '0003-03-23', '0003-03-22', 'JeRévolutionneLeYoutubeFrançais'),
(256, 0, 'Test-update-tag', 'description', '2023-01-10 18:52:26', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(260, 0, 'Test-update-tag', 'description', '2023-01-10 21:51:20', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(265, 0, 'Test-update-tag', 'description', '2023-01-10 22:05:41', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(266, 2, 'Test-update-tag-caca', 'description', '2023-01-10 22:05:54', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(267, 0, 'Test-update-tag-caca', 'description', '2023-01-10 22:06:33', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(268, 0, 'Test-update-tag-cac', 'description', '2023-01-10 22:06:42', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(269, 0, 'Test-update-tag-cac', 'description', '2023-01-10 22:08:48', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(270, 0, 'Test-update-tag-talala', 'description', '2023-01-10 22:09:03', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(271, 2, 'Test-update-tag-ahahaa', 'description', '2023-01-10 22:09:36', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(274, 0, 'Test-update-tag-talala', 'description', '2023-01-10 22:14:25', '2023-01-04', '2023-01-12', '2023-01-05', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(288, 0, 'zizi', 'LAAAAAAA PEPSI CON TENNIS', '2023-01-10 23:46:04', '2023-01-04', '2023-01-13', '2023-01-26', '2023-01-28', 'JeRévolutionneLeYoutubeFrançais'),
(292, 0, 'teestundos', 'oiqsffjd', '2023-01-11 01:05:48', '2023-01-05', '2023-01-13', '2023-01-20', '2023-01-11', 'JeRévolutionneLeYoutubeFrançais'),
(293, 0, 'qsdlk', 'lkfdas', '2023-01-11 01:09:45', '0009-02-03', '0092-03-29', '0029-03-29', '0092-03-29', 'JeRévolutionneLeYoutubeFrançais'),
(294, 0, 'osidjfz', 'trehr', '2023-01-11 01:10:25', '2023-01-06', '2023-01-12', '2023-01-14', '2023-01-21', 'JeRévolutionneLeYoutubeFrançais'),
(295, 0, 'sdlk,fzkl', 'sdflknn&amp;', '2023-01-11 01:12:09', '2022-12-31', '2023-01-05', '2023-01-13', '2023-02-03', 'JeRévolutionneLeYoutubeFrançais'),
(296, 2, 'aaaa', 'wldk', '2023-01-11 01:13:41', '2023-01-06', '2023-01-17', '2023-01-19', '2023-01-28', 'JeRévolutionneLeYoutubeFrançais'),
(298, 0, 'qsldjkfqslk', 'lkdj', '2023-01-11 01:18:21', '2023-01-05', '2023-01-12', '2023-01-14', '2023-01-26', 'JeRévolutionneLeYoutubeFrançais'),
(299, 1, 'osdk', 'wdlfk', '2023-01-11 01:21:12', '2023-01-05', '2023-01-08', '2023-01-13', '2023-01-21', 'JeRévolutionneLeYoutubeFrançais'),
(300, 0, 'sdfzevdv', 'dsf', '2023-01-11 01:23:18', '2023-01-04', '2023-01-07', '2023-01-10', '2023-01-20', 'JeRévolutionneLeYoutubeFrançais'),
(302, 0, 'coucou', 'sfdbs', '2023-01-11 01:29:12', '2023-01-02', '2023-01-05', '2023-01-10', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(303, 0, 'cacabouddha', 'fdslkj', '2023-01-11 01:31:04', '2023-01-02', '2023-01-05', '2023-01-10', '2023-01-14', 'JeRévolutionneLeYoutubeFrançais'),
(304, 0, 'dfsd', 'qdf', '2023-01-11 01:33:19', '2023-01-02', '2023-01-04', '2023-01-10', '2023-01-21', 'JeRévolutionneLeYoutubeFrançais'),
(306, 0, 'LE GROS TEST', 'DFZDZZDZD', '2023-01-11 15:22:42', '2023-01-05', '2023-01-12', '2023-01-13', '2023-01-17', 'JeRévolutionneLeYoutubeFrançais'),
(310, 0, 'Dorian y&#039;a que toi qui a l&#039;erreur', 'dodo tu pue', '2023-01-11 15:43:44', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(311, 0, 'Dorian y&#039;a que toi qui a l&#039;erreur', 'dodo tu pue', '2023-01-11 15:47:07', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(312, 0, 'Dorian y&#039;a que toi qui a l&#039;erreur', 'dodo tu pue', '2023-01-11 15:47:26', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(313, 1, 'Dorian y&#039;a que toi qui a l&#039;erreur', 'dodo tu pue', '2023-01-11 15:47:48', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(314, 0, 'Dorian y&#039;a que toi qui a l&#039;erreur', 'dodo tu pue', '2023-01-11 15:48:58', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(315, 0, 'Dorian y&#039;a que toi qui a l&#039;erreur', 'dodo tu pue', '2023-01-11 15:50:11', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(316, 0, 'Dodo me pete les couilles', 'Dodo lache ca la', '2023-01-11 15:54:32', '2023-01-06', '2023-01-07', '2023-01-08', '2023-01-09', 'xXAsian2Xx'),
(317, 0, 'Dodo me pete les couilles', 'Dodo lache ca la', '2023-01-11 15:56:28', '2023-01-06', '2023-01-07', '2023-01-08', '2023-01-09', 'xXAsian2Xx'),
(319, 0, 'cacaprout', 'comment ca mon beuf', '2023-01-11 17:41:57', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'xXAsian2Xx'),
(320, 0, 'Le pipi dans la voiture', 'le pipi dans la tete', '2023-01-11 17:43:24', '2023-01-12', '2023-01-13', '2023-01-15', '2023-01-16', 'xXAsian2Xx'),
(321, 0, 'Caca', 'Mon daron', '2023-01-11 17:45:55', '2023-01-11', '2023-01-12', '2023-01-14', '2023-01-15', 'xXAsian2Xx'),
(322, 0, 'lalala', 'sdflvj', '2023-01-11 19:05:02', '2023-01-04', '2023-01-12', '2023-01-14', '2023-01-26', 'JeRévolutionneLeYoutubeFrançais'),
(323, 0, 'j&#039;adore', 'vous en pensez quoi -feur ?', '2023-01-11 18:27:25', '2023-01-08', '2023-01-09', '2023-01-10', '2023-01-11', 'xXAsian2Xx'),
(324, 0, 'test', 'lqsdk', '2023-01-11 21:01:12', '2023-01-04', '2023-01-06', '2023-01-12', '2023-01-21', 'JeRévolutionneLeYoutubeFrançais'),
(325, 0, 'test update', 'telsk', '2023-01-11 21:08:12', '2023-01-02', '2023-01-06', '2023-01-12', '2023-01-20', 'JeRévolutionneLeYoutubeFrançais'),
(326, 2, 'test review', 'dslkj', '2023-01-13 14:16:26', '2023-01-04', '2023-01-09', '2023-01-10', '2023-01-11', 'JeRévolutionneLeYoutubeFrançais'),
(327, 1, 'titre', 'dbhyd', '2023-01-13 14:53:22', '2023-01-20', '2023-01-21', '2023-01-22', '2023-01-24', 'FanclubClement'),
(331, 0, 'Test', 'test 1', '2023-01-13 19:57:29', '2023-01-13', '2023-01-14', '2023-01-15', '2023-01-16', 'xXAsian2Xx'),
(332, 0, 'Aimez-vous les donuts sucrés au sucre ?', 'Donnez votre avis par pitié...', '2023-01-15 11:32:43', '2023-01-14', '2023-01-16', '2023-01-18', '2023-01-21', 'JeRévolutionneLeYoutubeFrançais'),
(333, 0, 'Est-ce que Nadal est un bon prof ?', 'Donnez votre avis objectif ne soyez pas insultant :)', '2023-01-15 17:55:46', '2023-01-14', '2023-01-16', '2023-01-17', '2023-01-19', 'JeRévolutionneLeYoutubeFrançais'),
(334, 0, 'Question en cours de vote', 'Description', '2023-01-16 13:05:13', '2023-01-10', '2023-01-12', '2023-01-15', '2023-01-17', 'Auteur1'),
(335, 0, 'Vote à égalité', 'Description de la question', '2023-01-16 13:09:37', '2023-01-11', '2023-01-12', '2023-01-14', '2023-01-15', 'Auteur1'),
(336, 1, 'Question privée', 'Description de la question', '2023-01-16 12:32:01', '2023-01-06', '2023-01-17', '2023-01-18', '2023-01-20', 'Auteur1'),
(337, 1, 'Question supprimée', 'Description', '2023-01-16 12:33:55', '2023-01-12', '2023-01-17', '2023-01-18', '2023-01-20', 'Auteur1'),
(338, 0, 'Répondre à la question', 'Répondez pitié...', '2023-01-16 12:35:47', '2023-01-14', '2023-01-25', '2023-01-26', '2023-01-28', 'Auteur1'),
(339, 0, 'Section gagnante', 'Votez pitié...', '2023-01-16 12:37:13', '2023-01-11', '2023-01-12', '2023-01-13', '2023-01-14', 'Auteur1'),
(340, 2, 'Question', 'frezezrfezfez', '2023-01-16 14:16:26', '2023-01-14', '2023-01-17', '2023-01-18', '2023-01-21', 'Auteur1'),
(341, 2, 'Chocolat noir ou blanc?', 'J&#039;adore le chocolat et vous?', '2023-03-02 16:35:40', '2023-03-03', '2023-03-05', '2023-03-09', '2023-03-11', 'anais1'),
(342, 0, 'Quel est votre jeu favori?', 'Partagez vos jeux favoris ! ', '2023-03-02 16:52:31', '2023-03-03', '2023-03-05', '2023-03-08', '2023-03-11', 'anais1');

-- --------------------------------------------------------

--
-- Table structure for table `recovery_code`
--

CREATE TABLE `recovery_code` (
  `code` int(11) NOT NULL,
  `loginUser` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `roleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`roleName`) VALUES
('autor'),
('collaborator'),
('voter');

-- --------------------------------------------------------

--
-- Table structure for table `Sections`
--

CREATE TABLE `Sections` (
  `idSection` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `idQuestion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sections`
--

INSERT INTO `Sections` (`idSection`, `title`, `content`, `idQuestion`) VALUES
(3, 'y', 'fbyr', '50'),
(4, '1', 'rrr', '51'),
(5, '2', 'eee', '51'),
(6, '3', 'eee', '51'),
(7, 'suspect n°1', 'Alexis', '52'),
(8, 'suspect n°2', 'Rayan ', '52'),
(9, 'suspect N°3', 'Un homme avec la trotinette volée à la main', '52'),
(10, 'suspect n°1', 'Alexis', '53'),
(11, 'suspect n°2', 'Rayan ', '53'),
(12, 'suspect N°3', 'Un homme avec la trotinette volée à la main', '53'),
(13, 'Solution ', 'C&#039;était Rayan ! \r\nBravo à tous pour votre participation &lt;3', '53'),
(14, 'dd', 'ddd', '54'),
(15, 'dvgdfd', 'dbydfd', '54'),
(16, 'vfxe', 'vxet', '54'),
(17, 'bonsoir', 'cc', '56'),
(18, 'Zizi', 'Le gros zizi de lucas', '58'),
(19, 'Caca', 'Le gros popo de powpow', '58'),
(20, 'Dorian ce BG', 'Savez-vous à quel point ce mec est beau putain ?', '59'),
(21, 'qsdqvd', 'qsdfvqdf', '60'),
(22, 'qsdqvd', 'qsdfvqdf', '61'),
(23, 'vcbxcv', 'sbsvbxc', '62'),
(24, 'sdvsd', 'vsdfvs', '63'),
(25, 'sdvsd', 'vsdfvs', '64'),
(26, 'sdvsd', 'vsdfvs', '65'),
(27, 'sdvsd', 'vsdfvs', '66'),
(28, 'sdvsd', 'vsdfvs', '67'),
(29, 'sdvsd', 'vsdfvs', '68'),
(30, 'sdvsd', 'vsdfvs', '69'),
(31, 'sdvsd', 'vsdfvs', '70'),
(32, 'sdvsd', 'vsdfvs', '71'),
(33, 'sdvsd', 'vsdfvs', '72'),
(34, 'sdvsd', 'vsdfvs', '73'),
(35, 'sdvsd', 'vsdfvs', '74'),
(36, 'sdvsd', 'vsdfvs', '75'),
(37, 'sdvsd', 'vsdfvs', '76'),
(38, 'sdvsd', 'vsdfvsd', '77'),
(39, '&amp;zefg', '&amp;ef', '78'),
(40, 'sdvbsdf', 'sdfbvsfdb', '79'),
(41, 'sdvbsdf', 'sdfbvsfdb', '80'),
(42, 'sdvbsdf', 'sdfbvsfdb', '81'),
(43, 'sdvbsdf', 'sdfbvsfdb', '82'),
(44, 'sdvbsdf', 'sdfbvsfdb', '83'),
(45, 'sdvbsdf', 'sdfbvsfdb', '84'),
(46, 'sdvbsdf', 'sdfbvsfdb', '85'),
(47, 'lol', 'qosdijfqoidfjqi', '86'),
(48, 'lol', 'qosdijfqoidfjqiy', '87'),
(49, 'coucou section', 'ah que coucou bob', '88'),
(50, 'zelefjk', 'lfzj', '89'),
(51, 'N°1', '1', '90'),
(52, 'N°1', '1', '91'),
(53, 'N°1', '1', '92'),
(54, 'N°1', '1', '93'),
(55, 'N°1', '1', '94'),
(56, 'N°1', '1', '95'),
(57, 'N°1', '1', '96'),
(58, 'N°1', '1', '97'),
(59, 'N°1', '1', '98'),
(60, '1', '1', '99'),
(61, '1', '1', '100'),
(62, '1', '1', '101'),
(63, '1', '1', '102'),
(64, '1', '2', '103'),
(65, 'd', 'd', '104'),
(66, 'section', 'descsection', '105'),
(67, 'sect', 'descri', '106'),
(68, 'dfvsd', 'sdvd', '107'),
(69, 'dfvsd', 'sdvd', '108'),
(70, 'dfsvd', 'fvsdfvsd', '109'),
(71, 'sdfbsdfb', 'sdffbsdfb', '110'),
(72, 'sdfvsdf', 'sdfvsdfv', '111'),
(73, 'dsfsdf', 'sdfsdfg', '112'),
(74, 'sfgs', 'sfgf', '113'),
(84, 'Faut-il la bannir de la classe ?', 'Veuillez répondre de manière argumentée.', '142'),
(85, 'Faut-il feindre de n&#039;avoir ni entendu ni senti ?', 'Veuillez répondre de manière argumentée.', '142'),
(86, 'sdfdbsfdb', 'sfdbsfb', '144'),
(87, 'dzefdae', 'dskjvd', '145'),
(88, 'vsdlfkj', 'vsldk', '146'),
(89, '1', 'p', '148'),
(90, 'd', 'd', '151'),
(91, 'eee', 'p', '152'),
(92, '1', 'prout', '153'),
(93, 'Aime-t-on les chinois ?', 'répondez en justifiant', '154'),
(94, 'dfsdf', 'sddf', '155'),
(95, '1&amp;', '1', '156'),
(96, '1', '1', '157'),
(97, '1', '1', '158'),
(98, '1', '1', '159'),
(99, '1', '1', '160'),
(100, '1', '1', '161'),
(101, '1', '1', '162'),
(102, '1', '1', '163'),
(103, '1', '1', '164'),
(104, '1', '1', '165'),
(105, 'Wouf?', 'RAWRRR', '166'),
(106, 'Wouf?', 'RAWRRR', '167'),
(107, 'Wouf?', 'RAWRRR', '168'),
(108, 'Wouf?', 'RAWRRR', '169'),
(109, 'Wouf?', 'RAWRRR', '170'),
(110, 'Wouf?', 'RAWRRR', '171'),
(111, 'r', 'r', '172'),
(112, 'r', 'r', '173'),
(113, 'f', 'f', '174'),
(114, 'f', 'f', '175'),
(115, 'd', 'd', '176'),
(116, 'd', 'd', '177'),
(117, 'd', 'd', '178'),
(118, 'd', 'd', '179'),
(119, 'd', 'd', '180'),
(120, 'd', 'd', '181'),
(121, 'Amis', 'Avez-vous vous aussi des amis noirs?', '182'),
(122, 'Raciste', 'Considerez vous comme raciste? ', '182'),
(123, 'Ceux pour l&#039;été', 'Défendez ici l&#039;été', '183'),
(124, 'Ceux pour l&#039;hiver', 'Défendez ici l&#039;hiver', '183'),
(125, '1', '1', '184'),
(126, 'u', 'wu', '185'),
(127, 'u', 'wu', '186'),
(128, 'u', 'wu', '187'),
(129, '1', '1', '188'),
(130, '1', '1', '189'),
(131, '1', '1', '190'),
(132, '1', '1', '191'),
(133, '1', '1', '192'),
(134, '1', '1', '193'),
(135, '1', '1', '194'),
(136, '1', '1', '195'),
(137, '1', '1', '196'),
(138, 'De belle courbe', 'https://static1.e621.net/data/sample/1c/4d/1c4d0ba6a227e17b0a343fcb8669bbbd.jpg\r\n\r\nl&#039;image par d&#039;elle meme', '197'),
(139, 'Gros fiac', 'https://us.rule34.xxx/thumbnails/5872/thumbnail_fdd72b2b6444bf0b7886f962a783b38c.jpg?6675550\r\n\r\npas besoin d&#039;en rajouter', '197'),
(140, 'Malheureusement elle est deja avec flash', 'photo de eux en pleine action on peut voir qu&#039;elle est plutôt dominate \r\n\r\nhttps://us.rule34.xxx//images/1271/295dae31b0aaca4d76a2aaf01702a51b1210a5c1.jpg?1313163', '197'),
(141, 'Oui', 'justifiez', '198'),
(142, 'vite fait', 'coucou', '198'),
(143, '1', '1', '199'),
(144, 'ee', 'e', '200'),
(145, 'Milk chocolate', 'fejzknfnezfnez', '201'),
(146, 'taille de la quéquète ?', 'zizi', '202'),
(147, 'taille de la quéquète ?', 'zizi', '203'),
(148, 'psvdo,agt ebo,p', 'azvepo,', '204'),
(149, 'veoin', 'veoin', '205'),
(150, 'evonu', 'evoinr', '206'),
(151, 'section1', 'blablabla', '207'),
(152, 'ch&#039;ai pas conclusion', 'blablabla', '207'),
(153, 'evoin', 'fezoein', '208'),
(154, 'zvoin&amp;', 'vzoeni', '209'),
(155, 'zsdf', 'sefg', '210'),
(156, '1', 'section1', '211'),
(157, '1', '1', '212'),
(158, 'La crotte', 'Petite crotte', '214'),
(159, 'Le gros caca la', 'Gros caca', '214'),
(160, 'Torent de l&#039;amazonie', 'Dure vie, ca passe crème (comme le caca ahaha)', '214'),
(161, 'dzdzdz', 'ddzdzdzd', '215'),
(162, 'Rayan', 'odeur tropicale', '216'),
(163, 'Clement', 'Odeur de sushi', '216'),
(164, 'Tanguy', 'Odeur de vrai mec d&#039;info', '216'),
(165, 'Dorian', 'Odeur ?', '216'),
(166, 'section d&#039;assaut ou quoi là', 'negrito', '217'),
(167, 'seelkfj', '', '245'),
(168, '', '', '245'),
(85668, '', '', '246'),
(85669, 'sdflfvavsbdokj', '', '247'),
(85670, 'asldkfa', 'fslkd', '248'),
(85671, 'caca', 'fslkd', '249'),
(85672, 'caca', 'fslkd', '250'),
(85673, 'truc', 'much', '250'),
(85674, 'caca', 'fslkd', '251'),
(85675, 'Avis ?', 'oui', '252'),
(85676, 'Coucou', 'Oui', '253'),
(85677, 'Le liquide en question', '0--------------------', '254'),
(85678, 'le pipi', 'ahana', '254'),
(85679, 'Le caca en public ?', 'La crotte', '255'),
(85680, 'sex ion 1', 'description sex ion 1', '256'),
(85681, '&lt;script&gt; alert(&#039;3&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '257'),
(85682, '&lt;script&gt; alert(&#039;5&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;6&#039;)&lt;/script&gt;', '257'),
(85683, '&lt;script&gt; alert(&#039;3&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '258'),
(85684, '&lt;script&gt; alert(&#039;5&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;6&#039;)&lt;/script&gt;', '258'),
(85685, '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '258'),
(85686, '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '258'),
(85687, '&lt;script&gt; alert(&#039;3&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;4&#039;)&lt;/script&gt;', '259'),
(85688, '&lt;script&gt; alert(&#039;5&#039;)&lt;/script&gt;', '&lt;script&gt; alert(&#039;6&#039;)&lt;/script&gt;', '259'),
(85689, 'sex ion 1', 'description sex ion 1', '260'),
(85690, 'ddd', 'dddd', '261'),
(85691, 'fezfef', 'fezfdcc', '262'),
(85692, 'fezfef', 'fezfdcc', '263'),
(85693, 'd', 'd', '264'),
(85694, 'sex ion 1', 'description sex ion 1', '265'),
(85695, 'sex ion 1', 'description sex ion 1', '266'),
(85696, 'sex ion 1', 'description sex ion 1', '267'),
(85697, 'sex ion 1', 'description sex ion 1', '268'),
(85698, 'sex ion 1', 'description sex ion 1', '269'),
(85699, 'sex ion 1', 'description sex ion 1', '270'),
(85700, 'sex ion 1', 'description sex ion 1', '271'),
(85701, 'azdadza', 'dazdzad', '272'),
(85702, 'dzddd', 'dadz', '273'),
(85704, 'dzdazza', 'dzdazdaz', '275'),
(85705, 'dzdzadz', 'dazdzadazdzadza', '276'),
(85706, 'dzadzd', 'dzadzadaz', '277'),
(85707, 'dzdz', 'dzdzd', '278'),
(85708, 'dzadz', 'dzadzad', '279'),
(85709, 'dzadzadz', 'dzadzadzadazdz', '280'),
(85710, 'fezfefefez', 'ffezfezffddcdsdsvdsvdvs', '281'),
(85711, 'DZADZ', 'DDZDDDDD', '282'),
(85712, 'CCC', 'DD', '283'),
(85713, 'CCCC', 'SSSS', '284'),
(85714, 'DAZDZ', 'DZAD', '285'),
(85716, 'sexion d&#039;(assaut rifle)', 'caca', '274'),
(85717, 'dddzadza', 'dzadazdzad', '286'),
(85718, 'Test', 'Test', '287'),
(85719, 'women', 'ahahahahah', '288'),
(85720, 'men', '*insert chad music*', '288'),
(85725, 'dazdazdazddza', 'dzdzdazadzzdza', '289'),
(85726, 'fezfezfe', 'fzefezfzffezzfff', '290'),
(85728, 'dzd', 'dd', '291'),
(85729, 'sodfj', 'vfojid', '292'),
(85730, 'sldkf,', 'slfk,', '293'),
(85731, 'bebg', 'bfg', '294'),
(85732, 'sdofj', 'sd', '295'),
(85733, 'sdfmlk', 'f', '296'),
(85735, 'zlkj', 'k', '298'),
(85736, 'zgkj', 'bsflkd', '299'),
(85737, 'sv ', 'svd', '300'),
(85738, 'zadazdazaz', 'fefezfefezfze', '301'),
(85739, 'sbfb', 'bsfg', '302'),
(85740, 'sldfk', 'sldkv', '303'),
(85741, 'sbf', 'sdf', '304'),
(85742, 'ffff', 'f', '305'),
(85743, 'fzefze', 'fefze', '297'),
(85744, 'ZDZD', 'DZDZD', '306'),
(85745, 'fezfeezf', 'fezfezfzfezfz', '307'),
(85746, 'DZADZDAD', 'ZADZADZADA', '308'),
(85747, 'dzdaz', 'dzadazd', '309'),
(85748, 'Apres c&#039;est pas une compet :P', 'mais jsuis quand meme meilleur ^^', '310'),
(85749, 'Apres c&#039;est pas une compet :P', 'mais jsuis quand meme meilleur ^^', '311'),
(85750, 'Apres c&#039;est pas une compet :P', 'mais jsuis quand meme meilleur ^^', '312'),
(85751, 'Apres c&#039;est pas une compet :P', 'mais jsuis quand meme meilleur ^^', '313'),
(85752, 'Apres c&#039;est pas une compet :P', 'mais jsuis quand meme meilleur ^^', '314'),
(85753, 'Apres c&#039;est pas une compet :P', 'mais jsuis quand meme meilleur ^^', '315'),
(85754, 'ARRETE LA MECRI', 'STOP (donut sucré au sucre ahahah)', '316'),
(85755, 'ARRETE LA MECRI', 'STOP (donut sucré au sucre ahahah)', '317'),
(85756, 'dzadzaad', 'azdzdazazdzadza', '318'),
(85757, 'Aminecaca', 'pipi', '319'),
(85758, 'mollet blindé', 'weuuu', '320'),
(85759, 'Exclusif', 'Zinedine', '321'),
(85760, 'svdlfk', 'svdlk', '322'),
(85771, 'section 1', 'rep pas', '323'),
(85772, 'section2', 'pas pas', '323'),
(85773, 'svdlfk', 'svdlk', '322'),
(85774, 'svdlfk', 'svdlk', '322'),
(85775, 'svdlfk', 'svdlk', '322'),
(85776, 'svdlfk', 'svdlk', '322'),
(85777, 'svdlfk', 'svdlk', '322'),
(85778, 'svdlfk', 'svdlk', '322'),
(85779, 'svdlfk', 'svdlk', '322'),
(85790, 'zlkj', 'vzldkj', '325'),
(85791, 'svld,', 'sdlfkv,', '324'),
(85792, 'svld,', 'sdlfkv,', '324'),
(85793, 'svld,', 'sdlfkv,', '324'),
(85794, 'svld,', 'sdlfkv,', '324'),
(85795, 'svld,', 'sdlfkv,', '324'),
(85796, 'svld,', 'sdlfkv,', '324'),
(85797, 'zdlfkj', 'sdlkfj', '326'),
(85799, 'dzadzadz', 'adzadazada', '328'),
(85800, 'dzdazdz', 'dazdzaaz', '329'),
(85801, 'dzadazd', 'azdzadzdazada', '330'),
(85803, 'stest', 'test', '331'),
(85804, 'Alors qu&#039;en pensez vous ?', 'Heyyy salut à tous les amiiiisss, c&#039;est David LaFargePokémon !', '332'),
(85815, 'Bon prof', 'Veuillez justifier', '333'),
(85816, 'Mauvais prof', 'Veuillez justifier', '333'),
(85817, 'Titre de la section', 'Description de la section', '334'),
(85823, 'Titre de la section', 'Description de la section', '335'),
(85825, 'Ahah y&#039;a qu&#039;un utilisateur qui voit ça et pas l&#039;autre hihiihi', 'Description de la section', '336'),
(85826, 'czzadzadza', 'dzadazdzadazd', '337'),
(85827, 'dzadzadz', 'adzadazad', '338'),
(85828, 'dzdazdzdaz', 'dzadzadazdzadza', '339'),
(85829, 'fezfezfzefez', 'fezfezf', '340'),
(85830, 'fezfez', 'fezfezfez', '340'),
(85831, 'Votre ressenti?', 'je vous ecoute ;)', '341'),
(85832, 'Catégorie action', '!! ', '342'),
(85833, 'Catégorie horreur', '!!', '342'),
(85834, 'et autre ', ':) ', '342'),
(85835, 'La première section...', 'La description de la deuxième section...', '343');

-- --------------------------------------------------------

--
-- Table structure for table `selected`
--

CREATE TABLE `selected` (
  `loginUser` varchar(50) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `roleName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `selected`
--

INSERT INTO `selected` (`loginUser`, `idQuestion`, `roleName`) VALUES
('anais1', 341, 'autor'),
('anais1', 342, 'autor'),
('Auteur1', 334, 'autor'),
('Auteur1', 336, 'autor'),
('Auteur1', 337, 'autor'),
('Auteur1', 338, 'autor'),
('Auteur1', 339, 'autor'),
('Auteur1', 340, 'autor'),
('FanclubClement', 327, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 234, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 236, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 240, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 241, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 242, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 243, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 244, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 248, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 249, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 256, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 260, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 265, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 266, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 267, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 268, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 269, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 270, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 271, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 274, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 288, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 292, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 293, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 294, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 295, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 296, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 298, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 299, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 300, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 302, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 303, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 304, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 306, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 322, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 324, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 325, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 326, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 332, 'autor'),
('JeRévolutionneLeYoutubeFrançais', 333, 'autor'),
('xXAsian2Xx', 310, 'autor'),
('xXAsian2Xx', 311, 'autor'),
('xXAsian2Xx', 312, 'autor'),
('xXAsian2Xx', 313, 'autor'),
('xXAsian2Xx', 314, 'autor'),
('xXAsian2Xx', 315, 'autor'),
('xXAsian2Xx', 316, 'autor'),
('xXAsian2Xx', 317, 'autor'),
('xXAsian2Xx', 321, 'autor'),
('xXAsian2Xx', 323, 'autor'),
('xXAsian2Xx', 331, 'autor'),
('Auteur1', 342, 'collaborator'),
('azer', 317, 'collaborator'),
('azer', 322, 'collaborator'),
('azer', 324, 'collaborator'),
('CyrilleN', 304, 'collaborator'),
('CyrilleN', 317, 'collaborator'),
('CyrilleN', 321, 'collaborator'),
('CyrilleN', 327, 'collaborator'),
('CyrilleN', 333, 'collaborator'),
('CyrilleN', 341, 'collaborator'),
('D4rkuwuGirl', 292, 'collaborator'),
('D4rkuwuGirl', 303, 'collaborator'),
('D4rkuwuGirl', 304, 'collaborator'),
('D4rkuwuGirl', 321, 'collaborator'),
('D4rkuwuGirl', 325, 'collaborator'),
('D4rkuwuGirl', 327, 'collaborator'),
('D4rkuwuGirl', 341, 'collaborator'),
('Dodo', 323, 'collaborator'),
('Dodo', 326, 'collaborator'),
('Dodo', 331, 'collaborator'),
('Dodo', 332, 'collaborator'),
('Dodo', 333, 'collaborator'),
('DodoAdmin', 326, 'collaborator'),
('DodoAdmin', 331, 'collaborator'),
('DodoAdmin', 341, 'collaborator'),
('FanclubClement', 323, 'collaborator'),
('FanclubClement', 331, 'collaborator'),
('FanclubClement', 333, 'collaborator'),
('FanclubClement', 341, 'collaborator'),
('JeRévolutionneLeYoutubeFrançais', 331, 'collaborator'),
('Nathan', 302, 'collaborator'),
('Nathan', 326, 'collaborator'),
('Utilisateur1', 334, 'collaborator'),
('Utilisateur1', 335, 'collaborator'),
('Utilisateur1', 337, 'collaborator'),
('Utilisateur1', 338, 'collaborator'),
('Utilisateur1', 339, 'collaborator'),
('Utilisateur1', 340, 'collaborator'),
('Utilisateur2', 334, 'collaborator'),
('Utilisateur2', 335, 'collaborator'),
('Utilisateur2', 336, 'collaborator'),
('Utilisateur2', 337, 'collaborator'),
('Utilisateur2', 338, 'collaborator'),
('Utilisateur2', 339, 'collaborator'),
('Utilisateur2', 340, 'collaborator'),
('anais', 342, 'voter'),
('azer', 321, 'voter'),
('azer', 327, 'voter'),
('D4rkuwuGirl', 317, 'voter'),
('D4rkuwuGirl', 322, 'voter'),
('D4rkuwuGirl', 324, 'voter'),
('D4rkuwuGirl', 331, 'voter'),
('D4rkuwuGirl', 333, 'voter'),
('Dodo', 317, 'voter'),
('Dodo', 321, 'voter'),
('Dodo', 324, 'voter'),
('Nathan', 300, 'voter'),
('Nathan', 303, 'voter'),
('Nathan', 304, 'voter');

-- --------------------------------------------------------

--
-- Table structure for table `Tags`
--

CREATE TABLE `Tags` (
  `idTag` int(11) NOT NULL,
  `nameTag` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Tags`
--

INSERT INTO `Tags` (`idTag`, `nameTag`) VALUES
(29, 'hiver'),
(30, 'été'),
(31, 'chaleur'),
(32, 'froideur'),
(33, 'test'),
(34, 'Automobile'),
(35, 'Formule1'),
(36, 'Voiture'),
(37, 'Mécanique'),
(38, 'Jamal'),
(39, 'Bonjour'),
(40, 'Sun'),
(41, 'Moon'),
(42, 'Day'),
(43, 'Night'),
(44, 'caca'),
(45, 'truc'),
(46, 'Q5'),
(47, 'odeur'),
(48, 'info'),
(49, 'coucou'),
(50, 'tagueule'),
(51, 'zizi'),
(52, 'prout'),
(53, 'diahrée'),
(54, 'bidule'),
(55, 'zer'),
(56, 'azer'),
(57, '&lt;script&gt; alert(&#039;8&#039;)&lt;/script&gt;'),
(58, '&lt;h3&gt; aze&lt;/h3&gt;'),
(59, '&lt;h1&gt; caca&lt;/h1&gt;'),
(60, ''),
(61, 'machin-machine'),
(62, 'lol'),
(63, 'Sport'),
(64, 'Rire'),
(65, 'Blague'),
(66, 'le pipi'),
(67, 'pipi'),
(68, 'Donuts'),
(69, 'Sucre'),
(70, 'éducation'),
(71, 'php'),
(72, 'harmonisation'),
(73, 'Vote'),
(74, 'v'),
(75, 'réponse'),
(76, 'voter'),
(77, 'chocolat'),
(78, 'jeu'),
(79, 'play');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `loginUser` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `avatarUrl` varchar(100) DEFAULT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`loginUser`, `email`, `password`, `avatarUrl`, `name`) VALUES
('&lt;h1&gt;salut&lt;/h1&gt;', '&lt;h1&gt;salut&lt;/h1&gt;', '$2y$10$Ro8bGtVXwVFd3BcVFIzc3O3s/sgM5VkQo7qF5IImXharkIEeWAMtK', '../web/img/pp.png', '&lt;h1&gt;salut&lt;/h1&gt;'),
('Administrateur1', 'administrateur1@gmail.com', '$2y$10$zI33dwbMYSXNkl7ANxR96.t6RHMN77mGrnq3BlvekQyZP1pcX7IX6', '../web/img/pp.png', 'Administrateur1'),
('anais', 'anais@gmail.com', '$2y$10$cjfHDyuUh3IJ6dq6KQWhjuYRglxTxw/1UOf/4RGDc7eK2azfa4QFO', '../web/img/pp.png', 'anais'),
('anais1', 'anais.pp@gmail.com', '$2y$10$VWdXy7GAEor9DJcuhGvTjOTUI.vO/DvuUh87UvMiiJeGILtcvkYnu', '../web/img/pp.png', 'anais1'),
('Auteur1', 'auteur1@gmail.com', '$2y$10$mclQ6vcMFchiMnBLg462CeL/uRAys2IcFPa8D48BFzkWzle1zoihu', '../web/img/pp.png', 'Auteur1'),
('azer', 'zert', '$2y$10$utIruYjtZXVh40uU5OAUxuYE2Br6VkIeJAT0dwjEczbJAGBLywQ5m', '../web/img/pp.png', 'azer'),
('CyrilleN', 'cyrille.nadal@umontpellier.fr', '$2y$10$YCI/g1ZxaWTWaxDNtt/FN..lUaNmW.LON9.72tHLp8132ZuhZ.Yq6', '../web/img/pp.png', 'CyrilleN'),
('D4rkuwuGirl', 'anais.andr07@gmail.com', '$2y$10$reqDyZy7H8bjo/S504slWurkgBHmhpcbBLov7uzCDB9i3r0q7XIxe', '../web/img/pp.png', 'D4rkuwuGirl'),
('Dodo', 'dodo@gmail.com', '$2y$10$GcixTsT8LFNwGq7T6aAgmOe9rSZWZeD3pTd60N6guaEDNIe0feyz.', '../web/img/pp.png', 'Dodo'),
('DodoAdmin', 'dodoadmin@gmail.com', '$2y$10$dLDAdFQIVIhFyQToIBplZ.a6Rt3BVN1rUztT8GCOQpJ9m4CI3De5e', '../web/img/pp.png', 'DodoAdmin'),
('FanclubClement', 'clementlpb@LOVE.com', '$2y$10$8VSo/Vk2Dd5Eafp13DcjJe2IrcrZ/7JGUCpWZb7.8fem1kr7iEsXi', '../web/img/pp.png', 'FanclubClement'),
('JeRévolutionneLeYoutubeFrançais', 'macet', '$2y$10$k9H0711ETrSS7oKEgjlMdO9Nietn3maACW0mUSIJ43eiYTQov2oJ.', '../web/img/pp.png', 'JeRévolutionneLeYoutubeFrançais'),
('Nathan', 'nathan@nathan.nathan', '$2y$10$tEWa56INlaX6mAi4dLFgEuuH6agNImwSRHP3OZ0eSv.HBcO5zsvze', '../web/img/pp.png', 'Nathan'),
('Test', 'test@gmail.com', '$2y$10$cdfSBKXw3MBZqSlqEKqQp.YGJik0nVw7dJE6c61xGwi1WML3b02M2', '../web/img/pp.png', 'Test'),
('testAdmin', 'testAdmin@gmail.com', '$2y$10$EMoqlcQkgJP3K0Owb7E22.GtexbLf0EY.HSTufboVOwhObSk6ovv.', '../web/img/pp.png', 'testAdmin'),
('Utilisateur1', 'utilisateur1@gmail.Com', '$2y$10$YShcDhNqdYvCnGxFQPWNVON9AhH0jEjIfoJz2IhV32nrP2U3fIw.i', '../web/img/pp.png', 'Utilisateur1'),
('Utilisateur2', 'utilisateur2@gmail.com', '$2y$10$PkkbUNEfoLCHb5XTqfuVxui.UOCPcf/GgDgwDfMHxYaA9Wp89Y7DW', '../web/img/pp.png', 'Utilisateur2'),
('Utilisateur5', 'utilisateur5@gmail.com', '$2y$10$X5fDG8n8UEcfUamjFoFYvurOtwiwHkBxhXX4Rfl5QdOMch6v0ZNKu', '../web/img/pp.png', 'Utilisateur5'),
('xXAsian2Xx', 'asian@rawr.io', '$2y$10$ZvYGt6G1PnLQ78HtEetem.8SYm.o4S2O4gho7eUMbwK9PwLyMmH22', '../web/img/pp.png', 'xXAsian2Xx'),
('xXAsiatDu74Xx', 'asiat@asie.asia', '$2y$10$aCcJW4vDSt30NRs345wqiuFJWdIHWr1H7AC8LPqfrer8xgu4QKwFi', '../web/img/pp.png', 'xXAsiatDu74Xx'),
('xXNewAsian34Xx', 'caca@rawr.com', '$2y$10$g.LzRGF1WAepwE4w4XhL4O7Q2rj/uo1dOodA5UEWMFfvxVCDIV772', '../web/img/pp.png', 'xXNewAsian34Xx');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `idUtilisateur` int(11) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `adresseMail` varchar(256) DEFAULT NULL,
  `profilePictureName` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idUtilisateur`, `login`, `password`, `adresseMail`, `profilePictureName`) VALUES
(1, 'lebreton', '$2y$10$RkCmlLZIeJn757hgpiH.2eYXFDc7DeBz6ZFowKmJPxR/IuuI5qO9i', 'lebreton@yopmail.com', 'anonyme.jpg'),
(2, '<h1>Login</h1>', '$2y$10$RkCmlLZIeJn757hgpiH.2eYXFDc7DeBz6ZFowKmJPxR/IuuI5qO9i', 'login@yopmail.com', 'anonyme.jpg'),
(3, 'Rapidement', '$2y$10$mULLMmXil3XMZSSEE.Z3Ne1/U7bEoCTn1IdPNPaHekEOCRqzSOQtG', 'rapidement@gmail.com', '6409eb109ba5b.png'),
(4, 'Escalope', '$2y$10$MgaQoLXGBm5wOSZNl2uwq.yBUvy/o7d1L03WZBIY7Uh.Ntl.fWI4e', 'escalope@gmail.com', '64117528da51f.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `voteFor`
--

CREATE TABLE `voteFor` (
  `idAnswer` int(11) NOT NULL,
  `loginUser` varchar(50) NOT NULL,
  `vote` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voteFor`
--

INSERT INTO `voteFor` (`idAnswer`, `loginUser`, `vote`) VALUES
(1023, 'Utilisateur1', 1),
(1024, 'Utilisateur1', -1),
(1025, 'Administrateur1', 1),
(1025, 'Utilisateur2', 1),
(1026, 'Utilisateur2', 1),
(1027, 'Auteur1', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Administrators`
--
ALTER TABLE `Administrators`
  ADD PRIMARY KEY (`loginUser`);

--
-- Indexes for table `Answers`
--
ALTER TABLE `Answers`
  ADD PRIMARY KEY (`idAnswer`),
  ADD KEY `answer_fk1` (`idSection`),
  ADD KEY `answer_fk2` (`loginUser`);

--
-- Indexes for table `Autors`
--
ALTER TABLE `Autors`
  ADD PRIMARY KEY (`loginUser`);

--
-- Indexes for table `has_tag`
--
ALTER TABLE `has_tag`
  ADD PRIMARY KEY (`idQuestion`,`idTag`),
  ADD KEY `hastag_fk2` (`idTag`);

--
-- Indexes for table `participate`
--
ALTER TABLE `participate`
  ADD PRIMARY KEY (`loginUser`,`idAnswer`);

--
-- Indexes for table `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`idPublication`),
  ADD KEY `publications_FK` (`idAuteur`);

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`idQuestion`),
  ADD KEY `Questions_ibfk_1` (`loginUser`);

--
-- Indexes for table `recovery_code`
--
ALTER TABLE `recovery_code`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `loginUser` (`loginUser`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`roleName`);

--
-- Indexes for table `Sections`
--
ALTER TABLE `Sections`
  ADD PRIMARY KEY (`idSection`),
  ADD KEY `idQuestion` (`idQuestion`);

--
-- Indexes for table `selected`
--
ALTER TABLE `selected`
  ADD PRIMARY KEY (`loginUser`,`idQuestion`),
  ADD KEY `selected_ibfk_2` (`idQuestion`),
  ADD KEY `selected_ibfk_3` (`roleName`);

--
-- Indexes for table `Tags`
--
ALTER TABLE `Tags`
  ADD PRIMARY KEY (`idTag`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`loginUser`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `utilisateurs_UN` (`login`),
  ADD UNIQUE KEY `utilisateurs_UN2` (`adresseMail`);

--
-- Indexes for table `voteFor`
--
ALTER TABLE `voteFor`
  ADD PRIMARY KEY (`idAnswer`,`loginUser`),
  ADD KEY `voteFor_fk1` (`loginUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Answers`
--
ALTER TABLE `Answers`
  MODIFY `idAnswer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1031;

--
-- AUTO_INCREMENT for table `publications`
--
ALTER TABLE `publications`
  MODIFY `idPublication` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `idQuestion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `Sections`
--
ALTER TABLE `Sections`
  MODIFY `idSection` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85836;

--
-- AUTO_INCREMENT for table `Tags`
--
ALTER TABLE `Tags`
  MODIFY `idTag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Administrators`
--
ALTER TABLE `Administrators`
  ADD CONSTRAINT `Administrators_ibfk_1` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Answers`
--
ALTER TABLE `Answers`
  ADD CONSTRAINT `answer_fk1` FOREIGN KEY (`idSection`) REFERENCES `Sections` (`idSection`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answer_fk2` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Autors`
--
ALTER TABLE `Autors`
  ADD CONSTRAINT `Autors_ibfk_1` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `has_tag`
--
ALTER TABLE `has_tag`
  ADD CONSTRAINT `hastag_fk1` FOREIGN KEY (`idQuestion`) REFERENCES `Questions` (`idQuestion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hastag_fk2` FOREIGN KEY (`idTag`) REFERENCES `Tags` (`idTag`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participate`
--
ALTER TABLE `participate`
  ADD CONSTRAINT `participate_fk_2` FOREIGN KEY (`idAnswer`) REFERENCES `Answers` (`idAnswer`),
  ADD CONSTRAINT `participate_ibfk_1` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`);

--
-- Constraints for table `publications`
--
ALTER TABLE `publications`
  ADD CONSTRAINT `publications_FK` FOREIGN KEY (`idAuteur`) REFERENCES `utilisateurs` (`idUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Questions`
--
ALTER TABLE `Questions`
  ADD CONSTRAINT `Questions_ibfk_1` FOREIGN KEY (`loginUser`) REFERENCES `Autors` (`loginUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recovery_code`
--
ALTER TABLE `recovery_code`
  ADD CONSTRAINT `recovery_code_ibfk_1` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`);

--
-- Constraints for table `selected`
--
ALTER TABLE `selected`
  ADD CONSTRAINT `selected_ibfk_1` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `selected_ibfk_2` FOREIGN KEY (`idQuestion`) REFERENCES `Questions` (`idQuestion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `selected_ibfk_3` FOREIGN KEY (`roleName`) REFERENCES `Roles` (`roleName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voteFor`
--
ALTER TABLE `voteFor`
  ADD CONSTRAINT `voteFor_fk1` FOREIGN KEY (`loginUser`) REFERENCES `Users` (`loginUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `voteFor_fk2` FOREIGN KEY (`idAnswer`) REFERENCES `Answers` (`idAnswer`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
