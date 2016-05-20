-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 09 Mai 2016 à 16:21
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `db_school`
--

CREATE DATABASE IF NOT EXISTS `db_school`;

USE `db_school`;

-- --------------------------------------------------------

--
-- Structure de la table `t_formation`
--

CREATE TABLE IF NOT EXISTS `t_formation` (
  `idFormation` int(11) NOT NULL AUTO_INCREMENT,
  `forTitle` varchar(45) NOT NULL,
  `forDescription` text NOT NULL,
  `forDate` date NOT NULL,
  `forLenght` varchar(10) NOT NULL,
  `forPrice` double NOT NULL,
  PRIMARY KEY (`idFormation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_formation`
--

INSERT INTO `t_formation` (`idFormation`, `forTitle`, `forDescription`, `forDate`, `forLenght`, `forPrice`) VALUES
(1, 'Bureautique', 'Familiarisation des outils de la suite Office', '0000-00-00', '32h', 300),
(2, 'Yoga', 'Liberation du cycle des renaissance ', '0000-00-00', '48h', 700),
(3, 'Programmation', 'Dans le domaine de l''informatique, la programmation est l''ensemble des activités qui permettent l''écriture des programmes informatiques. C''est une étape importante du développement de logiciels (voire de matériel).\r\n\r\nPour écrire un programme, on utilise un langage de programmation. Un logiciel est un ensemble de programmes (qui peuvent être écrits dans des langages de programmation différents) dédié à la réalisation de certaines tâches par un (ou plusieurs) utilisateurs du logiciel.', '2008-08-08', '89h', 2400);

-- --------------------------------------------------------

--
-- Structure de la table `t_mustteach`
--

CREATE TABLE IF NOT EXISTS `t_mustteach` (
  `fkFormation` int(11) NOT NULL,
  `fkTeacher` int(11) NOT NULL,
  PRIMARY KEY (`fkFormation`,`fkTeacher`),
  KEY `fk_t_mustTeach_t_teacher1` (`fkTeacher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_mustteach`
--

INSERT INTO `t_mustteach` (`fkFormation`, `fkTeacher`) VALUES
(1, 2),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `t_register`
--

CREATE TABLE IF NOT EXISTS `t_register` (
  `idRegister` int(11) NOT NULL,
  `regDate` date NOT NULL,
  `fkFormation` int(11) NOT NULL,
  `fkStudent` int(11) NOT NULL,
  PRIMARY KEY (`idRegister`,`fkFormation`,`fkStudent`),
  KEY `fk_t_register_t_formation1` (`fkFormation`),
  KEY `fk_t_register_t_student1` (`fkStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `t_register`
--

INSERT INTO `t_register` (`idRegister`, `regDate`, `fkFormation`, `fkStudent`) VALUES
(0, '2015-05-02', 1, 7),
(0, '2002-04-09', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `t_satisfaction`
--

CREATE TABLE IF NOT EXISTS `t_satisfaction` (
  `idSatisfaction` int(11) NOT NULL AUTO_INCREMENT,
  `satNote` varchar(45) NOT NULL,
  `satComment` varchar(45) NOT NULL,
  `fkFormation` int(11) NOT NULL,
  `fkStudent` int(11) NOT NULL,
  PRIMARY KEY (`idSatisfaction`,`fkFormation`,`fkStudent`),
  KEY `fk_t_satisfaction_t_formation1` (`fkFormation`),
  KEY `fk_t_satisfaction_t_student1` (`fkStudent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_satisfaction`
--

INSERT INTO `t_satisfaction` (`idSatisfaction`, `satNote`, `satComment`, `fkFormation`, `fkStudent`) VALUES
(1, '4', 'Super Cours', 1, 4),
(2, '3', 'Super cours, vraiment super !', 2, 3),
(3, '1', 'Ce cours est nul et très casse tête', 3, 12);

-- --------------------------------------------------------

--
-- Structure de la table `t_sequence`
--

CREATE TABLE IF NOT EXISTS `t_sequence` (
  `idSequence` int(11) NOT NULL AUTO_INCREMENT,
  `seqNumber` varchar(45) NOT NULL,
  `seqDate` varchar(45) NOT NULL,
  `fkStudent` int(11) NOT NULL,
  `fkTeacher` int(11) NOT NULL,
  PRIMARY KEY (`idSequence`,`fkStudent`,`fkTeacher`),
  KEY `fk_t_sequence_t_student1` (`fkStudent`),
  KEY `fk_t_sequence_t_teacher1` (`fkTeacher`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `t_sequence`
--

INSERT INTO `t_sequence` (`idSequence`, `seqNumber`, `seqDate`, `fkStudent`, `fkTeacher`) VALUES
(1, '4', '2012-7-09', 3, 2),
(2, '3', '2010-4-04', 5, 3),
(3, '3', '2006-08-03', 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `t_student`
--

CREATE TABLE IF NOT EXISTS `t_student` (
  `idStudent` int(11) NOT NULL AUTO_INCREMENT,
  `stuLastName` varchar(45) NOT NULL,
  `stuFirstName` varchar(45) NOT NULL,
  `stuNPA` int(4) NOT NULL,
  `stuCity` varchar(30) NOT NULL,
  `stuAddress` varchar(60) NOT NULL,
  `stuEmail` varchar(60) NOT NULL,
  `stuPhoneNumber` varchar(13) NOT NULL,
  PRIMARY KEY (`idStudent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `t_student`
--

INSERT INTO `t_student` (`idStudent`, `stuLastName`, `stuFirstName`, `stuNPA`, `stuCity`, `stuAddress`, `stuEmail`, `stuPhoneNumber`) VALUES
(1, 'Jean', 'Dujardin', 1170, 'Aubonne', 'Rue du Morges 4', 'jean.dujardin@gmail.com', '079 367 29 12'),
(2, 'James', 'Bond', 1880, 'Bex', 'Rue Charles 1er 11bis', 'james.bond@bluewin.ch', '021 800 54 66'),
(3, 'Pierre', 'Clovis', 1860, 'Aigle', 'Rue de la Monarchie 56', 'pierre.clovis@hotmail.com', '078 256 32 23'),
(4, 'Edward', 'Newgate', 1800, 'Vevey', 'Rue Napoléon 5ter', 'edward@newgate@gmail.com', '123 456 78 91'),
(5, 'Yonkuno', 'Kaido', 1004, 'Lausanne', 'Chemin asiatique 556 quadro', 'yonkuno.kaido@judosuisse.ch', '021 856 65 89'),
(6, 'Marshall', 'Teach', 1004, 'Lausanne', 'Chemin grecs 13', 'marshall.teach@suisse.ch', '078 879 45 51'),
(7, 'Sakazuki', 'Akainu', 1004, 'Lausanne', 'Chemin grecs 14', 'sakazuki.akainu@gmail.com', '079 365 12 12'),
(8, 'Borsalino', 'Kizaru', 1800, 'Vevey', 'Rue Chaplin 5 bis', 'borsalino.kizaru@outlook.com', '077 222 36 36'),
(9, 'Kuzan', 'Aokiji', 1701, 'Fribourg', 'Rue Sertage 6', 'kuzan.aokiji@bluemail.ch', '022 563 35 25'),
(10, 'Son', 'Goku', 1009, 'Pully', 'Chemin Cochet 5', 'son.goku@tropheedumarchairuz.ch', '079 365 28 11'),
(11, 'Itchino', 'Saggat', 1008, 'Prilly', 'Rue Portos 36', 'itchino.saggat@orange.ch', '078 162 85 85'),
(12, 'Buakaw', 'Banchamek', 1860, 'Aigle', 'Passe Nadir 65', 'buakaw.banchamek@salt.ch', '023 623 95 45'),
(13, 'Robert ', 'Philips', 1701, 'Fribourg', 'Chemin de la Rue 6', 'robert.philips@sunrise.ch', '079 745 62 32');

-- --------------------------------------------------------

--
-- Structure de la table `t_teacher`
--

CREATE TABLE IF NOT EXISTS `t_teacher` (
  `idTeacher` int(11) NOT NULL AUTO_INCREMENT,
  `teaLastName` varchar(45) NOT NULL,
  `teaFirstName` varchar(45) NOT NULL,
  `teaNPA` int(4) NOT NULL,
  `teaCity` varchar(30) NOT NULL,
  `teaAddress` varchar(60) NOT NULL,
  `teaEmail` varchar(60) NOT NULL,
  `teaPhoneNumber` varchar(13) NOT NULL,
  `teaQualification` varchar(45) NOT NULL,
  PRIMARY KEY (`idTeacher`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_teacher`
--

INSERT INTO `t_teacher` (`idTeacher`, `teaLastName`, `teaFirstName`, `teaNPA`, `teaCity`, `teaAddress`, `teaEmail`, `teaPhoneNumber`, `teaQualification`) VALUES
(1, 'Bart', 'Jean ', 1188, 'Gimel', 'Chemin des Jonquilles 34', 'j.bart@hotmail.ch', '+41798956265', 'Microsoft ASP.net, Electrotechnique, Fabricat'),
(2, 'Philipps ', 'Trevor', 1080, 'Vevey', 'Los Santos Avenue 2234', 't.philipps@gtav.com', '+41895612345', 'EPS, Aeronautique, '),
(3, 'Clinton', 'Franklin', 1004, 'Lausanne', 'Chamberlain Hills 4552', 'f.clinton@gmail.com', '+41795642535', 'EPS, Math?matique, Physique, Musique'),
(4, 'Chávez', 'Rico', 1004, 'Lausanne', 'Camino San Helena 4879', 'r.chavez@liberta.com', '+41794562325', 'Histoire, Economie, Tir sportif'),
(5, 'Tortski', 'Arisaka', 1080, 'Vevey', 'Doroga Khromova', 't.arisaka@mitsubishi.ja', '+41265412789', 'Ski de fond, Ski de piste, Bobsleigh '),
(6, 'Browing', 'Peter', 1880, 'Bex', 'Rue Fonds des Tawes', 'p.browing@fnherstal.be', '+45789563546', 'M?chanique de pr?cision, Tir sportif, Economi');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_mustteach`
--
ALTER TABLE `t_mustteach`
  ADD CONSTRAINT `fk_t_mustTeach_t_formation1` FOREIGN KEY (`fkFormation`) REFERENCES `t_formation` (`idFormation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_mustTeach_t_teacher1` FOREIGN KEY (`fkTeacher`) REFERENCES `t_teacher` (`idTeacher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `t_register`
--
ALTER TABLE `t_register`
  ADD CONSTRAINT `fk_t_register_t_formation1` FOREIGN KEY (`fkFormation`) REFERENCES `t_formation` (`idFormation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_register_t_student1` FOREIGN KEY (`fkStudent`) REFERENCES `t_student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `t_satisfaction`
--
ALTER TABLE `t_satisfaction`
  ADD CONSTRAINT `fk_t_satisfaction_t_formation1` FOREIGN KEY (`fkFormation`) REFERENCES `t_formation` (`idFormation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_satisfaction_t_student1` FOREIGN KEY (`fkStudent`) REFERENCES `t_student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `t_sequence`
--
ALTER TABLE `t_sequence`
  ADD CONSTRAINT `fk_t_sequence_t_student1` FOREIGN KEY (`fkStudent`) REFERENCES `t_student` (`idStudent`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_t_sequence_t_teacher1` FOREIGN KEY (`fkTeacher`) REFERENCES `t_teacher` (`idTeacher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
