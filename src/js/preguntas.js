'use strict';

$(document).on('ready', function () {
    var idEncuesta = -1;
    idEncuesta = window.location.search.substring(1);
    idEncuesta = idEncuesta.substring(3);

    function appendAnswers (typeQuestion, questionID){
        if (typeQuestion !== 1) {
            var currentHTML = '';

            for (var x = 1; x <= 10; x++) {
                currentHTML += '<div class="answer">';
                currentHTML += '<p>Opción ' + x + '</p>';
                currentHTML += '<input id="opcion' + x + '" class="respuesta' + x + '" name="respuesta' + questionID + '" type="text"/>';
                currentHTML += "</div>";
             }
        }

        $("#Answers" + questionID).append(currentHTML);
    }

    function appendQuestions (lastQuestion) {
        var currentHTML = '<div id="' + lastQuestion + '" class="questionForm">';
        currentHTML += '<hr>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Pregunta '+ lastQuestion +' :</p>' +
            '<input id="pregunta" class="pregunta" name="respuesta'+lastQuestion+'" type="text"/>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Tipo de pregunta: </p>' +
            '<select id="tipo" class="tipoPregunta" name="respuesta'+lastQuestion+'" required>' +
            '<option value="1">Abiertas</option>' +
            '<option value="2">Selección Única</option>' +
            '<option value="3">Selección Múltiple</option>' +
            '<option value="4">Ordenamiento</option>' +
            '</select>' +
            '<p class="feedTypeQuestion"></p>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Imagen URL:</p>' +
            '<input id="imagen" class="imagen" name="respuesta'+lastQuestion+'" type="text"/>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Video URL:</p>' +
            '<input id="video" class="video" name="respuesta'+lastQuestion+'" type="text"/>' +
            '</div>';
        currentHTML += '<div id="Answers'+lastQuestion+'">' +
            '</div>' +
            '</div>';

        $("#questions").append(currentHTML);
        appendAnswers(1, lastQuestion);
    }

    if (idEncuesta != '') {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: {
                action : 'GET_PREGUNTAS',
                encuesta : idEncuesta
            },
            dataType: 'json',
            success: function (obj) {
                for (var x = 2; x <= obj.results.length; x++) {
                    appendQuestions(x);
                }

                $('div#Answers1').empty();

                for (var x = 0; x < obj.results.length; x++) {
                    var result = obj.results[x];

                    var typeQuestion = result.tipo;
                    var questionID = result.numPregunta;

                    $('input.pregunta[name=respuesta' + questionID + ']').val(result.pregunta);
                    $('select.tipoPregunta[name=respuesta' + questionID + ']').val(result.tipo);

                    appendAnswers(typeQuestion, questionID);

                    $('input.imagen[name=respuesta' + questionID + ']').val(result.imagen);
                    $('input.video[name=respuesta' + questionID + ']').val(result.video);

                    if (typeQuestion !== 1) {
                        $('input.respuesta1[name=respuesta' + questionID + ']').val(result.op1);
                        $('input.respuesta2[name=respuesta' + questionID + ']').val(result.op2);
                        $('input.respuesta3[name=respuesta' + questionID + ']').val(result.op3);
                        $('input.respuesta4[name=respuesta' + questionID + ']').val(result.op4);
                        $('input.respuesta5[name=respuesta' + questionID + ']').val(result.op5);
                        $('input.respuesta6[name=respuesta' + questionID + ']').val(result.op6);
                        $('input.respuesta7[name=respuesta' + questionID + ']').val(result.op7);
                        $('input.respuesta8[name=respuesta' + questionID + ']').val(result.op8);
                        $('input.respuesta9[name=respuesta' + questionID + ']').val(result.op9);
                        $('input.respuesta10[name=respuesta' + questionID + ']').val(result.op10);
                    }
                }
            },
            error: function (errorMsg) {
                alert('Error llenando preguntas');
            }
        });
    }

    $(document).on('change', '.tipoPregunta', function(){
        var typeQuestion = $(this).val();
        var currentHTML = ''; // ??????????
        var questionID = $(this).parent().parent().attr('id');
        var answersClass = "div#Answers" + questionID;

        $(this).parent().parent().find(answersClass).empty();

        appendAnswers(typeQuestion, questionID);

        currentHTML = ''; // ????????
    });

    $('#addQuestion').on('click', function () {
        var currentHTML = ''; // ?????????????
        var lastQuestion = $('#questions').children().length;
        lastQuestion = parseInt(lastQuestion) + 1;

        appendQuestions(lastQuestion);
    });

    $('#submitQuestions').on('click', function () {
        var iteration = 1;
        var numeroPregunta = 1;
        var nombrePregunta;
        var tipoPregunta;
        var imagenPregunta;
        var videoPregunta;
        var respuesta = 0;
        var questionsArray = [];
        var questionObject = {};
        questionObject.opciones = [];

        $('#questions').children().each(function () {
            questionObject.numPregunta = numeroPregunta;
            questionObject.pregunta = $(this).find('#pregunta').val();
            questionObject.tipo = $(this).find('#tipo').val();
            questionObject.imagen = $(this).find('#imagen').val();
            questionObject.video = $(this).find('#video').val();

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
                'action': 'SET_PREGUNTAS_ENCUESTA',
                'encuesta': idEncuesta,
                'preguntas': questionsArray
            },
            dataType: 'json',
            success: function (obj) {
                alert('Preguntas ligadas exitosamente.');
                location.replace('encuestas.php');
            },
            error: function (error) {
                $('#feedback').html('Preguntas no añadidas. Ha ocurrido un error.');
            }
        });
    })
});
