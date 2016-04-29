SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

DROP DATABASE IF EXISTS `db_redwire`;
CREATE DATABASE IF NOT EXISTS `db_redwire` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_redwire`;

-- --------------------------------------------------------

--
-- Structure de la table `t_article` (articles)
--

DROP TABLE IF EXISTS `t_article`;
CREATE TABLE IF NOT EXISTS `t_article` (
  `idArticle` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artType` varchar(50) NOT NULL,
  `artBrand` varchar(50) NOT NULL, /* Marque */
  `artDescription` text NOT NULL,
  `artPrice` decimal(5,2) NOT NULL,
  `fkSupplier` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `fkSupplier` (`fkSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_client` (clients)
--

DROP TABLE IF EXISTS `t_client`;
CREATE TABLE IF NOT EXISTS `t_client` (
  `idClient` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cliName` varchar(50) NOT NULL,
  `cliFirstName` varchar(50) NOT NULL,
  `cliStreet` varchar(50) NOT NULL,
  `cliStreetNb` tinyint(3) unsigned NOT NULL,
  `cliLocation` varchar(50) NOT NULL,
  `cliPostalCode` varchar(10) NOT NULL,
  `cliTelNb` varchar(20) NOT NULL,
  `cliFaxNb` varchar(20) NOT NULL,
  `cliEmail` varchar(200) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_order` (commandes)
--

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE IF NOT EXISTS `t_order` (
  `idOrder` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordDate` date NOT NULL,
  `fkClient` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fkClient` (`fkClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_orderdetail` (détail des commandes)
--

DROP TABLE IF EXISTS `t_orderdetail`;
CREATE TABLE IF NOT EXISTS `t_orderdetail` (
  `idfkArticle` int(5) unsigned NOT NULL,
  `idfkOrder` int(5) unsigned NOT NULL,
  `detQuantity` smallint(5) NOT NULL,
  PRIMARY KEY (`idfkArticle`,`idfkOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_supplier` (fournisseurs)
--

DROP TABLE IF EXISTS `t_supplier`;
CREATE TABLE IF NOT EXISTS `t_supplier` (
  `idSupplier` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `supName` varchar(50) NOT NULL,
  `supStreet` varchar(50) NOT NULL,
  `supStreetNb` tinyint(3) unsigned DEFAULT NULL,
  `supLocation` varchar(50) NOT NULL,
  `supPostalCode` varchar(10) NOT NULL,
  `supCountry` varchar(50) NOT NULL,
  `supTelNb` varchar(20) NOT NULL,
  `supUrl` text,
  `supEmail` varchar(200) NOT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `t_suppliercontact`
--

DROP TABLE IF EXISTS `t_suppliercontact`;
CREATE TABLE IF NOT EXISTS `t_suppliercontact` (
  `idContact` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `conName` varchar(50) NOT NULL,
  `conFirstName` varchar(50) NOT NULL,
  `conTelNb` varchar(20) NOT NULL,
  `conEmail` varchar(200) DEFAULT NULL,
  `fkSupplier` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`idContact`),
  KEY `fkSupplier` (`fkSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `t_article`
  ADD CONSTRAINT `t_article_ibfk_1` FOREIGN KEY (`fkSupplier`) REFERENCES `t_supplier` (`idSupplier`);

--
-- Contraintes pour la table `t_order`
--
ALTER TABLE `t_order`
  ADD CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`fkClient`) REFERENCES `t_client` (`idClient`);

--
-- Contraintes pour la table `t_orderdetail`
--
ALTER TABLE `t_orderdetail`
  ADD CONSTRAINT `t_orderdetail_ibfk_2` FOREIGN KEY (`idfkArticle`) REFERENCES `t_article` (`idArticle`),
  ADD CONSTRAINT `t_orderdetail_ibfk_1` FOREIGN KEY (`idfkOrder`) REFERENCES `t_order` (`idOrder`);

--
-- Contraintes pour la table `t_suppliercontact`
--
ALTER TABLE `t_suppliercontact`
  ADD CONSTRAINT `t_suppliercontact_ibfk_1` FOREIGN KEY (`fkSupplier`) REFERENCES `t_supplier` (`idSupplier`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
