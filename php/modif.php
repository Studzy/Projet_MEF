<?php 
header('Content-Type: application/json; charset=utf-8');
require('bdd.php');

    $bdd = connectBase();
    $response = array();
    //$reference = $_POST['reference'];
    //$poste = $_POST['poste'];
    $posteDest = $_POST['posteDest'];
    $idRef =$_POST['id'];

    try{
        //$req = $bdd->query("call ecrire_controle('$idPoste', '$idRef', '$dateHeure', '$idUser', '$res');");
        $req = $bdd->exec("UPDATE `references` SET poste_id = '$posteDest' WHERE id = '$idRef'");

        $response['status'] = "ok";
        echo json_encode($response);
    } catch (Exception $e) {
        die('Erreur requete : ' . $e->getMessage());
    }
?>