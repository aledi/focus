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

    $('#reportes-encuestas-select').on('change', function () {
        var idEncuesta = parseInt($(this).val(), 10);
        $('#preguntas-select').empty();

        if (idEncuesta < 1) {
            $('#preguntas-select').hide();
            $('#edad-select').hide();
            $('#genero-select').hide();
            $('#estado-select').hide();
            $('#educacion-select').hide();
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
                currentHTML += '<option value="0">General</option>';

                for (var i = 0; i < response.results.length; i++) {
                    var result = response.results[i];
                    currentHTML += '<option value="' + result.numPregunta + '">' + result.pregunta + '</option>';
                }

                $('#preguntas-select').append(currentHTML);
            },
            error: function (errorMsg) {

            }
        });
    });

    $('#preguntas-select').on('change', function () {
        var numPregunta = parseInt($(this).val(), 10);
        $('#edad-select').hide();
        $('#genero-select').hide();
        $('#estado-select').hide();
        $('#educacion-select').hide();

        if (numPregunta < 0) {
            return;
        }

        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action : 'REPORT_DATA',
                encuesta : parseInt($('#reportes-encuestas-select').val(), 10),
                numPregunta: numPregunta
            },
            dataType: 'json',
            success: function (response) {
                $('#edad-select').show();
                $('#genero-select').show();
                $('#estado-select').show();
                $('#educacion-select').show();
            },
            error: function (errorMsg) {

            }
        });
    });
});
