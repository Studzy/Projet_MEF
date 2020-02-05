<?php 
header('Content-Type: application/json; charset=utf-8');

require('bdd.php');

	$data = array();
	$bdd = connectBase();
	$idposte = $_GET['id'];

	$req = $bdd->query("SELECT `timestamp`, `user_name`, `poste`, `reference`, `resultat` FROM meffer.controles
						INNER JOIN `references` 
						ON `controles`.`ref_id` = `references`.`id`
						INNER JOIN `postes` 
						ON `controles`.`poste_id` = `postes`.`id` where `controles`.`poste_id` = '$idposte'
						ORDER BY `timestamp`
						DESC LIMIT 15");

	while($ligne = $req->fetch(PDO::FETCH_ASSOC)) 
	{
		$data[] = $ligne;
	}

	echo json_encode($data);

?>