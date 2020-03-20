<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Tableau des frais</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="../composant/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../composant/confirm/jquery-confirm.min.css">
    <link rel="stylesheet" href="../css/webfonts/all.min.css">
    <link rel="stylesheet" href="../composant/tablesorter/theme.bootstrap_4.min.css">
    <link rel="stylesheet" href="../composant/tablesorter/theme.dropbox.min.css">
    <link rel="stylesheet" href="../composant/tablesorter/theme.metro-dark.css">
    <link rel="stylesheet" href="../composant/zebra/zebra_datepicker.min.css">
    <link rel="stylesheet" href="../composant/noty/animate.css">
    <link rel="stylesheet" href="../composant/noty/noty.css">
    <link rel="stylesheet" href="../composant/noty/sunset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="../modalFicheFrais/css/style.css">


    <script src="../composant/jquery.js"></script>
    <script src="../composant/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="../composant/confirm/jquery-confirm.min.js"></script>
 
    <script src="js/index.js"></script>
    <script src="../composant/noty/noty.min.js"></script>
    <script src="../modalFicheFrais/js/index.js"></script>
    <script src="../composant/addrow/addrow.js"></script>
    <script src="../composant/personnel/class.std.js"></script>
</head>

<body>
<div id="menu"></div>

<div class="container" style="padding-left:20px; min-width: 500px; margin-top: 50px">
    <div class="card" style="width: 18rem">
        <div class="card-header text-center">
            <h5>Fiche en cours</h5>
        </div>
        <div class="card-body">
            <div id="dateFicheEnCours"></div>
            <div id="montantFicheEnCours"></div>
        </div>
        <div class="card-footer">
            <div class="container-fluid text-center">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target=".modalFicheFrais">Voir la fiche de frais</button>
            </div>
            <?php
            require "../modalFicheFrais/modalFicheFrais.html";
            ?>
        </div>
    </div>
</div>


<div class="container" style="padding-left:20px; min-width: 500px; margin-top: 50px">
    <h1>Tableau des fiches</h1>
    <div class='table-responsive'>
        <table id='leTableau' class='table table-sm table-bordered tablesorter table-active'>
            <thead class="thead-light">
            <tr>
                <th style='width:100px' class="text-center">Date de Création</th>
                <th style='width:100px' class="text-center">Montant</th>
                <th style='width:80px' class="text-center">Etat</th>
            </tr>
            </thead>
            <tbody id="tableFiches"></tbody>
        </table>
    </div>
</div>

<div id="pied"></div>

</body>
</html>

