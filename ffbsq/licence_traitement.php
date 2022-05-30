<?php
include ('config.php');

$nomlicencie= $_POST['nom'];
$prenomlicencie= $_POST['prenom'];
$sexelicencie= $_POST['sexe'];
$categorielicencie=$_POST['categorie'];
$datedenaissance= $_POST['DDN'];
$positionlicencie= $_POST['position'];
$adr_licencie= $_POST['adr_licencie'];
$adr_ville_licencie= $_POST['adr_ville_licencie'];
$tel_licencie= $_POST['telephone'];
$mail_licencie= $_POST['email'];
$nationalite_licencie= $_POST['nationalite'];
$classification_licencie= $_POST['classification'];
$validite_CM= $_POST['validite_CM'];
$annee_reprise= $_POST['annee_reprise'];
$premiere_licence= $_POST['premiere_licence'];

# TELECHARGEMENT DE LA PHOTO DE PROFIL
        if (isset($_FILES['photo'])) {
            # RECUPERER LES INFORMATIONS
            $img_name  = $_FILES['photo']['name'];
            $tmp_name  = $_FILES['photo']['tmp_name'];
            $error  = $_FILES['photo']['error'];

            # SI IL N'Y A PAS D'ERREUR DE TELECHARGEMENT
            if($error === 0){

                # OBTENIR L'EXTENSION DU FICHIER
                $img_ex = pathinfo($img_name, PATHINFO_EXTENSION);

                # CONVETIR L'EXTENSION EN MINUSCULE
                $img_ex_lc = strtolower($img_ex);

                # VERIFIER LES L'EXTENTION ACCEPTER
                $allowed_exs = array("jpg", "jpeg", "png");

                #SI L'EXTENTTION EST VALIDE
                if (in_array($img_ex_lc, $allowed_exs)) {
                    # CRÉE LE NOUVEAUX NOM DE L'IMAGE AVEC LE NOM D'UTILSATEUR
                    $new_img_name = $nomlicencie. '_licencie.'.$img_ex_lc;

                    # CHEMIN DE TELECHARGEMENT
                    $img_upload_path = 'assets/uploads/licencie/'.$new_img_name;

                    $img_bdd = 'assets/uploads/licencie/'.$new_img_name;
                    # DEPLACER L'IMAGE VERS LE DOSSIER
                    move_uploaded_file($tmp_name, $img_upload_path);
                }else {
                    # MESSAGE ERREUR + REDIRECTION
                    $em = "Vous ne pouvez pas importer ce type de fichier";
                    header("Location: club?error=$em");
                    exit;
                }
        }    }

$sql = "CALL addLicense(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $bdd->prepare($sql);
        $stmt->execute([$nomlicencie, $prenomlicencie, $sexelicencie, $datedenaissance, $img_bdd, $categorielicencie, $positionlicencie, $adr_licencie, $adr_ville_licencie, $tel_licencie, $mail_licencie, $nationalite_licencie, $classification_licencie, $validite_CM, $annee_reprise, $premiere_licence]);
        $stmt->closeCursor();

 $sql = "CALL getLicenceById(?)";
    $stmt = $bdd->prepare($sql);
    $stmt->execute([$mail_licencie]);
    if ($stmt->rowCount() < 1) {
        $licence= '';
    }
    if ($stmt->rowCount() == 1) {
        $licence= $stmt->fetch();
    }

    $id = $licence['numlicencie'];
    # MESSAGE DE REUSSITE + REDIRECTION
        $sm = "Nouveau Licencier Cree";
        header("Location: recap.php?id=$id");
        exit;
?>