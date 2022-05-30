<?php 

    # NOM DU SERVEUR
    $sName = "localhost";
    # NOM D'UTILISATEUR
    $uName = "prof1234";
    # MOT DE PASSE
    $pass = "prof_1234!";
    # NOM DE LA BASE
    $db_name = "ffbsq";

    #CONNECTION A LA BASE DE DONNÉES
    try {
        $bdd = new PDO("mysql:host=$sName;dbname=$db_name", $uName, $pass);
        $bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    # ERREUR DE CONNECTION
    catch(PDOException $e){
        echo "Connection erreur : ". $e->getMessage();
    }
    /*DELIMITER$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addutilisateur` (IN `paramid` int, IN `paramPseudo` VARCHAR(100), IN `paramPass` text, IN `paramIp` VARCHAR(20), IN `paramEmail` VARCHAR(255), IN `paramtoken` text, IN `paramDate` datetime)  BEGIN
    INSERT INTO Proprietaire
            (id, pseudo, password, ip, Email, ip, token, date_inscription)
            VALUES (paramid,paramPseudo,paramPass,paramIp,paramEmail,paramtoken,paramDate)
END$$
*/