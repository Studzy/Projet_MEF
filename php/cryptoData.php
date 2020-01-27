<?php
$key = sodium_crypto_generichash_keygen();
// Construire un message que l'on va signer
$msg = "lat=XXXX;long=YYYY";

// Générer la signature
$signature = sodium_crypto_generichash($msg, $key);
$signatureAsTxt = bin2hex($signature);
dump(['signature' => $signature, 'signatureAsTxt' => $signatureAsTxt]);

?>