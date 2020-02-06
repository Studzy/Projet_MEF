let postes = [{}];
let references = [{}];
let posteSelect = "";
let idReference = "";
let posteAvant = "";
let posteAprès = "";
let referenceDeplacer = "";
let uneReference = [{}];

//Procedure qui recupère les postes grâce a une requete php et qui va initialiser les liste deroulante
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

//Procedure qui va effectuer la modification auprès de la BDD 
async function modifEmplacementRef() {
    var select = document.getElementById('poste_select');
    var choice = select.selectedIndex;
    posteAvant = select.options[choice].value;
    select = document.getElementById('poste_select_dest');
    choice = select.selectedIndex;
    posteAprès = select.options[choice].value;
    select = document.getElementById('ref_select');
    choice = select.selectedIndex;
    referenceDeplacer = select.options[choice].value;
    if (posteAprès != "" && posteAvant != "" && referenceDeplacer != "") {
        $.ajax({
            type: 'POST',
            url: 'php/modif.php',
            data: {
                "id": referenceDeplacer,
                "posteDest": posteAprès
            },
            success: function(data) {
                if (data.status = "ok") {
                    $("#success").show().delay(2000).fadeOut();
                    lirePostes();
                } else {
                    $("#echec").show().delay(2000).fadeOut();
                }
            }

        });
        alert("La modification a été enregistrer !");

    }

}

//Procédure qui va afficher la photo de la reference selectionner 
function afficherUneReference() {
    var i = document.getElementById('ref_select').selectedIndex;
    i = i - 1;
    console.log(i);
    $('#affichageReference').html('');
    $('#affichageReference').append("<li class='list-group-item' style='max-width:15%;'><figure class='figure'><img class='figure-img img-fluid rounded img-reference' style='display: block;'  width='125%' height='125%' src=" + references[i]['adresse_photo'] + "><figcaption class='figure-caption' style='font-size : 150%; font-weight: bold;text-align:center;'>" + references[i]['reference'] + "</figcaption></figure></li>");
}

//Procédure qui va recuperer les references en fonction du poste selectionner et les ajouter dans la liste déroulante
async function lireRefs() {
    var select = document.getElementById('poste_select');
    var choice = select.selectedIndex;
    posteSelect = select.options[choice].value;
    try {
        let req = await fetch('php/references.php?id=' + posteSelect);
        let json = await req.json();
        if (json.length) {
            references = json;
            remplirListeDeroulanteReference();
        } else {
            listeDeroulanteDefaut();
        }
    } catch (err) {
        console.log(err);
    }
    $('#affichageReference').html('');
}

//Procédure qui permet de remplir la liste deroulante avec les postes
function remplirListeDeroulantePoste() {
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.id + "'>" + obj.poste + "</option>");
        $('#poste_select_dest').append("<option value='" + obj.id + "'>" + obj.poste + "</option>");
    });
}

//Procédure qui permet de remplir la liste deroulante avec les references
function remplirListeDeroulanteReference() {
    $("#ref_select").html('');
    $('#ref_select').append("<option value=''>--Choisir une référence--</option>");
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#ref_select').append("<option value='" + obj.id + "'>" + obj.reference + "</option>");
    });
}

//Procédure qui va vider la liste déroulante référence
function listeDeroulanteDefaut() {
    $("#ref_select").html('');
    $('#ref_select').append("<option value=''>--Choisir une référence--</option>");
}

//Procédure qui va vider les 3 listes déroulante
function ToutADefaut() {
    $("#ref_select").html('');
    $('#ref_select').append("<option value=''>--Choisir une référence--</option>");
    $("#poste_select_dest").html('');
    $('#poste_select_dest').append("<option value=''>--Choisir un poste--</option>");
    $("#poste_select").html('');
    $('#poste_select').append("<option value=''>--Choisir un poste--</option>");

}