<?php
require '../../class/class.database.inc.php';
$db = Database::getInstance();

$sql = <<<EOD
    SELECT id, dateCreation, nbNuitee, nbRepas, nbKm, tarifKm, tarifNuitee, tarifRepas, tarifEtape
    FROM affichagefichefrais
    WHERE idEtat = "C";
EOD;
$curseur = $db->query($sql);
$lesLignes = $curseur->fetchAll(PDO::FETCH_ASSOC);
$curseur->closeCursor();
echo json_encode($lesLignes);