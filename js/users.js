let users = [{}];

//Procédure qui recupère les postes grâce a une requete php et qui avec la fonction "remplirTableau()" affiche les poste sur la page
//Fonction situer dans : Index.js, User.js
async function lireUsers() {
    try {
        let req = await fetch('php/users.php');
        let json = await req.json();
        if (json.length) {
            users = json;
            listeDeroulanteUserVide(); //Procédure qui va vider la liste d'users
            remplirListeDeroulanteUser();//Procédure qui va remplir la liste avec les users en BDD
        }

    } catch (err) {
        console.log(err);
    }
}

//Procedure qui va ajouter un user dans la BDD 
async function addUser() {
    var userRpi = document.getElementById('userRpi').value; //recupere le rpi entrer dans le label
    if (userRpi.length > 9){// verification que le RPI ne depasse pas 9 caractères
        alert("Le Rpi doit être au maximum à 9 caractères");
        return;
    }
    if (userRpi != "") { //verifie que la valeur n'est pas vide
        $.ajax({
            type: 'POST',
            url: 'php/addUser.php',
            data: {
                "userRpi": userRpi
            },
            success: function(data) {
                if (data.status = "ok") { // si la requete a réussi
                    $("#success").show().delay(2000).fadeOut();
                    lireUsers();
                } else { // si la requete a échoué
                    $("#echec").show().delay(2000).fadeOut();
                }
            }

        });
        alert("L'utilisateur a été ajouter !"); //informations pour l'utilisateur

    }

}

//Procedure qui va supprimer un user dans la BDD 
async function deleteUser() {
    var select = document.getElementById('users_select');
    var choice = select.selectedIndex;
    var userId = select.options[choice].value; //recupere l'element selectionner dans users_select
    if (userRpi != "") { //verifie que la valeur n'est pas vide
        $.ajax({
            type: 'POST',
            url: 'php/deleteUser.php',
            data: {
                "userId": userId
            },
            success: function(data) {
                if (data.status = "ok") { // si la requete a réussi
                    $("#success").show().delay(2000).fadeOut();
                    lireUsers();
                } else { // si la requete a échoué
                    $("#echec").show().delay(2000).fadeOut();
                }
            }

        });
        alert("L'utilisateur a été supprimer !"); //informations pour l'utilisateur

    }

}

//Procédure qui permet de remplir la liste deroulante avec les users
//Fonction situer dans : Index.js, User.js
function remplirListeDeroulanteUser() {
    $.each(users, function(i, obj) {
        //console.log(obj.id + ' ' + obj.poste);
        $('#users_select').append("<option value='" + obj.Id + "'>" + obj.rpi + "</option>");
    });
}

//Procédure qui va vider la liste déroulante users
function listeDeroulanteUserVide() {
    $("#users_select").html('');
    $('#users_select').append("<option value=''>--Choisir un utilisateur--</option>");
}