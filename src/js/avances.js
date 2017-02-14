'use strict';

var currentEncuesta = 0;

function getData () {
    if (currentEncuesta <= 0) {
        $('#refresh').hide();
        return;
    }

    $('#refresh').show();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            'action': 'CURRENT_ANSWERS',
            'encuesta': currentEncuesta
        },
        dataType: 'json',
        success: function (response) {
            var summaryHTLM = 'Respuestas: ' + response.respuestas + ' (' + (response.porcentaje * 100).toFixed(2) + '%)';
            summaryHTLM += '<br>';
            summaryHTLM += readableDate(response.fechaInicio) + ' - ' + readableDate(response.fechaFin) + ' (' + (response.dias < 0 ? 0 : response.dias) + ' días restantes)';
            $('#avance-summary').html(summaryHTLM);

            var currentHTML = '<thead>';
            currentHTML += '<tr>';
            currentHTML += '<th>Nombre</th>';
            currentHTML += '<th>Género</th>';
            currentHTML += '<th>Edad</th>';
            currentHTML += '<th>Educación</th>';
            currentHTML += '<th>Municipio</th>';
            currentHTML += '<th>Estado</th>';
            currentHTML += '<th>Inicio</th>';
            currentHTML += '<th>Fin</th>';
            currentHTML += '<th>Intento</th>';
            currentHTML += '<th>Remover</th>';
            currentHTML += '</tr>';
            currentHTML += '</thead>';
            currentHTML += '<tbody>';

            for (var i = 0; i < response.panelistas.length; i++) {
                var panelista = response.panelistas[i];

                currentHTML += '<tr id="' + panelista.idRespuesta + '&' + panelista.idRecord + '" class="' + (panelista.fechaFin ? '' : 'red') + '">';
                currentHTML += '<td>' + panelista.nombre + '</td>';
                currentHTML += '<td class="centered">' + convertGenero(panelista.genero) + '</td>';
                currentHTML += '<td class="centered">' + panelista.edad + '</td>';
                currentHTML += '<td>' + convertEducacion(panelista.educacion) + '</td>';
                currentHTML += '<td>' + panelista.municipio + '</td>';
                currentHTML += '<td class="centered">' + panelista.estado + '</td>';
                currentHTML += '<td>' + readableDate(panelista.fechaIni) + ' ' + validateHour(panelista.horaIni) + '</td>';
                currentHTML += '<td>' + readableDate(panelista.fechaFin) + ' ' + validateHour(panelista.horaFin) + '</td>';
                currentHTML += '<td class="deleteButton">' + (panelista.idRespuesta === -1 ? '' : '<button id="delete" type="button">Borrar Intento</button>') + '</td>';
                currentHTML += '<td class="removeButton"><button id="delete" type="button">Remover Panelista</button></td>';
                currentHTML += '</tr>';
            }

            currentHTML += '</tbody>';
            $('#avances-table').append(currentHTML);
        },
        error: function (errorMsg) {
            $('#selects-feedback').html('Error obteniendo panelistas');
        }
    });
}

$(document).on('ready', function () {
    $('#avances-header-option').addClass('selected');
    $('#clientes-filter-select').hide();
    $('#paneles-filter-select').hide();
    $('#encuestas-filter-select').hide();
    $('#refresh').hide();

    fillClientesSelect();

    $('#clientes-filter-select').on('change', function() {
        var value = parseInt($('#clientes-filter-select').val(), 10);

        $('#paneles-filter-select').hide();
        $('#encuestas-filter-select').hide();
        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');
        $('#refresh').hide();

        if (value > 0) {
            fillPanelesSelect(value);
        }
    });

    $('#paneles-filter-select').on('change', function() {
        var value = parseInt($('#paneles-filter-select').val(), 10);

        $('#encuestas-filter-select').hide();
        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');
        $('#refresh').hide();

        if (value > 0) {
            fillEncuestasSelect(value);
        }
    });

    $('#encuestas-filter-select').on('change', function() {
        currentEncuesta = parseInt($(this).val(), 10);

        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');

        getData();
    });

    $('#refresh').on('click', function() {
        $('#avances-table').empty();
        $('#avance-summary').empty();
        $('#selects-feedback').html('');

        getData();
    });

    // -----------------------------------------------------------------------------------------------
    // Delete/Remove
    // -----------------------------------------------------------------------------------------------

    $('#avances-table').on('click', '.deleteButton', function () {
        $('#feedback').html('');

        var self = this;
        var idVal = $(this).parent().attr('id').split('&');
        var idRespuesta = parseInt(idVal[0], 10);

        if (idRespuesta === -1) {
            return;
        }

        if (confirmDelete('este Intento')) {
            $.ajax({
                url: '../api/controller.php',
                type: 'POST',
                data: {
                    action: 'DELETE_ANSWER',
                    id: idRespuesta,
                },
                dataType: 'json',
                success: function (response) {
                    alert('Intento eliminado exitosamente.');

                    $('#avances-table').empty();
                    $('#avance-summary').empty();
                    $('#selects-feedback').html('');

                    getData();
                },
                error: function (errorMsg) {
                    alert('Error eliminando intento.');
                }
            });
        }
    });

    $('#avances-table').on('click', '.removeButton', function () {
        $('#feedback').html('');

        var self = this;
        var idVal = $(this).parent().attr('id').split('&');
        var idRecord = parseInt(idVal[1], 10);

        if (confirmDelete('este Panelista del Panel')) {
            $.ajax({
                url: '../api/controller.php',
                type: 'POST',
                data: {
                    action: 'DELETE_PANELISTA_EN_PANEL',
                    id: idRecord,
                },
                dataType: 'json',
                success: function (response) {
                    alert('Panelista removido exitosamente.');

                    $('#avances-table').empty();
                    $('#avance-summary').empty();
                    $('#selects-feedback').html('');

                    getData();
                },
                error: function (errorMsg) {
                    alert('Error removiendo panelista.');
                }
            });
        }
    });

});
