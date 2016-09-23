'use strict';

var globalImages = [];
var globalVideo = [];

function appendSelect(lastQuestion){
    var currentHTML = '';
    for(var x = 0; x < globalImages.length; x++) {
        currentHTML += '<option value="' + globalImages[x] + '">' + globalImages[x] + '</option>';
    }

    $('#imagen' + lastQuestion).append(currentHTML);
    currentHTML = '';

    for(var x = 0; x < globalVideo.length; x++) {
        currentHTML += '<option value="' + globalVideo[x] + '">' + globalVideo[x] + '</option>';
    }

    $('#video' + lastQuestion).append(currentHTML);
}

$(document).on('ready', function () {
    var idEncuesta = window.location.search.substring(1);
    idEncuesta = idEncuesta.substring(3);


    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            action : 'GET_RECURSOS'
        },
        dataType: 'json',
        success: function (response) {
            console.log(response);
            var result = response.results;

            for (var x = 0; x < result.length; x++) {
                result[x].tipo == 1 ? globalImages.push(result[x].nombre) : globalVideo.push(result[x].nombre);
            }
            appendSelect(1);
        },
        error: function (error) {
            $('#feedback').html('Preguntas no añadidas. Ha ocurrido un error.');
        }
    });

    function appendAnswers (typeQuestion, questionID) {
        $('#Answers' + questionID).empty();

        if (typeQuestion != 1) {
            var currentHTML = '';
            for (var x = 1; x <= 10; x++) {
                currentHTML += '<div class="answer">';
                currentHTML += '<p>Opción ' + x + '</p>';
                currentHTML += '<input id="opcion' + x + '" class="respuesta' + x + '" name="respuesta' + questionID + '" type="text"/>';
                currentHTML += "</div>";
             }
        }

        $('#Answers' + questionID).append(currentHTML);
        currentHTML = '';
    }

    function appendQuestions (lastQuestion) {
        var currentHTML = '<div id="' + lastQuestion + '" class="questionForm">';
        currentHTML += '<hr>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Pregunta:</p>' +
            '<input id="pregunta" class="pregunta" name="respuesta" type="text" />' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Tipo de pregunta:</p>' +
            '<select id="tipo" class="tipoPregunta" name="respuesta" required>' +
            '<option value="1">Abiertas</option>' +
            '<option value="2">Selección Única</option>' +
            '<option value="3">Selección Múltiple</option>' +
            '<option value="4">Ordenamiento</option>' +
            '</select>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Imagen URL:</p>' +
            '<select id="imagen' + lastQuestion + '" class="imagen" name="respuesta" type="text">' +
            '<option value="">Selecciona una Imagen</option></select>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Video URL:</p>' +
            '<select id="video' + lastQuestion + '" class="video" name="respuesta" type="text">' +
            '<option value="">Selecciona un video</option></select>' +
            '</div>';
        currentHTML += '<div id="Answers' + lastQuestion + '"></div>' +
            '<button type="button" id="removeQuestion" class="no-background">Eliminar Pregunta</button>' +
            '</div>';
        
        $('#questions').append(currentHTML);
        appendSelect(lastQuestion);
        appendAnswers(1, lastQuestion);
    }

    if (idEncuesta !== '') {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action : 'GET_PREGUNTAS',
                encuesta : idEncuesta
            },
            dataType: 'json',
            success: function (response) {
                for (var x = 2; x <= response.results.length; x++) {
                    appendQuestions(x);
                }

                $('div#Answers1').empty();

                for (var x = 0; x < response.results.length; x++) {
                    var result = response.results[x];

                    $('#' + (x + 1) + ' > .input-wrapper > #pregunta').val(response.results[x].pregunta);
                    $('#' + (x + 1) + ' > .input-wrapper > #tipo').val(response.results[x].tipo);

                    appendAnswers(response.results[x].tipo, (x + 1));

                    $('#' + (x + 1) + ' > .input-wrapper > #imagen' + (x + 1)).val(response.results[x].imagen);
                    $('#' + (x + 1) + ' > .input-wrapper > #video' + (x + 1)).val(response.results[x].video);

                    if (response.results[x].tipo !== 1) {
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta1').val(response.results[x].op1);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta2').val(response.results[x].op2);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta3').val(response.results[x].op3);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta4').val(response.results[x].op4);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta5').val(response.results[x].op5);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta6').val(response.results[x].op6);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta7').val(response.results[x].op7);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta8').val(response.results[x].op8);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta9').val(response.results[x].op9);
                        $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta10').val(response.results[x].op10);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error llenando preguntas');
            }
        });
    }

    $(document).on('change', '.tipoPregunta', function () {
        var typeQuestion = $(this).val();
        var questionID = $(this).parent().parent().attr('id');
        var answersClass = "div#Answers" + questionID;

        appendAnswers(typeQuestion, questionID);
    });

    $('#addQuestion').on('click', function(){
        var lastQuestion = $('#questions').children().length;
        lastQuestion = parseInt(lastQuestion) + 1;

        appendQuestions(lastQuestion);
    });

    $('#questions').on('click', '#removeQuestion', function () {
        if ($(this).parent().attr('id') === 'questions') {
            return;
        }

        $(this).parent().remove();
    });

    $('#submitQuestions').on('click', function () {
        var numeroPregunta = 1;
        var questionsArray = [];
        var questionObject = {};
        questionObject.opciones = [];

        $('#questions').children().each(function () {
            questionObject.numPregunta = numeroPregunta;
            questionObject.pregunta = $(this).find('#pregunta').val();
            questionObject.tipo = $(this).find('#tipo').val();
            questionObject.imagen = $(this).find('.imagen').val();
            questionObject.video = $(this).find('.video').val();

            if (questionObject.tipo !== 1) {
                var opcion = 1;
                while ($(this).find('#opcion' + opcion).val()) {
                    questionObject.opciones.push($(this).find('#opcion' + opcion).val());
                    opcion++;
                }
            }

            questionsArray.push(questionObject);
            numeroPregunta++;
            questionObject = {};
            questionObject.opciones = [];
        });

        var idEncuesta = window.location.search.substring(1);
        idEncuesta = idEncuesta.substring(3);

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: {
                action : 'SET_PREGUNTAS_ENCUESTA',
                encuesta : idEncuesta,
                preguntas : questionsArray
            },
            dataType: 'json',
            success: function (response) {
                alert('Preguntas ligadas exitosamente.');
                location.replace('encuestas.php');
            },
            error: function (error) {
                $('#feedback').html('Preguntas no añadidas. Ha ocurrido un error.');
            }
        });
    });
});
