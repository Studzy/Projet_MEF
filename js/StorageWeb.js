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
    /*
    $('#posteConnection').html('');
    $('#userConnection').html('');*/
    //$('#imgConnection').html('');
    $('#TitreConnection').html('');
    //$('#TitreConnection').append("<table><tr><td data-toggle='modal' onclick='lirePostesModal()' data-target='#choixposte' class='' ><a class=''><p>" + posteUser + " - </p><span class='sr-only'></span></a></td><td data-toggle='modal' data-target='#choixuser' class='' ><a class=''><p>" + userConnecter + "</p><span class=''></span></a></td><td data-toggle='modal' data-target='#choixuser' class='' style='width:5%;' ><a class='' href='http://localhost/Projet_MEF/index.html' onclick='userDeconnecter()'><span class=''></span><img id='sortie'class='' width='9%' height='9%'  style='' src='img/sortie.png'/></a></td></tr></table>");
    $('#TitreConnection').append("<li data-toggle='modal' onclick='lirePostesModal()' data-target='#choixposte' class='nav-item active' ><a class='nav-link'>" + posteUser + "<span class='sr-only'></span></a></li><li data-toggle='modal' data-target='#choixuser' class='nav-item active' ><a class='nav-link'>" + userConnecter + "<span class='sr-only'></span></a></li><li data-toggle='modal' data-target='#choixuser' class='nav-item active' style='width:50%;text-align:right;max-width:100px;' ><a class='nav-link' href='http://localhost/Projet_MEF/' onclick='userDeconnecter()'><span class='sr-only'></span><img id='sortie'class='' width='50%' height='50%'  style='' src='img/sortie.png'/></a></li>"); // ****** Chemin d'accès ******
    //<li><p style='text-align:right;'><a class='nav-item active' href='http://localhost/Projet_MEF/index.html' onclick='userDeconnecter()'><img class='nav-link' width='7.5%' height='7.5%'  style='' src='img/sortie.jpg'/></a></p></li>
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
    $('#TitreConnection').html('');
    $('#TitreConnection').append("<li class='nav-item active' ><a class='nav-link' href='http://localhost/Projet_MEF/'>Se connecter</a></li>");

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

async function resetLocalPoste() {
    let posteTempo = document.getElementById('poste_select');
    let choice = posteTempo.selectedIndex;
    let posteUser = posteTempo.options[choice].value;
    sessionStorage.setItem('posteLocal', posteUser);
    userConnecter();
    document.location.reload(true);
}


async function lirePostesModal() {
    try {
        //let req = await fetch(Chemin + '/postes.php');
        let req = await fetch('php/postes.php');
        //let req = ('D:\Users\jerem\Documents\Travail\Projet\PDS MEF Ferrage\meffer\postes.php');
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

function ToutADefaut() {
    $("#poste_select").html('');
}

function remplirListeDeroulantePoste() {
    //$("#poste_select").html('');
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.poste + "'>" + obj.poste + "</option>");
    });
}

async function procedureChoixPoste() {
    resetLocalPoste();
    choixPoste();
}