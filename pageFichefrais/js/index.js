// Afficher les données dans un conteneur <table>

$(function () {
    $.getJSON('ajax/getlesformulaire.php', afficherTable).fail(erreurAjax);
    $.getJSON('ajax/getlafiche.php', afficherEnCours).fail(erreurAjax);
    $('#menu').load('../ajax/getmenu.php');
    $('#pied').load('../ajax/getpied.php');
});

function afficherEnCours(data){
    for(const FicheFrais of data){

        let date = $('<div>');
        let text = $('<p>').text('Date de création : ' + FicheFrais.dateCreation)
        date.append(text);
        $('#dateFicheEnCours').append(date);

        let montant = $('<div>');
        text = $('<p>').text('Montant total : ' + FicheFrais.montant)
        montant.append(text);
        $('#montantFicheEnCours').append(montant);

    }

}

function afficherTable(data) {
    for(const FicheFrais of data){
        let tr = $('<tr>');
        let td = $('<th>', {class : 'text-center'}).text(FicheFrais.dateCreation);
        tr.append(td);
        td = $('<th>', {class : 'text-center'}).text(FicheFrais.montant);
        tr.append(td);
        td = $('<th>', {class : 'text-center'}).text(FicheFrais.idEtat);
        tr.append(td);
        $('#tableFiches').append(tr);

    }
}


function erreurAjax(request, error) {
    $.dialog({title: '', content: request.responseText, type: 'red',});
}