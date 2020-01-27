<?php
header('Content-Type: application/json; charset=utf-8');

require('bdd.php');

	$data = array();
	$bdd = connectBase();

// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table jeux_video
$reponse = $bdd->query('SELECT * FROM postes');

// On affiche chaque entrée une à une
while ($donnees = $reponse->fetch())
{
?>
    <p>
    <strong>Postes</strong> : <?php echo $donnees['poste']; ?><br />
   </p>
<?php
}

$reponse->closeCursor(); // Termine le traitement de la requête

?>