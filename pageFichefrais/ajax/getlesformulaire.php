
<?php

include "../../class/class.database.inc.php";
$db = Database::getInstance();
$sql = <<<EOD
    select dateCreation, idEtat, montant
    from FicheFrais
    where idEtat != 'C';;
EOD;
$curseur = $db->query($sql);
$lesLignes = $curseur->fetchAll(PDO::FETCH_ASSOC);
$curseur->closeCursor();
// envoi du résultat vers le client du résultat
echo json_encode($lesLignes);




