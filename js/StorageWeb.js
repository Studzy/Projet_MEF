//Definir l'utilisateur actuel
function setLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let userName = nomTempo.value;
    sessionStorage.setItem('userLocal', userName);
}

//Fonction qui modifie l'entete droite de connection avec l'utilisateur connecter
function userConnecter() {
    var userConnecter = sessionStorage.getItem('userLocal');
    var posteUser = sessionStorage.getItem('posteLocal');
    $('#titreConnection').html('');
    $('#titreConnection').append("<li data-toggle='modal' data-target='#choixposte' class='nav-item' ><a class='nav-link'>" + posteUser + " - <span class='sr-only'></span></a></li>");
    $('#titreConnection').append("<li data-toggle='modal' data-target='#choixuser' class='nav-item' ><a class='nav-link'>" + userConnecter + "<span class='sr-only'></span></a></li>");
    $('#titreConnection').append("<li class='nav-item' ><a class='nav-link' href='http://localhost/Projet_MEF/index.html' onclick='userDeconnecter()'><img class='nav-link' width='7.5%' height='7.5%' src='img/sortie.jpg'/></a></li>"); // ****** Chemin d'accès *****

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
    //alert('Deconnecter !')
    //$('#contenu').html('');
    //connectionUtilisateur();

} else {
    //setStyles();
    //connectionUtilisateur();
    $('#nom_operateur').html('');
    userConnecter();
    //alert('Connecté ! ' + sessionStorage.getItem('userLocal'));
}

//Definir l'utilisateur actuel
function setLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let posteTempo = document.getElementById('poste_select');
    let choice = posteTempo.selectedIndex;
    let posteUser = posteTempo.options[choice].value;
    let userName = nomTempo.value;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    sessionStorage.setItem('posteLocal', posteUser);
    //alert("Nom utilisateur : " + posteUser + " - " + userName);

    /* let nomTempo = document.getElementById("nom_user");
    alert('1');
    let userName = nomTempo.value;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    alert('2');*/
}

function escapeRegExp(str) {
    return str.replace(/[.*+?^$:;"!<>{}()|[\]\\]/g, ""); // $& means the whole matched string
}

async function resetLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let userName = nomTempo.value;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    userConnecter();
}