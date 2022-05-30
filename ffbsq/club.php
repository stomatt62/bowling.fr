
<?php 
include('config.php');


  	$sql = "CALL getcategorie()";
    $stmt = $bdd->prepare($sql);
    $stmt->execute();
    if ($stmt->rowCount() < 1) {
        $categories= '';
    }
    if ($stmt->rowCount() > 0) {
        $categories= $stmt->fetchAll();
    }

?>
<!DOCTYPE html>
    <html lang="fr">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="author" content="NoS1gnal"/>

            <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <title>formulaire licence</title>
</head>
<body>
<form action="licence_traitement.php" method="post" enctype="multipart/form-data">
                <h2 class="text-center">Création de licence club</h2>       
                <div class="form-group">
                    <input type="text" name="nom" class="form-control" placeholder="nom" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" name="prenom" class="form-control" placeholder="prenom" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <select class="form-select" id="categorie" name="categorie">
                                                        <option disabled="disabled">----categorie----</option>
                                                        <?php foreach ($categories as $categorie) { ?>
                                                            <option><?= $categorie['libelle_categorie'] ?></option>
                                                        <?php } ?>
                                                    </select>
                </div>
                <div class="form-group">
                    <input type="text" name="sexe" class="form-control" placeholder="sexe" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                	<label> date de naissance </label>
                    <input type="date" name="DDN" class="form-control" placeholder="date de naissance" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="file" name="photo" class="form-control" placeholder="photo" required="required" autocomplete="off">
                </div>
                
                <div class="form-group">
                    <input type="text" name="position" class="form-control" placeholder="position" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" name="adr_licencie" class="form-control" placeholder="adresse" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" name="adr_ville_licencie" class="form-control" placeholder="ville" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" name="telephone" class="form-control" placeholder="téléphone" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" name="nationalite" class="form-control" placeholder="nationalité" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="text" name="classification" class="form-control" placeholder="classification" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                	<label> validité certificat médical  </label>
                    <input type="date" name="validite_CM" class="form-control" placeholder="validité Certificat Médical" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="int" name="annee_reprise" class="form-control" placeholder="année de reprise" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <input type="int" name="premiere_licence" class="form-control" placeholder="année premiere licence" required="required" autocomplete="off">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">Envoyer </button>
                </div>   
            </form>
</body>
</html>