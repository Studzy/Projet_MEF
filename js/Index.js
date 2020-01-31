let postes = [{}];
let references = [{}];
let posteSelect = "";
let idReference = "";
let posteAvant = "";
let posteAprès = "";
let referenceDeplacer = "";
let uneReference = [{}];
async function lirePostes() {
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
    $('#poste_select').append("<option value=''>--Choisir un poste--</option>");

}

async function lireRefs() {
    var select = document.getElementById('php/poste_select');
    var choice = select.selectedIndex;
    posteSelect = select.options[choice].value;
    try {
        let req = await fetch('references.php?id=' + posteSelect);
        //let req = (Chemin + '/references.php?id=' + posteEnCours);
        let json = await req.json();
        if (json.length) {
            references = json;
            remplirListeDeroulanteReference();
            //remplirRefs();
        } else {
            listeDeroulanteDefaut();
        }
    } catch (err) {
        console.log(err);
    }
}


function remplirListeDeroulantePoste() {
    //$("#poste_select").html('');
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        $('#poste_select').append("<option value='" + obj.poste + "'>" + obj.poste + "</option>");
    });
}

function listeDeroulanteDefaut() {
    $("#ref_select").html('');
    //<option value="null">--Choisir une référence--</option>
    $('#ref_select').append("<option value='null'>--Choisir une référence--</option>");
}
//window.onload = lirePostes;

//Definir l'utilisateur actuel
/*function setLocalUser() {
    let nomTempo = document.getElementById("nom_user");
    let posteTempo = document.getElementById('poste_select');
    let choice = posteTempo.selectedIndex;
    let posteUser = posteTempo.options[choice].value;
    let userName = nomTempo.value;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    sessionStorage.setItem('posteLocal', posteUser);
    alert("Nom utilisateur : " + posteUser + " - " + userName);

    /* let nomTempo = document.getElementById("nom_user");
    alert('1');
    let userName = nomTempo.value;
    userName = escapeRegExp(userName);
    sessionStorage.setItem('userLocal', userName);
    alert('2');*/
//}

lirePostes();

/*function escapeRegExp(str) {
    return str.replace(/[.*+?^$:;"!<>{}()|[\]\\]/g, ""); // $& means the whole matched string
}*/