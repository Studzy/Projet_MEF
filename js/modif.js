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
        let req = await fetch('php/postes.php');
        let json = await req.json();
        if (json.length) {
            postes = json;
            ToutADefaut(); //Procédure qui va vider les 3 listes déroulante
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
    posteAvant = select.options[choice].value; //recupere l'element selectionner dans poste_select
    select = document.getElementById('poste_select_dest');
    choice = select.selectedIndex;
    posteAprès = select.options[choice].value; //recupere l'element selectionner dans poste_dest
    select = document.getElementById('ref_select');
    choice = select.selectedIndex;
    referenceDeplacer = select.options[choice].value;
    //recupere l'element selectionner dans ref_select
    if (posteAprès != "" && posteAvant != "" && referenceDeplacer != "") { //verifie que des elements on été selectionné dans les 3 listes deroulantes
        $.ajax({
            type: 'POST',
            url: 'php/modif.php',
            data: {
                "id": referenceDeplacer,
                "posteDest": posteAprès
            },
            success: function(data) {
                if (data.status = "ok") { // si la requete a réussi
                    $("#success").show().delay(2000).fadeOut();
                    lirePostes();
                } else { // si la requete a échoué
                    $("#echec").show().delay(2000).fadeOut();
                }
            }

        });
        alert("La modification a été enregistrer !"); //informations pour l'utilisateur

    }

}

//Procédure qui va afficher la photo de la reference selectionner 
function afficherUneReference() {
    var i = document.getElementById('ref_select').selectedIndex; //recupere l'id de la liste deeroulante ref_select
    i = i - 1;
    //console.log(i);
    $('#affichageReference').html('');
    $('#affichageReference').append("<li class='list-group-item' style='max-width:15%;'><figure class='figure'><img class='figure-img img-fluid rounded img-reference' style='display: block;'  width='125%' height='125%' src=" + references[i]['adresse_photo'] + "><figcaption class='figure-caption' style='font-size : 150%; font-weight: bold;text-align:center;'>" + references[i]['reference'] + "</figcaption></figure></li>"); //ajoute a la suite de l'id affichageReference un element html qui affiche la ref en fonction de l'id
}

//Procédure qui va recuperer les references en fonction du poste selectionner et les ajouter dans la liste déroulante
async function lireRefs() {
    var select = document.getElementById('poste_select');
    var choice = select.selectedIndex;
    posteSelect = select.options[choice].value; //recupere la valeur selectionner de la liste deroulante poste_select
    try {
        let req = await fetch('php/references.php?id=' + posteSelect); //requete qui cherche la ref grace a son id
        let json = await req.json();
        if (json.length) { // si la requete reussi
            references = json; //conserve la ref en tant qu'objet
            remplirListeDeroulanteReference(); //rempli la liste deroulante reference avec les references du poste selectionner
        } else { //si la requete echoue
            listeDeroulanteDefaut(); //remet les liste par defaut
        }
    } catch (err) {
        console.log(err);
    }
    $('#affichageReference').html('');
}

//Procédure qui permet de remplir la liste deroulante avec les postes
function remplirListeDeroulantePoste() {
    $.each(postes, function(i, obj) {
        //console.log(obj.id + ' ' + obj.poste);
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