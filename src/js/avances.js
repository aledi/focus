'use strict';

$(document).on('ready', function () {
    setTimeout(function (event) {
        getEncuestas('avances');
    }, 500);

    $('#encuestas-select').on('change', function () {
        var idEncuesta = parseInt($(this).val(), 10);
        $('#avances-table-body').empty();

        if (idEncuesta < 1) {
            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                'action': 'CURRENT_ANSWERS',
                'encuesta': idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                $('#avance-percentage').html('Avance: ' + (response.porcentaje * 100) + '%');
                $('#avance-panelistas').html('Respuestas: ' + response.respuestas);

                var currentHTML = '';
                for (var i = 0; i < response.panelistas.length; i++) {
                    var panelista = response.panelistas[i];
                    if (panelista.fecha) {
                        var date = panelista.fecha.split('-');
                        var formattedDate = date[2] + ' de ' + convertMonth(parseInt(date[1], 10)) + ', ' + date[0];
                    }

                    currentHTML += '<tr>';
                    currentHTML += '<td>' + panelista.nombre + '</td>';
                    currentHTML += '<td>' + convertGenero(panelista.genero) + '</td>';
                    currentHTML += '<td>' + panelista.edad + '</td>';
                    currentHTML += '<td>' + convertEducacion(panelista.educacion) + '</td>';
                    currentHTML += '<td>' + panelista.municipio + '</td>';
                    currentHTML += '<td>' + panelista.estado + '</td>';
                    currentHTML += '<td>' + (panelista.fecha ? formattedDate : '') + '</td>';
                    currentHTML += '<td>' + panelista.hora + '</td>';
                    currentHTML += '</tr>';
                }

                $('#avances-table-body').append(currentHTML);
            },
            error: function (errorMsg) {
                alert('Error obteniendo panelistas.');
            }
        });
    });
});
