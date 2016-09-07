'use strict';

$(document).on('ready', function () {
    setTimeout(function (event) {
        getEncuestas('reportes');
    }, 500);

    $('#preguntas-select').hide();
    $('#edad-select').hide();
    $('#genero-select').hide();
    $('#estado-select').hide();
    $('#educacion-select').hide();
    $('#filtros-button').hide();

    $('#reportes-encuestas-select').on('change', function () {
        var idEncuesta = parseInt($(this).val(), 10);
        $('#preguntas-select').empty();

        if (idEncuesta < 1) {
            $('#preguntas-select').hide();
            $('#edad-select').hide();
            $('#genero-select').hide();
            $('#estado-select').hide();
            $('#educacion-select').hide();
            $('#filtros-button').hide();

            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action : 'GET_PREGUNTAS',
                encuesta : idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                $('#preguntas-select').show();

                var currentHTML = '<option value="-1">Selecciona una pregunta</option>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    currentHTML += '<option value="' + result.numPregunta + '">' + result.pregunta + '</option>';
                }

                currentHTML += '<option value="0">General</option>';
                $('#preguntas-select').append(currentHTML);
            },
            error: function (errorMsg) {
                return;
            }
        });
    });

    $('#preguntas-select').on('change', function () {
        var numPregunta = parseInt($(this).val(), 10);
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();
        $('#filtros-button').hide();

        if (numPregunta < 0) {
            return;
        }

        var data = {
            action : 'REPORT_DATA',
            encuesta : parseInt($('#reportes-encuestas-select').val(), 10),
            numPregunta: numPregunta
        };

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: data,
            dataType: 'json',
            success: function (response) {
                // Show filter options with default values
                $('#edad-select').show();
                $('#edad-select').val('0');

                $('#genero-select').show();
                $('#genero-select').val('-1');

                $('#estado-select').show();
                $('#estado-select').val('0');

                $('#educacion-select').show();
                $('#educacion-select').val('0');

                $('#filtros-button').show();

                return;
            },
            error: function (errorMsg) {
                return;
            }
        });
    });

    $('#filtros-button').on('click', function () {
        var data = {
            action : 'REPORT_DATA',
            encuesta : parseInt($('#reportes-encuestas-select').val(), 10),
            numPregunta: parseInt($('#preguntas-select').val(), 10)
        };

        if (parseInt($('#edad-select').val(), 10) > 0) {
            data.edad = parseInt($('#edad-select').val(), 10);
        }

        if ($('#estado-select').val() !== '0') {
            data.estado = $('#estado-select').val();
        }

        if (parseInt($('#genero-select').val(), 10) > -1) {
            data.genero = parseInt($('#genero-select').val(), 10);
        }

        if (parseInt($('#educacion-select').val(), 10) > 0) {
            data.educacion = parseInt($('#educacion-select').val(), 10);
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: data,
            dataType: 'json',
            success: function (response) {
                return;
            },
            error: function (errorMsg) {
                return;
            }
        });
    });
});
