var logs = [{}];

var Chemin = "http://localhost/Projet_MEF";
let postes = [{}];
let references = [{}];
let controles = [{}];
let posteEnCours = "";
let refEnCours = "";
let identifiant = "1";

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
async function procedureChoixPoste() {
    resetLocalPoste();
    choixPoste();
}
async function lireRefs() {
    try {
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

function choixRef(r) {
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#piece' + (obj.id)).removeClass("active");
    });
    $("#piece" + r).addClass("active");
    refEnCours = r;
}
/*
function remplirDerniersCtrl() {
    let tableau = $('#tab_ctrl > tbody');
    tableau.html('');
    controles.map(controles => {
        tableau.append('<tr>');
        for (let prop in controles) {
            if (controles.hasOwnProperty(prop)) {
                if (controles[prop]) {
                    if (controles[prop] == 1) {
                        tableau.find('tr').last().append('<td>OK</td>');
                    } else {
                        tableau.find('tr').last().append('<td>' + controles[prop] + '</td>');
                    }
                } else {
                    tableau.find('tr').last().append('<td>NOK</td>');
                }
            }

        }
    });
}*/

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

function remplirRefs() {
    $("#listerefs").html('');
    $.each(references, function(i, obj) {
        console.log(obj.id + ' ' + obj.reference);
        $('#listerefs').append("<li data-toggle='modal' data-target='#choixcontrole' id='piece" + obj.id + "' onclick='choixRef(" + obj.id + ")' class='list-group-item'><figure class='figure'><img class='figure-img img-fluid rounded'  width='15%' height='50%' src='img/vis.png'><figcaption class='figure-caption'>" + obj.reference + "</figcaption></figure></li>");
    });
    recupererDerniersCtrl();
}

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