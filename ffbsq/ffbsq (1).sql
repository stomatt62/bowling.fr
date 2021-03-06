-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 30 Mai 2022 à 23:09
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ffbsq`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `addLicense` (IN `paramnom` VARCHAR(100), IN `paramprenom` VARCHAR(100), IN `paramsexe` VARCHAR(100), IN `paramdate` DATE, IN `paramphoto` VARCHAR(255), IN `paramcategorie` VARCHAR(100), IN `paramposition` VARCHAR(100), IN `paramadr_licencie` VARCHAR(100), IN `paramville` VARCHAR(100), IN `paramtel` VARCHAR(100), IN `parammail` VARCHAR(100), IN `paramnationalite` VARCHAR(100), IN `paramclassification` VARCHAR(100), IN `paramvalidite` DATE, IN `paramannee` INT, IN `parampremiere_licence` INT)  BEGIN
    INSERT INTO licencie
    (nomlicencie, prenomlicencie, sexelicencie, datedenaissance, 	photolicencie, categorielicencie, 	positionlicencie, adr_licencie, adr_ville_licencie, tel_licencie, mail_licencie, nationalite_licencie, classification_licence, validite_CM, annee_reprise, premiere_licence  )
    VALUES (paramnom, paramprenom, paramsexe, paramdate, paramphoto,  paramcategorie, paramposition, paramadr_licencie,  paramville, paramtel, parammail, paramnationalite, paramclassification, paramvalidite, paramannee, parampremiere_licence);
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `addutilisateurs` (IN `parampseudo` VARCHAR(100), IN `paramemail` VARCHAR(100), IN `parampass` TEXT, IN `paramip` VARCHAR(20), IN `paramtoken` TEXT)  BEGIN
    INSERT INTO utilisateurs
    (pseudo, email, password, ip, token)
    VALUES (parampseudo, paramemail, parampass, paramip, paramtoken);
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `getcategorie` ()  BEGIN
    SELECT * FROM categorie;
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `getlicence` ()  BEGIN
    SELECT * FROM licencie;
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `getLicenceById` (IN `mail` VARCHAR(255))  NO SQL
BEGIN
    SELECT * FROM licencie WHERE mail_licencie = mail;
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `getLicenceId` (IN `id` INT)  NO SQL
BEGIN
    SELECT * FROM licencie WHERE numlicencie = id;
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `updateLicence` (IN `paramnom` VARCHAR(100), IN `paramprenom` VARCHAR(100), IN `paramsexe` VARCHAR(100), IN `paramdate` DATE, IN `paramphoto` VARCHAR(255), IN `paramcategorie` VARCHAR(100), IN `paramposition` VARCHAR(100), IN `paramadr_licencie` VARCHAR(100), IN `paramville` VARCHAR(100), IN `paramtel` VARCHAR(100), IN `parammail` VARCHAR(100), IN `paramnationalite` VARCHAR(100), IN `paramclassification` VARCHAR(100), IN `paramvalidite` DATE, IN `paramannee` INT, IN `parampremiere_licence` INT)  BEGIN
UPDATE licencie
SET nomlicencie = paramnom, prenomlicencie = paramprenom, sexelicencie = paramsexe, datedenaissance = paramdate, photolicencie = paramphoto, categorielicencie = paramcategorie, positionlicencie = paramposition, 	adr_licencie = paramadr_licencie , adr_ville_licencie = paramville,  tel_licencie = paramtel, mail_licencie = parammail, nationalite_licencie = paramnationalite, classification_licence	= paramclassification , validite_CM = paramvalidite, annee_reprise= paramannee, premiere_licence = parampremiere_licence
WHERE nomlicencie = paramnom AND mail_licencie = parammail;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `appmobileedu`
--

CREATE TABLE `appmobileedu` (
  `idJeunes` int(11) NOT NULL,
  `ponctualite` int(11) NOT NULL,
  `respectCoachrespectAdversaire` int(11) NOT NULL,
  `fairplay` int(11) NOT NULL,
  `motivation` int(11) NOT NULL,
  `concentration` int(11) NOT NULL,
  `geste` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `effetBoule` varchar(255) NOT NULL,
  `resultatBoule` varchar(255) NOT NULL,
  `vitessedejeu` varchar(255) NOT NULL,
  `moyenne` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `libelle_categorie` varchar(100) NOT NULL,
  `age_min` int(11) NOT NULL,
  `age_max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `libelle_categorie`, `age_min`, `age_max`) VALUES
(1, 'senior', 40, 99),
(2, 'adulte', 18, 39),
(3, 'ados', 12, 17),
(4, 'enfants', 5, 11);

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE `club` (
  `numeroaffiliation` int(11) NOT NULL,
  `desingationclub` varchar(100) NOT NULL,
  `adresse_siege` varchar(100) NOT NULL,
  `adr_cp_siege` int(11) NOT NULL,
  `adr_ville_siege` varchar(100) NOT NULL,
  `annee_affiliation` int(11) NOT NULL,
  `tel_siege` varchar(100) NOT NULL,
  `mail_siege` varchar(100) NOT NULL,
  `adresse_courrier` varchar(100) NOT NULL,
  `adr_cp_courrier` int(11) NOT NULL,
  `adr_ville_courrier` varchar(100) NOT NULL,
  `numero_prefecture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `concours`
--

CREATE TABLE `concours` (
  `idConcours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--

CREATE TABLE `equipes` (
  `idEquipe` int(11) NOT NULL,
  `nom_equipe` varchar(255) NOT NULL,
  `logo_equipe` varchar(255) NOT NULL,
  `Club` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `idInscript` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `Prenom` int(255) NOT NULL,
  `Club` int(11) NOT NULL,
  `Licence` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `licencie`
--

CREATE TABLE `licencie` (
  `numlicencie` int(11) NOT NULL,
  `nomlicencie` varchar(100) NOT NULL,
  `prenomlicencie` varchar(100) NOT NULL,
  `sexelicencie` varchar(100) NOT NULL,
  `datedenaissance` date NOT NULL,
  `photolicencie` varchar(255) NOT NULL,
  `categorielicencie` varchar(100) NOT NULL,
  `positionlicencie` varchar(100) NOT NULL,
  `adr_licencie` varchar(100) NOT NULL,
  `adr_ville_licencie` varchar(100) NOT NULL,
  `tel_licencie` varchar(100) NOT NULL,
  `mail_licencie` varchar(100) NOT NULL,
  `nationalite_licencie` varchar(100) NOT NULL,
  `classification_licence` varchar(100) NOT NULL,
  `validite_CM` date NOT NULL,
  `annee_reprise` int(11) NOT NULL,
  `premiere_licence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(3, 'Kylian', 'kylian.prouvost@gmail.com', '9a4e81d09040ed9f5878b7ca2a173d26d2e7422a224f15bfed7ef841cb02f32c'),
(4, 'prof', 'kylian.prouvost@gmail.com', 'ddd9403b68cc1687c1e9c412bc96415de4172455d172d0a9951fe24e528d06b5');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `ip` varchar(20) NOT NULL,
  `token` text NOT NULL,
  `date_inscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appmobileedu`
--
ALTER TABLE `appmobileedu`
  ADD PRIMARY KEY (`idJeunes`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`numeroaffiliation`);

--
-- Index pour la table `concours`
--
ALTER TABLE `concours`
  ADD PRIMARY KEY (`idConcours`);

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`idEquipe`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`idInscript`);

--
-- Index pour la table `licencie`
--
ALTER TABLE `licencie`
  ADD PRIMARY KEY (`numlicencie`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `club`
--
ALTER TABLE `club`
  MODIFY `numeroaffiliation` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `concours`
--
ALTER TABLE `concours`
  MODIFY `idConcours` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `idEquipe` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `idInscript` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `licencie`
--
ALTER TABLE `licencie`
  MODIFY `numlicencie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appmobileedu`
--
ALTER TABLE `appmobileedu`
  ADD CONSTRAINT `appmobileedu_ibfk_1` FOREIGN KEY (`idJeunes`) REFERENCES `equipes` (`idEquipe`);

--
-- Contraintes pour la table `concours`
--
ALTER TABLE `concours`
  ADD CONSTRAINT `concours_ibfk_1` FOREIGN KEY (`idConcours`) REFERENCES `inscription` (`idInscript`);

--
-- Contraintes pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD CONSTRAINT `equipes_ibfk_1` FOREIGN KEY (`idEquipe`) REFERENCES `concours` (`idConcours`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
