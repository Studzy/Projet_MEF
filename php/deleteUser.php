<?php 
header('Content-Type: application/json; charset=utf-8');
require('bdd.php');

    $bdd = connectBase();
    $response = array();


    $userId = $_POST['userId'];

    try{
        //$req = $bdd->query("call ecrire_controle('$idPoste', '$idRef', '$dateHeure', '$idUser', '$res');");
        //$req = $bdd->exec("INSERT INTO 'controles' VALUES ('$dateHeure', '$idPoste', '$idRef', '$idUser', '$res');");

        $req = $bdd->prepare('DELETE FROM users WHERE `Id` = :userId');
        $req->execute(array(
	        'userId' => $userId,
	        ));
        
        $response['status'] = "ok";
        echo json_encode($response);
    } catch (Exception $e) {
        die('Erreur requete : ' . $e->getMessage());
    }
?>