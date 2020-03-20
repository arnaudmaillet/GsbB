<?php
require '../../class/class.database.inc.php';
$db = Database::getInstance();

// récupération des données
$date = $_POST["date"];
$libelle = $_POST["libelle"];
$montant = $_POST["montant"];
$etat = $_POST["etat"];



// requêtre d'ajout
$sql = <<<EOD
    insert into fraishorsforfait(date, libelle, montant, etat, idFicheFrais)
           values (:date, :libelle, :montant, :etat, 1);
EOD;
$curseur = $db->prepare($sql);
$curseur->bindParam('date', $date);
$curseur->bindParam('libelle', $libelle);
$curseur->bindParam('montant', $montant);
$curseur->bindParam('etat', $etat);

echo $curseur->execute() ? 1 : 0;