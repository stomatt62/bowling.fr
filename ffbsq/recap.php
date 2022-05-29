<?php 
    session_start();
    require_once 'config.php'; // ajout connexion bdd 
   // si la session existe pas soit si l'on est pas connecté on redirige
    if(!isset($_SESSION['user'])){
        header('Location:index.php');
        die();
    }

    // On récupere les données de l'utilisateur
    $req = $bdd->prepare('SELECT * FROM utilisateurs WHERE token = ?');
    $req->execute(array($_SESSION['user']));
    $data = $req->fetch();
   
    $sql = "CALL getcategorie()";
    $stmt = $bdd->prepare($sql);
    $stmt->execute();
    if ($stmt->rowCount() < 1) {
        $categories= '';
    }
    if ($stmt->rowCount() > 0) {
        $categories= $stmt->fetchAll();
    }

    $sql = "CALL getlicence()";
    $stmt = $bdd->prepare($sql);
    $stmt->execute();

?>
<!doctype html>
<html lang="en">
  <head>
    <title>Espace licence</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
        <div class="container">
            <div class="col-md-12">
                <?php 
                        if(isset($_GET['err'])){
                            $err = htmlspecialchars($_GET['err']);
                            switch($err){
                                case 'current_password':
                                    echo "<div class='alert alert-danger'>Le mot de passe actuel est incorrect</div>";
                                break;

                                case 'success_password':
                                    echo "<div class='alert alert-success'>Le mot de passe a bien été modifié ! </div>";
                                break; 
                            }
                        }
                    ?>

                <div class="text-center">
                        <h1 class="p-5">Bonjour voici votre récapitulatif de licence vérifier les informations et modifier si cela ne vous semble pas correct <?php echo $data['pseudo']; ?> !</h1>
                        <hr />
                        <a href="deconnexion.php" class="btn btn-danger btn-lg">Déconnexion</a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#change_licence">
                          modifier licence
                        </button>
                </div>
            </div>
        </div>
        <img src="img/ffbsq.jpg" alt="image 1">
        </div>
        
        <!-- Modal -->
        <div class="modal fade" id="change_licence" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">modifier ma licence</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                         </div>
                            <div class="modal-body">
<form action="recap.php" method="post" enctype="multipart/form-data">
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
  
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>