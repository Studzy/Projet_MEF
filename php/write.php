<?php 
header('Content-Type: application/json; charset=utf-8');
date_default_timezone_set('Europe/Paris');
require('bdd.php');

    $bdd = connectBase();
    $response = array();

    $dateHeure = date("Y-m-d").' '.date("H:i:s");

    $idUser = $_POST['userid'];
    $idPoste = $_POST['poste'];
    $idRef = $_POST['ref'];
    $res = $_POST['res'];
    $resQualite = $_POST['resQualite'];
    $resReference = $_POST['resReference'];
    $resDate = $_POST['resDate'];
    $userName = $_POST['userName'];

    try{
        //$req = $bdd->query("call ecrire_controle('$idPoste', '$idRef', '$dateHeure', '$idUser', '$res');");
        //$req = $bdd->exec("INSERT INTO 'controles' VALUES ('$dateHeure', '$idPoste', '$idRef', '$idUser', '$res');");

        $req = $bdd->prepare('INSERT INTO controles(timestamp, poste_id, ref_id, user_id, resultat, resultat_qualite, resultat_reference, resultat_date, user_name) VALUES(:dateHeure, :idPoste, :idRef, :idUser, :res, :resQualite, :resReference, :resDate, :userName)');
        $req->execute(array(
	        'dateHeure' => $dateHeure,
	        'idPoste' => $idPoste,
	        'idRef' => $idRef,
	        'idUser' => $idUser,
            'res' => $res,
            'resQualite' => $resQualite,
            'resReference' => $resReference,
            'resDate' => $resDate,
            'userName' => $userName,
	        ));

        $response['status'] = "ok";
        echo json_encode($response);
    } catch (Exception $e) {
        die('Erreur requete : ' . $e->getMessage());
    }
?>