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
