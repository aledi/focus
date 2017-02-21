'use strict';

function fillClientesSelect () {
    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {'action': 'GET_CLIENTES'},
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#selects-feedback').html('No hay clientes disponibles');
                return;
            }

            var currentHTML = '';

            if (response.cliente == 1) {
                var result = response.results[0];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre + ' ' + result.apellidos;
                currentHTML += '</option>';
            } else {
                currentHTML = '<option value="0"> Selecciona un cliente </option>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];

                    currentHTML += '<option value="' + result.id + '">';
                    currentHTML += result.nombre + ' ' + result.apellidos;
                    currentHTML += '</option>';
                }
            }

            $('#clientes-filter-select').append(currentHTML);
            $('#clientes-filter-select').show();
            $('#clientes-filter-select').trigger('change');
        },
        error: function (error) {
            $('#selects-feedback').html('Error cargando los clientes');
        }
    });
}

function fillPanelesSelect (clienteId) {
    $('#paneles-filter-select').empty();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_PANELES',
            'cliente': clienteId
        },
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#selects-feedback').html('No hay paneles disponibles');
                return;
            }

            var currentHTML = '<option value="0"> Selecciona un panel </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre;
                currentHTML += '</option>';
            }

            $('#paneles-filter-select').append(currentHTML);
            $('#paneles-filter-select').show();
        },
        error: function (error) {
            $('#selects-feedback').html('Error cargando los paneles');
        }
    });
}

function fillEncuestasSelect (panelId) {
    $('#encuestas-filter-select').empty();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'GET_ENCUESTAS',
            'panel': panelId
        },
        dataType: 'json',
        success: function (response) {
            if (response.results.length === 0) {
                $('#selects-feedback').html('No hay encuestas disponibles');
                return;
            }

            var currentHTML = '<option value="0"> Selecciona una encuesta </option>';

            for (var i = 0; i < response.results.length; i++) {
                var result = response.results[i];

                currentHTML += '<option value="' + result.id + '">';
                currentHTML += result.nombre;
                currentHTML += '</option>';
            }

            $('#encuestas-filter-select').append(currentHTML)
            $('#encuestas-filter-select').show();
        },
        error: function (error) {
            $('#selects-feedback').html('Error cargando las encuestas');
            return false;
        }
    });
}
