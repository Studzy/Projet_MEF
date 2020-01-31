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
        let req = await fetch('postes.php');
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

async function Test() {

    var select = document.getElementById('poste_select');
    var choice = select.selectedIndex;
    posteAvant = select.options[choice].value;
    select = document.getElementById('poste_select_dest');
    choice = select.selectedIndex;
    posteAprès = select.options[choice].value;
    select = document.getElementById('ref_select');
    choice = select.selectedIndex;
    referenceDeplacer = select.options[choice].value;
    alert("poste avant : " + posteAvant + "/ poste apres : " + posteAprès + "/ ref a deplacer : " + referenceDeplacer);
}

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
    //alert("poste avant : " + posteAvant + "/ poste apres : " + posteAprès + "/ ref a deplacer : " +referenceDeplacer);
    $.ajax({
        type: 'POST',
        url: 'modif.php',
        data: { "id": referenceDeplacer, "posteDest": posteAprès },
        success: function(data) {
            if (data.status = "ok") {
                $("#success").show().delay(2000).fadeOut();
                alert("La modification a été enregistrer !");
                lirePostes();
                //recupererDerniersCtrl();
            } else {
                $("echec").show().delay(2000).fadeOut();
                alert("Echec de la modification !");
                //recupererDerniersCtrl();
            }
        }

    });
}

async function lireRefs() {
    var select = document.getElementById('poste_select');
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
        $('#poste_select').append("<option value='" + obj.id + "'>" + obj.id + "</option>");
        $('#poste_select_dest').append("<option value='" + obj.id + "'>" + obj.id + "</option>");
    });
}

function remplirListeDeroulanteReference() {
    $("#ref_select").html('');
    //<option value="null">--Choisir une référence--</option>
    $('#ref_select').append("<option value='null'>--Choisir une référence--</option>");
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#ref_select').append("<option value='" + obj.id + "'>" + obj.reference + "</option>");
    });
}

function listeDeroulanteDefaut() {
    $("#ref_select").html('');
    //<option value="null">--Choisir une référence--</option>
    $('#ref_select').append("<option value='null'>--Choisir une référence--</option>");
}

function ToutADefaut() {
    $("#ref_select").html('');
    $('#ref_select').append("<option value='null'>--Choisir une référence--</option>");
    $("#poste_select_dest").html('');
    $('#poste_select_dest').append("<option value='null'>--Choisir un poste--</option>");
    $("#poste_select").html('');
    $('#poste_select').append("<option value='null'>--Choisir un poste--</option>");

}