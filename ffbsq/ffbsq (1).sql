-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 26 Mai 2022 à 20:56
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
    (nomlicencie, prenomlicencie, sexelicencie, datedenaissance, 	photolicencie, categorielicencie, 	posisitonlicencie, adr_licencie, adr_ville_licencie, tel_licencie, mail_licencie, nationalite_licencie, classification_licence, validite_CM, annee_reprise, premiere_licence  )
    VALUES (paramnom, paramprenom, paramsexe, paramdate, paramphoto,  paramcategorie, paramposition, paramadr_licencie,  paramville, paramtel, parammail, paramnationalite, paramclassification, paramvalidite, paramannee, parampremiere_licence);
END$$

CREATE DEFINER=`prof1234`@`localhost` PROCEDURE `getcategorie` ()  BEGIN
    SELECT * FROM categorie;
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
  `posisitonlicencie` varchar(100) NOT NULL,
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

--
-- Contenu de la table `licencie`
--

INSERT INTO `licencie` (`numlicencie`, `nomlicencie`, `prenomlicencie`, `sexelicencie`, `datedenaissance`, `photolicencie`, `categorielicencie`, `posisitonlicencie`, `adr_licencie`, `adr_ville_licencie`, `tel_licencie`, `mail_licencie`, `nationalite_licencie`, `classification_licence`, `validite_CM`, `annee_reprise`, `premiere_licence`) VALUES
(2, 'h', 'h', 'h', '2022-05-13', 'assets/uploads/licencie/h_licencie.jpg', 'senior', 'h', 'h', 'h', 'h', 'test@gmail.com', 'h', 'h', '2022-05-18', 2, 2);

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
-- Contenu de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `pseudo`, `email`, `password`, `ip`, `token`, `date_inscription`) VALUES
(1, 'matt', 'test@gmail.com', '$2y$12$ZBrH2OuMYE4c1nNK0HV3YO0KIDT1Y53pRUNdQxCluDpgKV/esELr2', '::1', '5cc62f711af0274f85e7dce4f468c364c2025991adce536c98cfb642b3cd933b7333d5d637a0406acb4bb7a066209ac67b02be525aca654e2540a3433e29d4b9', '2022-05-16 22:20:05');

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
  MODIFY `numlicencie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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

--
-- Contraintes pour la table `licencie`
--
ALTER TABLE `licencie`
  ADD CONSTRAINT `categorielicencie` FOREIGN KEY (`numlicencie`) REFERENCES `categorie` (`id_categorie`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
