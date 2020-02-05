<?php

$hostname = "MySql";
$port="3306";
$dbname = "meffer";
//$user = "meffer_admin";
//$pass = "QmViZXIgaWwgZW5jdWxlIHNvbiBjaGllbiB0b3V0IGxlcyBzb2lycyBlbiBidXZhbnQgZGVzIGhlY3RvbGl0cmVzIGRlIHBhc3RpcyB0cm9wIGRpbHXDqSBkZXZhbnQgc2EgY2hlbWluw6llIHBlbmRhbnQgbGVzIGbDqnRlcyBkZSBub2VsLg==";
$user = "root";
$pass = "";

function connectBase() {
	global $hostname, $port, $dbname, $user, $pass;

	try {
		$bdd = new PDO("mysql:host=localhost;port=".$port.";dbname=".$dbname, $user, $pass);
		$bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$bdd->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

	} catch (Exception $e) {
		die('Echec connexion à la base : ' . $e->getMessage());
	}
	
	return $bdd;
}

?>