'use strict';

function convertEdoCivil(data){
    switch(data){
        case 0 :
            return 'Casado';
        case 1 :
            return 'Viudo';
        case 2 :
            return 'Divorciado';
        case 3 :
            return 'Separado';
        case 4 :
            return 'Soltero';
        case 5 :
            return 'Unión Libre';
        default :
            return 'ERROR';
    }
}

function convertGenero(data){
    switch(data){
        case 0 :
            return 'Masculino';
        case 1 :
            return 'Femenino';
    }
}

function convertMonth (mes) {
    switch (mes) {
        case 1:
            return 'Enero';
        case 2:
            return 'Febrero';
        case 3:
            return 'Marzo';
        case 4:
            return 'Abril';
        case 5:
            return 'Mayo';
        case 6:
            return 'Junio';
        case 7:
            return 'Julio';
        case 8:
            return 'Agosto';
        case 9:
            return 'Septiembre';
        case 10:
            return 'Octubre';
        case 11:
            return 'Noviembre';
        case 12:
            return 'Diciembre';
        default:
            break;
    }
}

function getMonthDays (mes, anio) {
    if (mes === 1 || mes === 3 || mes === 5 || mes === 7 || mes === 8 || mes === 10 || mes === 12) {
        return 31;
    } else if (mes === 2) {
        return (((anio % 4 === 0) && (anio % 100 !== 0)) || (anio % 400 === 0)) ? 29 : 28;
    }

    return 30;
}


$(document).on('ready', function () {
    $('ul.tabs li').click(function() {
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'VERIFY_SESSION'},
        dataType: 'json',
        success: function (obj) {
            if (obj.status == 'SUCCESS') {
                document.getElementsByTagName("html")[0].style.visibility = "visible";
            } else {
                window.location.replace('signin.php');
            }
        },
        error: function (error) {
            alert("Please login to continue");
            window.location.replace('signin.php');
        }
    });

    $('#signOutButton').on('click', function (event) {
        event.preventDefault();

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'LOG_OUT'},
            dataType: 'json',
            success: function (obj) {
                if (obj.status === "SUCCESS") {
                    alert("¡Hasta pronto!");
                    location.replace("signin.php");
                }
            }
        });
    });

    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    });
});
