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
    $('#TitreConnection').html('');
    $('#TitreConnection').append("<li data-toggle='modal' onclick='lirePostesModal()' data-target='#choixposte' class='nav-item active' ><a class='nav-link'>" + posteUser + "<span class='sr-only'></span></a></li><li data-toggle='modal' data-target='#choixuser' class='nav-item active' ><a class='nav-link'>" + userConnecter + "<span class='sr-only'></span></a></li><li data-toggle='modal' data-target='#choixuser' class='nav-item active' style='width:50%;text-align:right;max-width:100px;' ><a class='nav-link' href='index' onclick='userDeconnecter()'><span class='sr-only'></span><img id='sortie'class='' width='50%' height='50%'  style='' src='img/sortie.png'/></a></li>"); // ****** Chemin d'accès ******
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

//Procédure qui verifie que l'utilisateur est connecté dans le cas contraire affiche un bouton se connecter
if (!sessionStorage.getItem('userLocal')) {
    $('#TitreConnection').html('');
    $('#TitreConnection').append("<li class='nav-item active' ><a class='nav-link' href='index'>Se connecter</a></li>");

} else {
    $('#nom_operateur').html('');
    userConnecter();
}

//Definir l'utilisateur actuel
function setLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let posteTempo = document.getElementById('poste_select');
    let choice = posteTempo.selectedIndex;
    let posteIdUser = posteTempo.options[choice].value;
    let userName = nomTempo.value;
    let posteUser = document.getElementById("poste_select").options[document.getElementById('poste_select').selectedIndex].text;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    sessionStorage.setItem('posteIdLocal', posteIdUser);
    sessionStorage.setItem('posteLocal', posteUser);
}

//Fonction qui retourne une chaine avec expression régulière
function escapeRegExp(str) {
    return str.replace(/[.*+?^$:;"!<>{}()|[\]\\]/g, "");
}

//Procédure qui initialise l'utilisateur actuel
async function resetLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let userName = nomTempo.value;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    userConnecter();
}

//Procédure qui initialise le poste actuel
async function resetLocalPoste() {
    let posteTempo = document.getElementById('poste_select');
    let choice = posteTempo.selectedIndex;
    let posteIdUser = posteTempo.options[choice].value;
    let posteUser = document.getElementById("poste_select").options[document.getElementById('poste_select').selectedIndex].text;;
    sessionStorage.setItem('posteIdLocal', posteIdUser);
    sessionStorage.setItem('posteLocal', posteUser);
    userConnecter();
    document.location.reload(true);
}

//Procédure qui ouvre un modal pour permettre de changer de poste
async function lirePostesModal() {
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

//Procédure qui reinitialise les postes
function ToutADefaut() {
    $("#poste_select").html('');
}

//Procédure qui reinitialise la liste déroulante des postes
function remplirListeDeroulantePoste() {
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.id + "'>" + obj.poste + "</option>");
    });
}

//Procédure qui actualise après le changement de poste
async function procedureChoixPoste() {
    resetLocalPoste();
    choixPoste();
}