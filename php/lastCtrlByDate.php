<?php 
header('Content-Type: application/json; charset=utf-8');

require('bdd.php');

	$data = array();
	$bdd = connectBase();
    $idposte = $_GET['id'];
	$pds_date_tempo = $_GET['pds_date'];
	$pds_date = $pds_date_tempo . "%";

	$req = $bdd->query("SELECT `timestamp`, `user_name`, `poste`, `reference`, `resultat` FROM meffer.controles
						INNER JOIN `references` 
						ON `controles`.`ref_id` = `references`.`id`
						INNER JOIN `postes` 
						ON `controles`.`poste_id` = `postes`.`id` 
                        where `controles`.`poste_id` = '$idposte' AND 
						`timestamp` LIKE '$pds_date'
						ORDER BY `timestamp`");

	while($ligne = $req->fetch(PDO::FETCH_ASSOC)) 
	{
		$data[] = $ligne;
	}

	echo json_encode($data);

	

?>