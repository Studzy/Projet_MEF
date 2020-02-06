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


//Procédure qui recupère les postes grâce a une requete php et qui avec la fonction "remplirTableau()" affiche les poste sur la page
async function lirePostes() {
    try {
        let req = await fetch('php/postes.php');
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
        let req = await fetch('php/references.php?id=' + posteEnCours);
        let json = await req.json();
        if (json.length) {
            references = json;
            remplirRefs();
        }
    } catch (err) {
        console.log(err);
    }
}

//Recupère grâce a une requete php les 15 derniers controles effectuer et avec la fonction "remplirDerniersCtrl()" les affiches sur la page
async function recupererDerniersCtrl() {
    try {
        let req = await fetch('php/lastctrl.php?id=' + posteEnCours);
        let json = await req.json();
        if (json.length) {
            controles = json;
            remplirDerniersCtrl();
        }
    } catch (err) {
        console.log(err);
    }
}

//Procédure qui permet d'afficher les references sur la page et si il y a une date a verifier dans la base de données, elle va ajouter un nouveau block dans le modal pour demander a l'utilisateur de verifier la date
function choixRef(r, i) {

    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#piece' + (obj.id)).removeClass("active");
    });
    $("#piece" + r).addClass("active");
    $("#NumRef").html("");
    $('#NumRef').append('<p>Référence : ' + references[i]['reference'] + '</p>');
    refEnCours = r;
    dateTempo = references[i]['date_reference'];
    var result = sessionStorage.getItem('userLocal');
    var elementUser = document.getElementById("nom_operateur");
    var BtnOK = "\"BtnDateOK\"";
    var BtnNOK = "\"BtnDateNOK\"";
    elementUser.value = result;
    if (dateTempo == 1) {
        dateEnCours = "1";
        $("#ajoutDate").html('');
        $("#ajoutDate").append("<p>Date limite d'utilisation : </p><div class='row col-sm-12 my-auto'><div class='col-sm-6'><button name='' id='BtnDateOK' type='button' onclick='changeColor(" + BtnOK + ")' class='btn btn-lg btn-succes' style='font-size: 200%;' data-dismiss=''>OK</button></div><div class='col-sm-6'><button name='' id='BtnDateNOK' type='button' onclick='changeColor(" + BtnNOK + ")' class='btn btn-lg' style='font-size: 200%;' data-dismiss=''>NOK</button></div></div>");
    } else {
        dateEnCours = "";
    }

}

//Procédure qui va afficher les derniers controles sur la page
function remplirDerniersCtrl() {
    let tableau = $('#tab_ctrl > tbody');
    tableau.html('');
    controles.map(controles => {
        tableau.append('<tr>');
        for (let prop in controles) {
            if (controles.hasOwnProperty(prop)) {
                if (controles[prop]) {
                    if (controles[prop] == 1) {
                        tableau.find('tr').last().append('<td style="background-color:green;color:white;font-weight:bold;">OK</td>');
                    } else {
                        tableau.find('tr').last().append('<td>' + controles[prop] + '</td>');
                    }
                } else {
                    tableau.find('tr').last().append('<td style="background-color:red;color:white;font-weight:bold;">NOK</td>');
                }
            }

        }
    });
}


//Procédure qui va afficher dynamiquement les references sur la page à la suite de l'ID "listerefs"
function remplirRefs() {
    $("#listerefs").html('');
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#listerefs').append("<li data-toggle='modal' data-target='#choixcontrole' id='piece" + obj.id + "' onclick='choixRef(" + obj.id + "," + i + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded img-reference' style='display: block; margin-left: auto; margin-right: auto;'  width='75%' height='80%' src=" + obj.adresse_photo + "><figcaption class='figure-caption' style='font-size : 325%; font-weight: bold; text-align: center;'>" + obj.reference + "</figcaption></figure></li>");
    });
    recupererDerniersCtrl();
}

//Procédure qui après la selection du poste va afficher les references
function choixPoste() {
    $("#content").html('');
    $("#poste").html(sessionStorage.getItem('posteIdLocal'));
    $("#content").append("<div class='col-sm-6' id='derniersCtrl'></div><div class='col-sm-6' id='choixpieces'></div>");
    $("#choixpieces").append("<h3 class='text-center display-5'>Choisissez la référence</h3><br />");
    $("#choixpieces").append("<ul id='listerefs' class='' width='50%'></ul>");
    $("#derniersCtrl").append("<table id='tab_ctrl' class='table table-responsive-md table-striped table-bordered table-active text-center'></table>");
    $("#tab_ctrl").append("<thead><tr><th>Date/heure</th><th>Nom</th><th>Poste</th><th>Référence</th></th><th>Etat</th></tr></thead><tbody></tbody>");
    lireRefs();
}

//Procédure qui affiche les differents postes sous forme de tableau 
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

//Fonction qui recupere le nom de l'operateur de l'élément avce l'ID "nom_operateur"
function recupererNomOperateur() {
    var nom_operateur = document.getElementById("nom_operateur");
    var result = nom_operateur.value;
    var resultNom = "";
    resultNom = result;
    return resultNom
}


//Fonction qui change la couleur des boutons dans le formulaire modal en fonction du bouton selectionner
function changeColor(NomBouton) {
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
}

//Redefinis la couleur des boutons du formulaire modal
function resetButtonColor() {
    BtnQualityOK.style.backgroundColor = '#e9ecef';
    BtnQualityNOK.style.backgroundColor = '#e9ecef';
    BtnRefOK.style.backgroundColor = '#e9ecef';
    BtnRefNOK.style.backgroundColor = '#e9ecef';
    BtnQualityOK.style.color = 'black';
    BtnQualityNOK.style.color = 'black';
    BtnRefOK.style.color = 'black';
    BtnRefNOK.style.color = 'black';
    $("#ajoutDate").html('');

}

// Procedure qui envoie les nouvelles infos a la BDD sans la verification de la date 
function envoiSansDate() {
    NomOperateur = recupererNomOperateur();
    if (NomOperateur != "") {
        if (VerifReference != "" && VerifQuality != "") {
            if (VerifReference == "OK" && VerifQuality == "OK") {
                let res = 1;
                NomOperateur = recupererNomOperateur();

                $.ajax({
                    type: 'POST',
                    url: 'php/write.php',
                    data: {
                        "userid": identifiant,
                        "poste": posteEnCours,
                        "ref": refEnCours,
                        "res": res,
                        "resQualite": VerifQuality,
                        "resReference": VerifReference,
                        "resDate": VerifDate,
                        "userName": NomOperateur
                    },
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
                    data: {
                        "userid": identifiant,
                        "poste": posteEnCours,
                        "ref": refEnCours,
                        "res": res,
                        "resQualite": VerifQuality,
                        "resReference": VerifReference,
                        "resDate": VerifDate,
                        "userName": NomOperateur
                    },
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
}

// Procedure qui envoie les nouvelles infos a la BDD, si les champs ne sont pas vide avec la verification de la date 
function envoiAvecDate() {
    NomOperateur = recupererNomOperateur();
    if (NomOperateur != "") {
        if (VerifReference != "" && VerifQuality != "" && VerifDate != "") {
            if (VerifReference == "OK" && VerifQuality == "OK" && VerifDate == "OK") {
                let res = 1;
                NomOperateur = recupererNomOperateur();

                $.ajax({
                    type: 'POST',
                    url: 'php/write.php',
                    data: {
                        "userid": identifiant,
                        "poste": posteEnCours,
                        "ref": refEnCours,
                        "res": res,
                        "resQualite": VerifQuality,
                        "resReference": VerifReference,
                        "resDate": VerifDate,
                        "userName": NomOperateur
                    },
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
                    data: {
                        "userid": identifiant,
                        "poste": posteEnCours,
                        "ref": refEnCours,
                        "res": res,
                        "resQualite": VerifQuality,
                        "resReference": VerifReference,
                        "resDate": VerifDate,
                        "userName": NomOperateur
                    },
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
}

//procedure qui lance la fonction "envoiAvecDate" si la date est présente et "envoiSansDate" dans l'autre cas
function procedureEnvoi() {
    if (dateEnCours != "") {
        envoiAvecDate();
    } else {
        envoiSansDate();
    }
}

//Recuperer le nom utilisateur
function connectionUser() {
    utilisateurConnecter = recupererNomOperateur();
}

$(document).ready(function() {
    let recupPoste = sessionStorage.getItem('posteIdLocal');
    posteEnCours = recupPoste;
    $('#choixcontrole').on('hidden.bs.modal', function() {
        $.each(references, function(i, obj) {
            console.log(obj.id + ' ' + obj.reference);
            $('#piece' + (obj.id)).removeClass("active");
        });
    });


    $('#nok').click(function() {
        let res = 0;
        $.ajax({
            type: 'POST',
            url: 'php/write.php',
            data: {
                "userid": identifiant,
                "poste": posteEnCours,
                "ref": refEnCours,
                "res": res
            },
            success: function(data) {
                if (data.status = "ok") {
                    $("#success").show().delay(2000).fadeOut();
                    recupererDerniersCtrl();
                } else {
                    $("echec").show().delay(2000).fadeOut();
                    recupererDerniersCtrl();
                }
            },
        });
        recupererDerniersCtrl();
    });

    $('#ok').click(function() {
        let res = 1;
        $.ajax({
            type: 'POST',
            url: 'php/write.php',
            data: {
                "userid": identifiant,
                "poste": posteEnCours,
                "ref": refEnCours,
                "res": res
            },
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
    });
    choixPoste();


});

//Recupère le nom utilisateur dans le sessionStorage et l'affiche dans le modal
function getUserName() {
    var result = sessionStorage.getItem('userLocal');
    var elementUser = document.getElementById("nom_operateur");
    elementUser.value = result;

}