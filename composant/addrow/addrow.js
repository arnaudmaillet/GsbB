$(document).ready(function () {
    var counter = 0;

    $("#addrow").on("click", function () {
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input id="date" type="text" class="form-control text-center" name="date' + counter + '"/></td>';
        cols += '<td><input id="libelle" type="text" class="form-control text-center" name="libelle' + counter + '"/></td>';
        cols += '<td><input id="montant" type="text" class="form-control text-center" name="montant' + counter + '"/></td>';
        cols += '<td><input id="etat" type="text" class="form-control text-center" name="etat' + counter + '"/></td>';

        cols += '<td><input id="btnSupprimer" type="button" class="ibtnDel btn btn-md btn-danger "  value="Supprimer"></td>';
        //cols += '<td><button id="btnAjouter" type="button" class="btn btn-outline-info">Ajouter</button></td>';
        newRow.append(cols);
        $("table.order-list").append(newRow);
        counter++;
    });



    $("table.order-list").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();
        counter -= 1
    });
});



function calculateRow(row) {
    var price = +row.find('input[name^="price"]').val();

}

function calculateGrandTotal() {
    var grandTotal = 0;
    $("table.order-list").find('input[name^="price"]').each(function () {
        grandTotal += +$(this).val();
    });
    $("#grandtotal").text(grandTotal.toFixed(2));
}