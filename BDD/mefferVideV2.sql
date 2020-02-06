-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 05 fév. 2020 à 14:33
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `meffer`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `ecrire_controle`$$
CREATE DEFINER=`root`@`%` PROCEDURE `ecrire_controle` (`idPoste` INT, `idRef` INT, `dateHeureControle` DATETIME, `idUser` INT, `resultat` TINYINT(1))  BEGIN
	INSERT INTO `controles` (`poste_id`, `ref_id`, `timestamp`, `user_id`, `resultat`)
    VALUES (`idPoste`, `idRef`, `dateHeureControle`, `idUser`, `resultat`);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `controles`
--

DROP TABLE IF EXISTS `controles`;
CREATE TABLE IF NOT EXISTS `controles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `poste_id` int(11) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `resultat` tinyint(1) NOT NULL,
  `resultat_qualite` varchar(3) NOT NULL,
  `resultat_reference` varchar(3) NOT NULL,
  `resultat_date` varchar(3) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `poste_idfk_idx` (`poste_id`),
  KEY `ref_idfk_idx` (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `postes`
--

DROP TABLE IF EXISTS `postes`;
CREATE TABLE IF NOT EXISTS `postes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poste` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `postes`
--

INSERT INTO `postes` (`id`, `poste`) VALUES
(1, 'Poste1'),
(2, 'Poste2'),
(3, 'Poste3'),
(4, 'Poste4'),
(5, 'Poste5'),
(6, 'Poste6'),
(7, 'Poste7'),
(8, 'Poste8'),
(9, 'Poste9'),
(10, 'Poste10'),
(11, 'Poste11'),
(12, 'Poste12'),
(13, 'Poste13'),
(14, 'Poste14'),
(15, 'Poste15'),
(16, 'Poste16'),
(17, 'Poste17'),
(18, 'Poste18');

-- --------------------------------------------------------

--
-- Structure de la table `references`
--

DROP TABLE IF EXISTS `references`;
CREATE TABLE IF NOT EXISTS `references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(13) DEFAULT NULL,
  `poste_id` int(11) NOT NULL,
  `photo` blob,
  `designation` varchar(45) DEFAULT NULL,
  `date_reference` tinyint(2) DEFAULT NULL,
  `adresse_photo` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `poste_idfk_idx` (`poste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `references`
--

INSERT INTO `references` (`id`, `reference`, `poste_id`, `photo`, `designation`, `date_reference`, `adresse_photo`) VALUES
(9, '98.098.400.80', 3, NULL, 'VIS M6 X L20', NULL, 'images/References/98_098_400_80.png'),
(10, '96.832.120.80', 3, NULL, 'OBTURATEUR D30 BI-MAT', NULL, 'images/References/96_832_120_80.png'),
(11, '79.030.082.35', 3, NULL, 'VIS TORX', NULL, 'images/References/79_030_082_35.png'),
(12, '98.019.893.80', 3, NULL, 'ECROU A SERTIR', NULL, 'images/References/98_019_893_80.png'),
(13, '98.201.642.80', 3, NULL, 'ECROU A SERTIR', NULL, 'images/References/98_201_642_80.png'),
(14, '96.802.153.80', 3, NULL, 'OBTURATEUR', NULL, 'images/References/96_802_153_80.png'),
(15, '96.745.506.80', 3, NULL, 'VIS M8 X L30', NULL, 'images/References/96_745_506_80.png'),
(16, '98.098.400.80', 4, NULL, 'VIS M6 X L20', NULL, 'images/References/98_098_400_80.png'),
(17, '98.117.530.80', 4, NULL, 'VIS M8 X L24', NULL, 'images/References/98_117_530_80.png'),
(18, '96.478.684.80', 4, NULL, 'FILM ADHESIF', 1, 'images/References/96_478_684_80.png'),
(19, '96.370.064.80', 4, NULL, 'VIS M6 X L30', NULL, 'images/References/96_370_064_80.png'),
(20, '96.559.100.80', 4, NULL, 'ECROU A SERTIR', NULL, 'images/References/96_559_100_80.png'),
(21, '79.033.011.77', 4, NULL, 'VIS M8 X L20', NULL, 'images/References/79_033_011_77.png'),
(22, '98.273.999.80', 4, NULL, 'SERTIS M4 X L12', NULL, 'images/References/98_273_999_80.png'),
(23, '79.030.082.35', 4, NULL, 'VIS TORX', NULL, 'images/References/79_030_082_35.png'),
(25, '98.030.000.80', 4, NULL, 'ECROU A SERTIR', NULL, 'images/References/98_030_000_80.png');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `controles`
--
ALTER TABLE `controles`
  ADD CONSTRAINT `ctrl_poste_idfk` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`),
  ADD CONSTRAINT `ctrl_ref_idfk` FOREIGN KEY (`ref_id`) REFERENCES `references` (`id`);

--
-- Contraintes pour la table `references`
--
ALTER TABLE `references`
  ADD CONSTRAINT `poste_idfk` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
