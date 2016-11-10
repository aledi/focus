'use strict';

function fillClientesSelect () {
    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'GET_CLIENTES'},
        dataType: 'json',
        success: function (response) {
            var currentHTML = '<option value="0"> Selecciona un cliente </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre + ' ' + result.apellidos;
                currentHTML += '</option>';
            }

            $('#clientes-filter-select').append(currentHTML);
        },
        error: function (error) {
            $('#feedback').html('Error cargando los clientes');
        }
    });
}

function fillPanelesSelect (cliente) {
    var clienteId = parseInt(cliente, 10);
    $('#paneles-filter-select').empty();

    if (clienteId === 0) {
        return;
    }

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_PANELES',
            'cliente': clienteId
        },
        dataType: 'json',
        success: function (response) {
            var currentHTML = '<option value="0"> Selecciona un panel </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre;
                currentHTML += '</option>';
            }

            $('#paneles-filter-select').append(currentHTML);
        },
        error: function (error) {
            $('#feedback').html('Error cargando los paneles');
        }
    });
}

function fillEncuestasSelect (panel) {
    var panelId = parseInt(panel, 10);
    $('#encuestas-filter-select').empty();

    if (panelId === 0) {
        return;
    }

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_ENCUESTAS',
            'panel': panelId
        },
        dataType: 'json',
        success: function (response) {
            var currentHTML = '<option value="0"> Selecciona una encuesta </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre;
                currentHTML += '</option>';
            }

            $('#encuestas-filter-select').append(currentHTML);
        },
        error: function (error) {
            $('#feedback').html('Error cargando las encuestas');
        }
    });
}
