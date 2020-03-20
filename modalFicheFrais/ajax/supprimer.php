<?php
require '../../class/class.database.inc.php';
$db = Database::getInstance();

// récupération des données
$id = $_POST["id"];


// requêtre d'ajout
$sql = <<<EOD
   DELETE FROM fraishorforfait
   WHERE id = :id;
EOD;
$curseur = $db->prepare($sql);
$curseur->bindParam('id', $id);
echo $curseur->execute();