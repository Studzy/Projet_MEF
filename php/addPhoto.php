<?php
require('bdd.php');
header('Content-Type: application/json; charset=utf-8');

$bdd = connectBase();
    $response = array();
//$db = mysqli_connect("localhost","root","","meffer"); //keep your db name
$image = addslashes(file_get_contents($_FILES['photo']['tmp_name']));
//you keep your column name setting for insertion. I keep image type Blob.
//$query = "UPDATE references SET photo = '$image' WHERE id='9'";  
//$qry = mysqli_query($db, $query);
try{
    //$req = $bdd->query("call ecrire_controle('$idPoste', '$idRef', '$dateHeure', '$idUser', '$res');");
    $req = $bdd->query("UPDATE references SET photo = '$image' WHERE id='9';");

    /*$req = $bdd->prepare('INSERT INTO controles(timestamp, poste_id, ref_id, user_id, resultat, resultat_qualite, resultat_reference, resultat_date, user_name) VALUES(:dateHeure, :idPoste, :idRef, :idUser, :res, :resQualite, :resReference, :resDate, :userName)');
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
        ));*/

    $response['status'] = "ok";
    echo json_encode($response);
} catch (Exception $e) {
    die('Erreur requete : ' . $e->getMessage());
}
?>