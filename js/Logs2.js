var logs = [{}];

var Chemin = "http://localhost/Projet_MEF";
let postes = [{}];
let references = [{}];
let controles = [{}];
let postesInactif = [{}];
let posteEnCours = "";
let refEnCours = "";
let identifiant = "1";
let dateCtrl = new Date();

//Procédure qui recupère les postes grâce a une requete php et qui avec la fonction "remplirTableau()" affiche les poste sur la page
async function lirePostes() {
    try {
        let req = await fetch('php/postes.php'); //requete pour recuperer les postes
        let json = await req.json();
        if (json.length) {
            postes = json;
            remplirTableau();
        }

    } catch (err) {
        console.log(err);
    }
}

async function procedureChoixPoste() {
    resetLocalPoste();
    choixPoste();
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

//Requete php pour recuperer les postes qui n'ont pas emis de controle depuis plus de 3h
async function getPosteInactif() {
    try {
        let req = await fetch('php/verifPostes.php');
        let json = await req.json();
        if (json) {
            console.log('ça marche !');
            postesInactif = json;
            afficherPosteInactif();
        } else {
            console.log("ça bug !");
            let items = document.getElementsByClassName("list-group-item");

            for (i = 0; i < items.length; i++) {
                items[i].setAttribute('style', 'background-color:white;');
            }
        }
    } catch (err) {
        console.log(err);
    }
}

function afficherPosteInactif() {
    let items = document.getElementsByClassName("list-group-item");

    for (i = 0; i < items.length; i++) {
        items[i].setAttribute('style', 'background-color:white;');
    }
    $.each(postesInactif, function(i, obj) {
        // $("#" + obj.poste + "").html('');
        let nomObj = document.getElementById(obj.poste);
        nomObj.setAttribute('style', 'background-color:red;');

    });
}

//Recupère grâce a une requete php les 10 derniers controles effectuer et avec la fonction "remplirDerniersCtrl()" les affiches sur la page
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

//Procédure qui permet d'afficher les references sur la page
function choixRef(r) {
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#piece' + (obj.id)).removeClass("active");
    });
    $("#piece" + r).addClass("active");
    refEnCours = r;
}

//Fonction qui va afficher les derniers controles sur la page en forme de tableau
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
                    tableau.find('tr').last().append('<td style="background-color:red;"><a href="" target="" style="color:white;font-weight:bold;">NOK</a ></td > ');
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
        $('#listerefs').append("<li data-toggle='modal' data-target='#choixcontrole' id='piece" + obj.id + "' onclick='choixRef(" + obj.id + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='15%' height='50%' src='img/vis.png'><figcaption class='figure-caption'>" + obj.reference + "</figcaption></figure></li>");
    });
    recupererDerniersCtrl();
}

//Procédure qui après la selection du poste va afficher les references
function choixPoste(p) {
    posteEnCours = postes[p].id
    $("#content").html('');
    $("#poste").html(postes[p].poste);
    $("#titre").html("");
    $("#content").append("<div class='jumbotron' id='titres_main'></div>");
    $("#titres_main").append("<h1 class='text-center display-4'>MEF Ferrage historique conformité</h1><br />");
    $("#titres_main").append("<div class='jumbotron'><div class='row col-md-10 mx-auto p-4'><table id='tab_ctrl' class='table table-responsive-md table-striped table-bordered table-active text-center'></table></div></div>");
    $("#tab_ctrl").append("<thead><tr><th>Date/heure</th><th>Identifiant</th><th>Poste</th><th>Référence</th></th><th>Etat</th></tr></thead><tbody></tbody>");
    //lireRefs();
    recupererDerniersCtrl();
}

//Fonction qui affiche les differents postes sous forme de tableau 
function remplirTableau() {
    $("#listepostes").html('');
    $.each(postes, function(i, obj) {
        console.log(obj.id + ' ' + obj.poste);
        if (i < 6) {
            $('#listepostes').append("<li onclick='choixPoste(" + i + ")' id='" + obj.poste + "' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 5 && i < 12) {
            $('#content').append("<ul id='listepostes2' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes2').append("<li onclick='choixPoste(" + i + ")' id='" + obj.poste + "' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 11 && i < 17) {
            $('#content').append("<ul id='listepostes3' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes3').append("<li onclick='choixPoste(" + i + ")' id='" + obj.poste + "' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 16 && i < 22) {
            $('#content').append("<ul id='listepostes4' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes4').append("<li onclick='choixPoste(" + i + ")' id='" + obj.poste + "' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 21 && i < 27) {
            $('#content').append("<ul id='listepostes5' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes5').append("<li onclick='choixPoste(" + i + ")' id='" + obj.poste + "' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }
        if (i > 26) {
            $('#content').append("<ul id='listepostes6' class='list-group list-group-horizontal justify-content-center'></ul>");
            $('#listepostes6').append("<li onclick='choixPoste(" + i + ")' id='" + obj.poste + "' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='25%' height='100%' src='img/pc.svg'><figcaption class='figure-caption'>" + obj.poste + "</figcaption></figure></li>");
        }

    });
}

$(document).ready(function() {
    $.ajax({
        type: 'POST',
        url: 'php/read.php',
        data: "read=y",
        success: function(data) {
            logs = data;
            remplirLogs(logs);
        }
    });
});

//Procédure qui affiche les derniers controles
function remplirLogs(log) {
    let tableau = $('#tab_logs > tbody');
    tableau.html('');
    log.map(log => {
        tableau.append('<tr>');
        for (var i = 0, l = log.length; i < l; i++) {
            if (log[i])
                tableau.find('tr').last().append('<td>' + log[i] + '</td>');
            else
                tableau.find('tr').last().append('<td> - </td>');
        }
    });
}