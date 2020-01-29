//Definir l'utilisateur actuel
function setLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let userName = nomTempo.value;
    sessionStorage.setItem('userLocal', userName);
}

//Fonction qui modifie l'entete droite de connection avec l'utilisateur connecter
function userConnecter() {
    var userConnecter = sessionStorage.getItem('userLocal');
    $('#titreConnection').html('');
    $('#titreConnection').append("<li class='nav-item' ><a class='nav-link'>" + userConnecter + "<span class='sr-only'></span></a></li>");
    $('#titreConnection').append("<li class='nav-item' ><a class='nav-link' href='http://localhost/Projet_MEF/index.html' onclick='userDeconnecter()'>Se deconnecter<span class='sr-only'></span></a></li>");

}

//fonction qui modifie l'entete droit de connection pour le mode deconnecter
function userDeconnecter() {
    sessionStorage.clear();
}

//Procedure de connection de l'utilisateur
async function connectionUtilisateur() {
    setLocalUser();
    userConnecter();
}


//window.location.assign("http://localhost/Projet_MEF/controle.html");
if (!sessionStorage.getItem('userLocal')) {
    //populateStorage();
    //userDeconnecter();
    alert('Deconnecter !')
    //$('#contenu').html('');
    //connectionUtilisateur();

} else {
    //setStyles();
    //connectionUtilisateur();
    $('#nom_operateur').html('');
    userConnecter();
    alert('Connecter !' + sessionStorage.getItem('userLocal'));
}
