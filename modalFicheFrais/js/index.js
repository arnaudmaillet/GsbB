// Afficher les données dans un conteneur <table>

$(function () {
    $.getJSON("../modalFicheFrais/ajax/getaffichagefichefrais.php", afficherfrais).fail(erreurAjax);
    $.getJSON("../modalFicheFrais/ajax/getaffichageautresfrais.php", afficherautresfrais).fail(erreurAjax);
    $('#btnAjouter').click(ajouter);

    // le bouton 'btnSupprimer' doit lancer la fonction confirmerSuppression
    //$('#btnSupprimer').click(confirmerSuppression);
    document.getElementById('btnSupprimer').onclick = confirmerSuppression;

    /*$('#dateAutreFrais').Zebra_DatePicker({
        direction : [dateMin.getDateFr(), dateMax.getDateFr()],
        start_date : dateAffichee.getDateFr(),
        view: 'years',
        readonly_element : true,
        show_clear_date : false,
        show_select_today : false,
        format : 'd/m/Y',
        offset : [0, 170],
        select_other_months : true,
        show_week_number : false,
        months : ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
        days :['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi']
    });*/

});



// ---------------------------------------------------
// Traitement de l'ajout
// ---------------------------------------------------

function ajouter(){
    let inputdate = document.getElementById('date');
    let inputlibelle= document.getElementById('libelle');
    let inputmontant = document.getElementById('montant');
    let inputetat = document.getElementById('etat');

    $.ajax({
        url : "../modalFicheFrais/ajax/ajouter.php",
        type : 'post',
        data : {
            date : inputdate.value,
            libelle : inputlibelle.value,
            montant : inputmontant.value,
            etat : inputetat.value,
        },
        dataType : "json",
        success : function (data) {
            if (data >= 1){
                Std.afficherMessage('msg','Frais ajouté','alert alert-success',3);
            }
            else {
                Std.afficherMessage('msg','Frais non ajouté','alert alert-danger',3);
            }
        },
        error: function (request) {
            $.dialog({title: '', content: request.responseText, type: 'red'});
        },
    });
}


// ---------------------------------------------------
// Traitement de la suppression
// ---------------------------------------------------

function confirmerSuppression() {
    let n = new Noty({
        text: 'Confirmer la suppression du frais ',
        layout: 'center',
        theme: 'sunset',
        modal: true,
        type: 'info',
        animation: {
            open: 'animated lightSpeedIn',
            close: 'animated lightSpeedOut'
        },
        buttons: [
            Noty.button('Oui', 'btn btn-sm btn-success marge ', function () {
                supprimer();
                n.close();
            }),
            Noty.button('Non', 'btn btn-sm btn-danger', function () {
                n.close();
            })
        ]
    }).show();
}

function supprimer() {
    $.ajax({
        url: '../modalFicheFrais/ajax/supprimer.php',
        type: 'POST',
        data: {id : inputId.value},
        dataType: "json",
        error: function (request) {
            $.dialog({title: '', content: request.responseText, type: 'red'});
        },
        success: function (data) {
            afficherMessage("Le frais a été supprimé", 'info');
        }
    })
}

function afficherMessage(message, type) {
    new Noty({
        text: message,
        type: type,
        modal: true,
        layout: 'center',
        theme: 'sunset',
        animation: {
            open: 'animated lightSpeedI',
            close: 'animated lightSpeedOut'
        },
    }).show().setTimeout(500);
}
// ---------------------------------------------------
// Traitement de l'affichage
// ---------------------------------------------------


function afficherfrais(data) {

    for (const affichagefichefrais of data) {

        let containerfluid = $('<div>', {class: 'container-fluid'});

        let row = $('<div>', {class: 'row', style: 'padding: 20px'});
        let date = $('<div>', {class: 'col-12 col-md-10'});
        date.html('<p>Date de création : ' + affichagefichefrais.dateCreation + '</p>');
        row.append(date);
        let numeroFiche = $('<div>', {class: 'col-12 col-md-2'});
        numeroFiche.html('<p>Fiche numéro ' + affichagefichefrais.id + '</p>');
        row.append(numeroFiche);
        containerfluid.append(row);

        row = $('<div>', {class: 'row', style: 'padding: 20px'});
        let col12 = $('<div>', {class: 'col-12'});
        let titretableau = $('<p>').text('Tableau des frais forfaitaires :');
        col12.append(titretableau);

        let tableau = $('<table>', {class: 'table table-bordered'});

        let titrecolonnes = $('<thead>', {class: 'thead-light'});
        let tr = $('<tr>', {class: 'text-center'});
        let th = $('<th>', {scope: 'col'});
        tr.append(th);
        th = $('<th>', {scope: 'col'}).text('Montant unitaire');
        tr.append(th);
        th = $('<th>', {scope: 'col'}).text('Quantité');
        tr.append(th);
        th = $('<th>', {scope: 'col'}).text('Total');
        tr.append(th);
        titrecolonnes.append(tr);
        tableau.append(titrecolonnes);

        let tableauBody = $('<tbody>');

        tr = $('<tr>', {class: 'text-center'});
        th = $('<th>', {scope: 'row'}).text('Nuité(s)');
        tr.append(th);
        let td = $('<td>').text(affichagefichefrais.tarifNuitee);
        tr.append(td);
        td = $('<td>');
        let input = $('<input>',{class:'text-center form-control', type:'text', id:'nbNuitee', name:'nbNuitee', value: affichagefichefrais.nbNuitee});
        td.append(input);
        tr.append(td);
        td = $('<td>').text(affichagefichefrais.nbNuitee * affichagefichefrais.tarifNuitee);
        tr.append(td);
        tableauBody.append(tr);

        tr = $('<tr>', {class: 'text-center'});
        th = $('<th>', {scope: 'row'}).text('Repas');
        tr.append(th);
        td = $('<td>').text(affichagefichefrais.tarifRepas);
        tr.append(td);
        td = $('<td>');
        input = $('<input>',{class:'text-center form-control', type:'text', id:'nbRepas', name:'nbRepas', value: affichagefichefrais.nbRepas});
        td.append(input);
        tr.append(td);
        td = $('<td>').text(affichagefichefrais.nbRepas * affichagefichefrais.tarifRepas);
        tr.append(td);
        tableauBody.append(tr);

        tr = $('<tr>', {class: 'text-center'});
        th = $('<th>', {scope: 'row'}).text('Distance en Km');
        tr.append(th);
        td = $('<td>').text(affichagefichefrais.tarifKm);
        tr.append(td);
        td = $('<td>');
        input = $('<input>',{class:'text-center form-control', type:'text', id:'nbKm', name:'nbKm', value: affichagefichefrais.nbKm});
        td.append(input);
        tr.append(td);
        td = $('<td>').text(affichagefichefrais.nbKm * affichagefichefrais.tarifKm);
        tr.append(td);
        tableauBody.append(tr);

        tableau.append(tableauBody);
        col12.append(tableau);
        row.append(col12);
        containerfluid.append(row);

        $("#modalfichefrais").append(containerfluid);
    }
}

function erreurAjax(request, error) {
    $.dialog({title: '', content: request.responseText, type: 'red',});
}

function afficherautresfrais(data) {

    for (const fraishorsforfait of data) {
        let tr = $('<tr>');
        let td = $('<td>');
        let input = $('<input>',{class:'text-center form-control', type:'text', id:'dateAutreFrais', name:'date', value: fraishorsforfait.date});
        td.append(input);
        tr.append(td);
        td = $('<td>');
        input = $('<input>',{class:'text-center form-control', type:'text', id:'libelleAutreFrais', name:'libelle', value: fraishorsforfait.libelle});
        td.append(input);
        tr.append(td);
        td = $('<td>');
        input = $('<input>',{class:'text-center form-control', type:'text', id:'MontantAutreFrais', name:'Montant', value: fraishorsforfait.montant});
        td.append(input);
        tr.append(td);
        td = $('<td>').text(fraishorsforfait.etat);
        tr.append(td);
        td = $('<td>');
        let supp = $('<a>', {class: 'deleteRow'});
        td.append(supp);
        input = $('<input>',{class:'ibtnDel btn btn-md btn-danger ', id:'btnSupprimer', type:'button', value: 'Supprimer'});
        td.append(input);
        tr.append(td);


        $("#fraishorsforfait").append(tr);
    }
}