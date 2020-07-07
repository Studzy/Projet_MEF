<?php 
header('Content-Type: application/json; charset=utf-8');
date_default_timezone_set('Europe/Paris');

 require('bdd.php');

    $data = array();
    $result = array();
 	$bdd = connectBase();
    //$idposte = $_GET['id'];
    $dateHeure = date("Y-m-d").' '.date('H:i:s');
    $dateHeure = date("Y-m-d").' '.date('H:i:s', strtotime($dateHeure." - 1 hour")); //Date actuel avec -3 heure

     //$req = $bdd->query("select `id`, `reference`, `adresse_photo`, `date_reference`  from `references` where `poste_id` = '$idposte' ORDER BY ordre_priorite");
     $req = $bdd->query("SELECT MAX(timestamp) AS Date, postes.poste FROM `controles` INNER JOIN postes ON controles.poste_id = postes.id GROUP BY poste_id;");
    // SELECT MAX(timestamp), postes.poste FROM `controles` INNER JOIN postes ON controles.poste_id = postes.id WHERE timestamp < '$dateHeure' GROUP BY poste_id;
    //  SELECT controles.id, controles.poste_id, MAX(timestamp), postes.poste FROM `controles` 
    //     INNER JOIN postes
    //     ON controles.poste_id = postes.id
    //     WHERE timestamp < '26-02-26 06:32:00' 
    //     GROUP BY poste_id
 	while($ligne = $req->fetch(PDO::FETCH_ASSOC)) 
 	{
      //echo $ligne;
 		$data[] = $ligne;
   }
    $dataLength = count($data);
     for ($i = 0; $i < $dataLength; $i++) {
         if($data[$i]['Date'] > $dateHeure)
         {
            unset($data[$i]);
         }
        
    }
   echo json_encode($data);

 ?>