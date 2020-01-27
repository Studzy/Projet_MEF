<?php 
header('Content-Type: application/json; charset=utf-8');

require('bdd.php');

	$data = array();
	$bdd = connectBase();

	$req = $bdd->query("SELECT * from postes");

	while($ligne = $req->fetch(PDO::FETCH_ASSOC)) 
	{
		$data[] = $ligne;
	}

	return json_encode($data);

?>