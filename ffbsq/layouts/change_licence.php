<?php   
    // Démarrage de la session 
    session_start();
    // Include de la base de données
    require_once '../config.php';


    // Si la session n'existe pas 
    if(!isset($_SESSION['user']))
    {
        header('Location:../index.php');
        die();
    }


    // Si les variables existent 
    if(!empty($_POST['current_password']) && !empty($_POST['new_password']) && !empty($_POST['new_password_retype'])){
        // XSS 
        $current_password = htmlspecialchars($_POST['current_password']);
        $new_password = htmlspecialchars($_POST['new_password']);
        $new_password_retype = htmlspecialchars($_POST['new_password_retype']);

        // On récupère les infos de l'utilisateur
                        $sql = "CALL getlicence()";
                            $stmt = $bdd->prepare($sql);
                            $stmt->execute();
                    
        $check_licence  = $bdd->prepare('SELECT password FROM utilisateurs WHERE token = :token');
        $check_licence->execute(array(
            "token" => $_SESSION['user']
        ));
        $data_password = $check_password->fetch();

                // On met à jour la table utiisateurs
                $update = $bdd->prepare('UPDATE utilisateurs SET password = :password WHERE token = :token');
                $update->execute(array(
                    "password" => $new_password,
                    "token" => $_SESSION['user']
                ));
                // On redirige
                header('Location: ../landing.php?err=success_password');
                die();
            
        
        else{
            header('Location: ../landing.php?err=current_password');
            die();
        }

    }
    else{
        header('Location: ../landing.php');
        die();
    }
?>


