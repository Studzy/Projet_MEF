-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 03 fév. 2020 à 08:09
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
  `user_id` int(11) DEFAULT NULL,
  `resultat` tinyint(1) NOT NULL,
  `resultat_qualite` varchar(3) NOT NULL,
  `resultat_reference` varchar(3) NOT NULL,
  `resultat_date` varchar(3) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `poste_idfk_idx` (`poste_id`),
  KEY `ref_idfk_idx` (`ref_id`),
  KEY `usr_idfk_idfk` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `controleurs`
--

DROP TABLE IF EXISTS `controleurs`;
CREATE TABLE IF NOT EXISTS `controleurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `photo` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `date_reference` date DEFAULT NULL,
  `adresse_photo` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `poste_idfk_idx` (`poste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `t_listemagytest`
--

DROP TABLE IF EXISTS `t_listemagytest`;
CREATE TABLE IF NOT EXISTS `t_listemagytest` (
  `CodePersonnel` varchar(255) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `NomNaissance` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Rue` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `DateEmbauche` date DEFAULT NULL,
  `Poste` varchar(255) DEFAULT NULL,
  `PosteAtelier` varchar(255) DEFAULT NULL,
  `AgentRelation` varchar(255) DEFAULT NULL,
  `CategorieProfessionnel` varchar(255) DEFAULT NULL,
  `Coefficient` varchar(255) DEFAULT NULL,
  `Classification` tinytext,
  `NumeroSecuriteSocial` varchar(255) DEFAULT NULL,
  `TypeContrat` tinytext,
  `NatureContrat` tinytext,
  `LieuNaissance` varchar(255) DEFAULT NULL,
  `Nationalite` tinytext,
  `NomConjoint` varchar(255) DEFAULT NULL,
  `PrenomConjoint` varchar(255) DEFAULT NULL,
  `DateNaissanceConjoint` date DEFAULT NULL,
  `ConjointSalarieCPM` tinyint(1) DEFAULT '0',
  `CodePersonnelConjoint` varchar(255) DEFAULT NULL,
  `DateUnionConjoint` date DEFAULT NULL,
  `DateDecesConjoint` date DEFAULT NULL,
  `TypeHoraire` tinytext,
  `Affectation` varchar(255) DEFAULT NULL,
  `SituationMatrimoniale` varchar(255) DEFAULT NULL,
  `DateSituationMatrimoniale` date DEFAULT NULL,
  `NonMagy` tinyint(1) DEFAULT '0',
  `ClientPresent` tinyint(1) DEFAULT '0',
  `Invalidite` tinyint(1) DEFAULT '0',
  `Deces` tinyint(1) DEFAULT '0',
  `LongueMaladie` tinyint(1) DEFAULT '0',
  `DateRadiation` date DEFAULT NULL,
  `MotifRadiation` tinytext,
  `DebutDerniereMutuelle` date DEFAULT NULL,
  `FinDerniereMutuelle` date DEFAULT NULL,
  `CodeOptionMutuelle` varchar(255) DEFAULT NULL,
  `Changement` tinyint(1) DEFAULT '0',
  `Archiver` tinyint(1) DEFAULT '0',
  `dateEquivalence` date DEFAULT NULL,
  `toubib` tinytext,
  `UO` varchar(255) DEFAULT NULL,
  `SPU` varchar(255) DEFAULT NULL,
  `SPU_R` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodePersonnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `controles`
--
ALTER TABLE `controles`
  ADD CONSTRAINT `ctrl_poste_idfk` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`),
  ADD CONSTRAINT `ctrl_ref_idfk` FOREIGN KEY (`ref_id`) REFERENCES `references` (`id`),
  ADD CONSTRAINT `ctrl_usr_idfk` FOREIGN KEY (`user_id`) REFERENCES `controleurs` (`id`);

--
-- Contraintes pour la table `references`
--
ALTER TABLE `references`
  ADD CONSTRAINT `poste_idfk` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
