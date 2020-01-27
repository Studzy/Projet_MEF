<?php 
header('Content-Type: application/json; charset=utf-8');

require('bdd.php');

	$data = array();
	$bdd = connectBase();
	$idposte = $_GET['id'];

	$req = $bdd->query("select `id`, `reference`, `adresse_photo`, `date_reference`  from `references` where `poste_id` = '$idposte'");
	/*$req = $bdd->query("select `references`.`id`, `references`.`reference`, `references`.`adresse_photo`  from `controles`
								INNER JOIN `references` 
								ON `controles`.`ref_id` = `references`.`id` 
								INNER JOIN `postes` 
								ON `controles`.`poste_id` = `postes`.`id`
								where `poste_id` = '$idposte'");*/

	while($ligne = $req->fetch(PDO::FETCH_ASSOC)) 
	{
		$data[] = $ligne;
	}

	echo json_encode($data);

?>