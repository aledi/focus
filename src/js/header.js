'use strict';

function convertEdoCivil (estadoCivil) {
    switch (estadoCivil) {
        case 0:
            return 'Casado';
        case 1:
            return 'Viudo';
        case 2:
            return 'Divorciado';
        case 3:
            return 'Separado';
        case 4:
            return 'Soltero';
        case 5:
            return 'Unión Libre';
        default:
            return 'ERROR';
    }
}

function convertGenero (genero) {
    switch (genero) {
        case 0:
            return 'Masculino';
        case 1:
            return 'Femenino';
        default:
            return '';
    }
}

function convertEducacion (educacion) {
    switch (educacion) {
        case 1:
            return 'Primaria';
        case 2:
            return 'Secundaria';
        case 3:
            return 'Preparatoria';
        case 4:
            return 'Profesional';
        case 5:
            return 'Posgrado';
        case 6:
            return 'Ninguno';
        default:
            return '';
    }
}

$(document).on('ready', function () {
    $('#panelistas-header-option').hide();
    $('#usuarios-header-option').hide();
    $('#paneles-header-option').hide();
    $('#encuestas-header-option').hide();
    $('#reportes-header-option').hide();
    $('#avances-header-option').hide();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'VERIFY_SESSION'},
        dataType: 'json',
        success: function (response) {
            if (response.status === 'SUCCESS') {
                document.getElementsByTagName('html')[0].style.visibility = 'visible';

                if (response.tipo !== 1) {
                    $('#panelistas-header-option').show();
                    $('#usuarios-header-option').show();
                    $('#paneles-header-option').show();
                    $('#encuestas-header-option').show();
                    $('#reportes-header-option').show();
                    $('#avances-header-option').show();
                }
            } else {
                window.location.replace('signin.php');
            }
        },
        error: function (error) {
            alert('Please login to continue');
            window.location.replace('signin.php');
        }
    });

    $('ul.tabs li').click(function () {
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $('#' + tab_id).addClass('current');
    });

    $('#signout-button').on('click', function (event) {
        event.preventDefault();

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {'action': 'LOG_OUT'},
            dataType: 'json',
            success: function (obj) {
                if (obj.status === 'SUCCESS') {
                    alert('¡Hasta pronto!');
                    location.replace('signin.php');
                }
            }
        });
    });

    $('ul.tabs li').click(function () {
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $('#' + tab_id).addClass('current');
    });
});
