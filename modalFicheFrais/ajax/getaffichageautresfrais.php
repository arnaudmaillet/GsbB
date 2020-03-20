<?php
require '../../class/class.database.inc.php';
$db = Database::getInstance();

$sql = <<<EOD
    select fraishorsforfait.id, date, libelle, fraishorsforfait.montant, etat
    from fraishorsforfait, fichefrais
    where fichefrais.id = fraishorsforfait.idfichefrais
    and idEtat = "C";
EOD;
$curseur = $db->query($sql);
$lesLignes = $curseur->fetchAll(PDO::FETCH_ASSOC);
$curseur->closeCursor();
echo json_encode($lesLignes);