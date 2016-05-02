-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 02 Mai 2016 à 15:14
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
(3, '1', 'Ce cours est nul et trés casse tête', 3, 12);

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
  PRIMARY KEY (`idStudent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `t_student`
--

INSERT INTO `t_student` (`idStudent`, `stuLastName`, `stuFirstName`) VALUES
(1, 'Jean', 'Dujardin'),
(2, 'James', 'Bond'),
(3, 'Pierre', 'Clovis'),
(4, 'Edward', 'Newgate'),
(5, 'Yonkuno', 'Kaido'),
(6, 'Marshall', 'Teach'),
(7, 'Sakazuki', 'Akainu'),
(8, 'Borsalino', 'Kizaru'),
(9, 'Kuzan', 'Aokiji'),
(10, 'Son', 'Goku'),
(11, 'Itchino', 'Saggat'),
(12, 'Buakaw', 'Banchamek'),
(13, 'Robert ', 'Philips');

-- --------------------------------------------------------

--
-- Structure de la table `t_teacher`
--

CREATE TABLE IF NOT EXISTS `t_teacher` (
  `idTeacher` int(11) NOT NULL AUTO_INCREMENT,
  `teaLastName` varchar(45) NOT NULL,
  `teaFirstName` varchar(45) NOT NULL,
  `teaAddress` varchar(60) NOT NULL,
  `teaEmail` varchar(60) NOT NULL,
  `teaPhoneNumber` varchar(13) NOT NULL,
  `teaQualification` varchar(45) NOT NULL,
  PRIMARY KEY (`idTeacher`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `t_teacher`
--

INSERT INTO `t_teacher` (`idTeacher`, `teaLastName`, `teaFirstName`, `teaAddress`, `teaEmail`, `teaPhoneNumber`, `teaQualification`) VALUES
(1, 'Bart', 'Jean ', 'Chemin des Jonquilles 34', 'j.bart@hotmail.ch', '+41798956265', 'Microsoft ASP.net, Electrotechnique, Fabricat'),
(2, 'Philipps ', 'Trevor', 'Los Santos Avenue 2234', 't.philipps@gtav.com', '+41895612345', 'EPS, Aeronautique, '),
(3, 'Clinton', 'Franklin', 'Chamberlain Hills 4552', 'f.clinton@gmail.com', '+41795642535', 'EPS, Math?matique, Physique, Musique'),
(4, 'Chávez', 'Rico', 'Camino San Helena 4879', 'r.chavez@liberta.com', '+41794562325', 'Histoire, Economie, Tir sportif'),
(5, 'Tortski', 'Arisaka', 'Doroga Khromova', 't.arisaka@mitsubishi.ja', '+41265412789', 'Ski de fond, Ski de piste, Bobsleigh '),
(6, 'Browing', 'Peter', 'Rue Fonds des Tawes', 'p.browing@fnherstal.be', '+45789563546', 'M?chanique de pr?cision, Tir sportif, Economi');

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
