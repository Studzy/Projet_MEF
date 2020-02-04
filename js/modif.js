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
    //alert("poste avant : " + posteAvant + " poste apres : " + posteAprès + " ref a deplacer : " + referenceDeplacer);
    //console.log('1');
    if (posteAprès != "" && posteAvant != "" && referenceDeplacer != "") {
        //console.log('2');
        $.ajax({
            type: 'POST',
            url: 'php/modif.php',
            data: {
                "id": referenceDeplacer,
                "posteDest": posteAprès
            },
            success: function(data) {
                //console.log('3');
                if (data.status = "ok") {
                    //console.log('4');
                    $("#success").show().delay(2000).fadeOut();
                    alert("La modification a été enregistrer !");
                    //console.log('5');
                    lirePostes();
                    //console.log('6');
                    //recupererDerniersCtrl();
                } else {
                    //console.log('7');
                    $("#echec").show().delay(2000).fadeOut();
                    alert("Echec de la modification !");
                    //console.log('8');
                    //recupererDerniersCtrl();
                }
            }

        });
    }

}

function afficherUneReference() {
    var i = document.getElementById('ref_select').selectedIndex;
    i = i - 1;
    console.log(i);
    $('#affichageReference').html('');
    $('#affichageReference').append("<li class='list-group-item' style='max-width:15%;'><figure class='figure'><img class='figure-img img-fluid rounded img-reference' style='display: block;'  width='125%' height='125%' src=" + references[i]['adresse_photo'] + "><figcaption class='figure-caption' style='font-size : 150%; font-weight: bold;text-align:center;'>" + references[i]['reference'] + "</figcaption></figure></li>");
}

async function lireRefs() {
    var select = document.getElementById('poste_select');
    var choice = select.selectedIndex;
    posteSelect = select.options[choice].value;
    try {
        let req = await fetch('php/references.php?id=' + posteSelect);
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
    $('#affichageReference').html('');
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
    $('#ref_select').append("<option value=''>--Choisir une référence--</option>");
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#ref_select').append("<option value='" + obj.id + "'>" + obj.reference + "</option>");
    });
}

function listeDeroulanteDefaut() {
    $("#ref_select").html('');
    //<option value="null">--Choisir une référence--</option>
    $('#ref_select').append("<option value=''>--Choisir une référence--</option>");
}

function ToutADefaut() {
    $("#ref_select").html('');
    $('#ref_select').append("<option value=''>--Choisir une référence--</option>");
    $("#poste_select_dest").html('');
    $('#poste_select_dest').append("<option value=''>--Choisir un poste--</option>");
    $("#poste_select").html('');
    $('#poste_select').append("<option value=''>--Choisir un poste--</option>");

}