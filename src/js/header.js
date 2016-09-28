'use strict';

$(document).on('ready', function () {
    $('#panelistas-header-option').hide();
    $('#usuarios-header-option').hide();
    $('#paneles-header-option').hide();
    $('#encuestas-header-option').hide();
    $('#recursos-header-option').hide();
    $('#avances-header-option').hide();
    document.getElementsByTagName('html')[0].style.visibility = 'hidden';

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {action: 'VERIFY_SESSION'},
        dataType: 'json',
        success: function (response) {
            if (response.status === 'SUCCESS') {
                if (response.tipo !== 1) {
                    $('#panelistas-header-option').show();
                    $('#usuarios-header-option').show();
                    $('#paneles-header-option').show();
                    $('#encuestas-header-option').show();
                    $('#recursos-header-option').show();
                    $('#avances-header-option').show();
                    document.getElementsByTagName('html')[0].style.visibility = 'visible';
                } else {
                    // Check if user tried to load another page and not reportes
                    if (window.location.pathname !== '/focus/src/reportes.php') {
                        // Redirect to reportes & do not show html yet to avoid flashing
                        window.location.replace('reportes.php');
                    } else {
                        document.getElementsByTagName('html')[0].style.visibility = 'visible';
                    }
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
        var tabId = $(this).attr('data-tab');

        // Make sure we clear query every time we go to view all section
        if (tabId.search('view') !== -1 && window.location.search) {
            history.pushState({}, null, window.location.href.split('?')[0]);
        }

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $('#' + tabId).addClass('current');
    });

    $('#signout-button').on('click', function (event) {
        event.preventDefault();

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {action: 'LOG_OUT'},
            dataType: 'json',
            success: function (obj) {
                if (obj.status === 'SUCCESS') {
                    alert('¡Hasta pronto!');
                    location.replace('signin.php');
                }
            }
        });
    });
});

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
            return '';
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
            return 'Preparatoria o Técnica';
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
