let postes = [{}];
let references = [{}];
let posteSelect = "";
let idReference = "";
let posteAvant = "";
let posteAprès = "";
let referenceDeplacer = "";
let uneReference = [{}];

//Recupère les postes dans la BDD et rempli la liste déroulante
async function lirePostes() {
    try {
        let req = await fetch('php/postes.php');
        let json = await req.json();
        if (json.length) {
            postes = json;
            ToutADefaut();
            remplirListeDeroulantePoste();
        }

    } catch (err) {
        console.log(err);
    }
}

//Reinitialise la liste déroulante
function ToutADefaut() {
    $("#poste_select").html('');
    $('#poste_select').append("<option value=''>-- Choisir un poste --</option>");
}

//Rempli la liste déroulante avec l'objet postes
function remplirListeDeroulantePoste() {
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.id + "'>" + obj.poste + "</option>");
    });
}


lirePostes();