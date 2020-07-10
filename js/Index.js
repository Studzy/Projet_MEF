let postes = [{}];
let users = [{}];
let references = [{}];
let posteSelect = "";
let idReference = "";
let posteAvant = "";
let posteAprès = "";
let referenceDeplacer = "";
let uneReference = [{}];

//Procédure qui recupère les postes grâce a une requete php et qui avec la fonction "remplirListeDeroulantePoste()" affiche les poste sur la page
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

//Procédure qui recupère les postes grâce a une requete php et qui avec la fonction "remplirListeDeroulanteUser()" affiche les users sur la page
//Fonction situer dans : Index.js, User.js
async function lireUsers() {
    try {
        let req = await fetch('php/users.php');
        let json = await req.json();
        if (json.length) {
            users = json;
            ToutADefaut(); //Procédure qui va vider la liste d'users
            remplirListeDeroulanteUser();//Procédure qui va remplir la liste avec les users en BDD
        }

    } catch (err) {
        console.log(err);
    }
}


//Reinitialise les listes déroulantes
function ToutADefaut() {
    $("#poste_select").html('');
    $('#poste_select').append("<option value=''>-- Choisir un poste --</option>");
    $("#users_select").html('');
    $('#users_select').append("<option value=''>--Choisir un utilisateur--</option>");
}

//rempli la liste déroulante avec les postes
function remplirListeDeroulantePoste() {
    $.each(postes, function(i, obj) {
        //console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.id + "'>" + obj.poste + "</option>");
    });
}

//Procédure qui permet de remplir la liste deroulante avec les users
//Fonction situer dans : Index.js, User.js
function remplirListeDeroulanteUser() {
    $.each(users, function(i, obj) {
        //console.log(obj.id + ' ' + obj.poste);
        $('#users_select').append("<option value='" + obj.rpi + "'>");
    });
}

lireUsers();
lirePostes();