var Chemin = "http://localhost/Projet_MEF/";
var VerifQuality = "";
var VerifReference = "";
var VerifDate = "";
var NomOperateur = "";
var utilisateurConnecter = "";
let postes = [{}];
let references = [{}];
let controles = [{}];
let posteEnCours = "";
let refEnCours = "";
let identifiant = "1";
let dateTempo = "";
let dateEnCours = "";

//Fonction qui recupère les postes grâce a une requete php et qui avec la fonction "remplirTableau()" affiche les poste sur la page
async function lirePostes() {
    try {
        //let req = await fetch(Chemin + '/postes.php');
        let req = await fetch('php/postes.php');
        //let req = ('D:\Users\jerem\Documents\Travail\Projet\PDS MEF Ferrage\meffer\postes.php');
        let json = await req.json();
        if (json.length) {
            postes = json;
            remplirTableau();
        }

    } catch (err) {
        console.log(err);
    }
}

//Utilise une requete php pour recuperer les refrences en BDD et avec la fonction "remplirRefs()" affiche les references sur la page
async function lireRefs() {
    try {
        alert('test');
        let req = await fetch('php/references.php?id=' + posteEnCours);
        //let req = (Chemin + '/references.php?id=' + posteEnCours);
        let json = await req.json();
        if (json.length) {
            references = json;
            remplirRefs();
        }
    } catch (err) {
        console.log(err);
    }
}

//Recupère grâce a une requete php les 10 derniers controles effectuer et avec la fonction "remplirDerniersCtrl()" les affiches sur la page
async function recupererDerniersCtrl() {
    try {
        let req = await fetch('php/lastctrl.php?id=' + posteEnCours);
        //let req = await (Chemin + '/references.php?id=' + posteEnCours);
        let json = await req.json();
        if (json.length) {
            controles = json;
            remplirDerniersCtrl();
        }
    } catch (err) {
        console.log(err);
    }
}

//Fonction qui permet d'afficher les references sur la page
function choixRef(r, i) {

    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#piece' + (obj.id)).removeClass("active");
    });
    $("#piece" + r).addClass("active");
    refEnCours = r;
    dateTempo = references[i]['date_reference'];
    var result = sessionStorage.getItem('userLocal');
    var elementUser = document.getElementById("nom_operateur");
    elementUser.value = result;
    alert('geUserName');
    /*
    if (dateTempo != null) {
    	var date = dateTempo.split('-');
    	dateEnCours = date[2] + '/' + date[1] + '/' + date[0];
    	$("#ajoutDate").append("<p>Date : </p><div class= 'row col-sm-12 my-auto'><div class='col-sm-6'><button name='' id='BtnDateOK' type='button'onclick=' changeColor('BtnDateOK')' class='tn btn-lg btn-succes' data-dismiss=''>OK</button></div><div class='col-sm-6'><button name='' id='BtnDateNOK' type='button' onclick='changeColor('BtnDateNOK')' class='btn btn-lg' data-dismiss=''>NOK</button></div></div >");
    }
    else {
    	dateEnCours = "";
    }*/

}

//Fonction qui va afficher les derniers controles sur la page
function remplirDerniersCtrl() {
    let tableau = $('#tab_ctrl > tbody');
    tableau.html('');
    controles.map(controles => {
        tableau.append('<tr>');
        for (let prop in controles) {
            if (controles.hasOwnProperty(prop)) {
                if (controles[prop]) {
                    if (controles[prop] == 1) {
                        tableau.find('tr').last().append('<td style="background-color:green;">OK</td>');
                    } else {
                        tableau.find('tr').last().append('<td>' + controles[prop] + '</td>');
                    }
                } else {
                    tableau.find('tr').last().append('<td style="background-color:red;">NOK</td>');
                }
            }

        }
    });
}


//Fonction qui va afficher dynamiquement les references sur la page à la suite de l'ID "listerefs"
function remplirRefs() {
    $("#listerefs").html('');
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        //$('#listerefs').append("<li data-toggle='modal' data-target='#choixcontrole' id='piece" + obj.id + "' onclick='choixRef(" + obj.id + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='' height='' src="+ obj.adresse_photo +"><figcaption class='figure-caption'>" + obj.reference + "</figcaption></figure></li>");
        $('#listerefs').append("<li data-toggle='modal' data-target='#choixcontrole' id='piece" + obj.id + "' onclick='choixRef(" + obj.id + "," + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded img-reference' style='display: block; margin-left: auto; margin-right: auto;'  width='75%' height='80%' src=" + obj.adresse_photo + "><figcaption class='figure-caption' style='font-size : 325%; font-weight: bold; text-align: center;'>" + obj.reference + "</figcaption></figure></li>");
    });
    recupererDerniersCtrl();
}

//Fonction qui après la selection du poste va afficher les references
function choixPoste(p) {
    posteEnCours = postes[p].id
    $("#content").html('');
    $("#poste").html(postes[p].poste);
    $("#content").append("<div class='col-sm-6' id='derniersCtrl'></div><div class='col-sm-6' id='choixpieces'></div>");
    $("#choixpieces").append("<h3 class='text-center display-5'>Choissisez la référence</h3><br />");
    //$("#choixpieces").append("<ul id='listerefs' class='list-group list-group-horizontal justify-content-center'></ul>");
    $("#choixpieces").append("<ul id='listerefs' class='' width='50%'></ul>");
    $("#derniersCtrl").append("<table id='tab_ctrl' class='table table-responsive-md table-striped table-bordered table-active text-center'></table>");
    $("#tab_ctrl").append("<thead><tr><th>#</th><th>Date/heure</th><th>Nom</th><th>Poste</th><th>Référence</th></th><th>Etat</th></tr></thead><tbody></tbody>");
    lireRefs();
}

//Fonction qui affiche les differents postes sous forme de tableau 
function remplirTableau() {
    $("#listepostes").html('');
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        if (i < 3) {
            $('#listepostes').append("<li onclick='choixPoste(" + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 2 && i < 6) {
            $('#content').append("<ul id='listepostes2' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes2').append("<li onclick='choixPoste(" + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 5 && i < 9) {
            $('#content').append("<ul id='listepostes3' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes3').append("<li onclick='choixPoste(" + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 8 && i < 12) {
            $('#content').append("<ul id='listepostes4' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes4').append("<li onclick='choixPoste(" + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 11 && i < 15) {
            $('#content').append("<ul id='listepostes5' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes5').append("<li onclick='choixPoste(" + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 14) {
            $('#content').append("<ul id='listepostes6' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes6').append("<li onclick='choixPoste(" + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }

    });
}

function TestAlert() {
    alert('Utilisation de fonction !');
}
//Fonction qui recupere le nom de l'operateur de l'élément avce l'ID "nom_operateur"
function recupererNomOperateur() {
    var nom_operateur = document.getElementById("nom_operateur");
    var result = nom_operateur.value;
    var resultNom = "";
    resultNom = result;
    return resultNom
}

function Result() {

}

function afficheResult() {
    alert(recupererNomOperateur());
}

//Fonction qui change la couleur des boutons dans le formulaire modal en fonction du bouton selectionner
function changeColor(NomBouton) {
    //if (document.frm.button1.style.background = 'blue') { document.frm.button1.style.background = 'red'; }
    if (NomBouton == "BtnQualityOK") {
        BtnQualityOK.style.backgroundColor = 'green';
        BtnQualityOK.style.color = 'white';
        BtnQualityNOK.style.backgroundColor = '#e9ecef';
        BtnQualityNOK.style.color = 'black';
        VerifQuality = "OK";
    }
    if (NomBouton == "BtnQualityNOK") {
        BtnQualityOK.style.backgroundColor = '#e9ecef';
        BtnQualityNOK.style.backgroundColor = 'red';
        BtnQualityNOK.style.color = 'white';
        BtnQualityOK.style.color = 'black';
        VerifQuality = "NOK";
    }
    if (NomBouton == "BtnRefOK") {
        BtnRefOK.style.backgroundColor = 'green';
        BtnRefOK.style.color = 'white';
        BtnRefNOK.style.backgroundColor = '#e9ecef';
        BtnRefNOK.style.color = 'black';
        VerifReference = "OK";
    }
    if (NomBouton == "BtnRefNOK") {
        BtnRefOK.style.backgroundColor = '#e9ecef';
        BtnRefNOK.style.backgroundColor = 'red';
        BtnRefOK.style.color = 'black';
        BtnRefNOK.style.color = 'white';
        VerifReference = "NOK";
    }
    if (NomBouton == "BtnDateOK") {
        BtnDateOK.style.backgroundColor = 'green';
        BtnDateOK.style.color = 'white';
        BtnDateNOK.style.backgroundColor = '#e9ecef';
        BtnDateNOK.style.color = 'black';
        VerifDate = "OK";
    }
    if (NomBouton == "BtnDateNOK") {
        BtnDateOK.style.backgroundColor = '#e9ecef';
        BtnDateNOK.style.backgroundColor = 'red';
        BtnDateOK.style.color = 'black';
        BtnDateNOK.style.color = 'white';
        VerifDate = "NOK";
    }
    //BtnQualityOK.style.backgroundColor = 'blue'
}

//Redefinis la couleur des boutons du formulaire modal
function resetButtonColor() {
    BtnQualityOK.style.backgroundColor = '#e9ecef';
    BtnQualityNOK.style.backgroundColor = '#e9ecef';
    BtnRefOK.style.backgroundColor = '#e9ecef';
    BtnRefNOK.style.backgroundColor = '#e9ecef';
    BtnDateOK.style.backgroundColor = '#e9ecef';
    BtnDateNOK.style.backgroundColor = '#e9ecef';
    BtnQualityOK.style.color = 'black';
    BtnQualityNOK.style.color = 'black';
    BtnRefOK.style.color = 'black';
    BtnRefNOK.style.color = 'black';
    BtnDateOK.style.color = 'black';
    BtnDateNOK.style.color = 'black';
}


function testEnvoiPhoto() {
    $.ajax({
        type: 'POST',
        url: 'php/addPhoto.php',
        success: function(data) {
            if (data.status = "ok") {
                $("#success").show().delay(2000).fadeOut();
                recupererDerniersCtrl();
            } else {
                $("echec").show().delay(2000).fadeOut();
                recupererDerniersCtrl();
            }
        }
    });
}

// Procedure qui envoie les nouvelles infos a la BDD 
function procedureEnvvoi() {
    NomOperateur = recupererNomOperateur();
    if (NomOperateur != "") {
        if (VerifReference != "" && VerifQuality != "") {
            if (VerifReference == "OK" && VerifQuality == "OK") {
                let res = 1;
                NomOperateur = recupererNomOperateur();

                $.ajax({
                    type: 'POST',
                    url: 'php/write.php',
                    data: { "userid": identifiant, "poste": posteEnCours, "ref": refEnCours, "res": res, "resQualite": VerifQuality, "resReference": VerifReference, "resDate": VerifDate, "userName": NomOperateur },
                    success: function(data) {
                        if (data.status = "ok") {
                            $("#success").show().delay(2000).fadeOut();
                            recupererDerniersCtrl();
                        } else {
                            $("echec").show().delay(2000).fadeOut();
                            recupererDerniersCtrl();
                        }
                    }
                });
                recupererDerniersCtrl();
            } else {
                let res = 0;
                $.ajax({
                    type: 'POST',
                    url: 'php/write.php',
                    data: { "userid": identifiant, "poste": posteEnCours, "ref": refEnCours, "res": res, "resQualite": VerifQuality, "resReference": VerifReference, "resDate": VerifDate, "userName": NomOperateur },
                    success: function(data) {
                        if (data.status = "ok") {
                            $("#success").show().delay(2000).fadeOut();
                            recupererDerniersCtrl();
                        } else {
                            $("echec").show().delay(2000).fadeOut();
                            recupererDerniersCtrl();
                        }
                    }
                });
                recupererDerniersCtrl();
            }
        }
    } else {
        alert("Veuillez vous connecter");
    }
    VerifDate = "";
    VerifQuality = "";
    VerifReference = "";
    resetButtonColor();
    //lirePostes();
}

function connectionUser() {
    utilisateurConnecter = recupererNomOperateur();

}