let postes = [{}];
let references = [{}];
let posteSelect = "";
let idReference = "";
let posteAvant = "";
let posteAprès = "";
let referenceDeplacer = "";
let uneReference = [{}];

//Procédure qui recupère les postes grâce a une requete php et qui avec la fonction "remplirTableau()" affiche les poste sur la page
async function lirePostes() {
    try {
        let req = await fetch('php/postes.php'); //lance la requete php pour recuperer les postes
        let json = await req.json();
        if (json.length) {
            postes = json;
            ToutADefaut(); //lance la procedure qui reinitialise les postes
            remplirListeDeroulantePoste(); //rempli la liste déroulante avec les postes
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

//rempli la liste déroulante avec les postes
function remplirListeDeroulantePoste() {
    $.each(postes, function(i, obj) {
        //console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.id + "'>" + obj.poste + "</option>");
    });
}


lirePostes();