'use strict';

$(document).on('ready', function () {
    var idEncuesta = -1;
    idEncuesta = window.location.search.substring(1)
    idEncuesta = idEncuesta.substring(3);

    function appendAnswers(typeQuestion, questionID){
        $("#Answers" + questionID).empty();
        if (typeQuestion != 1) {
            var currentHTML = '';
            for (var x = 1; x <= 10; x++) {
                currentHTML += '<div class="answer">';
                currentHTML += '<p>Opción ' + x + '</p>';
                currentHTML += '<input id="opcion' + x + '" class="respuesta' + x + '" name="respuesta' + questionID + '" type="text"/>';
                currentHTML += "</div>";
             }
        }

        $("#Answers" + questionID).append(currentHTML);
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
            '<input id="imagen" class="imagen" name="respuesta" type="text" />' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Video URL:</p>' +
            '<input id="video" class="video" name="respuesta" type="text"/>' +
            '</div>';
        currentHTML += '<div id="Answers'+lastQuestion+'"></div>' +
            '<button type="button" id="removeQuestion" class="no-background">Eliminar Pregunta</button>' +
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
            dataType: "json",
            success: function(obj){
                for (var x = 2; x <= obj.results.length; x++) {
                    appendQuestions(x);
                }

                $('div#Answers1').empty();

                for (var x = 0; x < obj.results.length; x++) {
                    var typeQuestion = obj.results[x].tipo;
                    var questionID = obj.results[x].numPregunta;

                    $('input.pregunta[name=respuesta]').val(obj.results[x].pregunta);
                    $('select.tipoPregunta[name=respuesta]').val(obj.results[x].tipo);

                    appendAnswers(typeQuestion, questionID);

                    $('input.imagen[name=respuesta]').val(obj.results[x].imagen);
                    $('input.video[name=respuesta]').val(obj.results[x].video);

                    if (typeQuestion !== 1) {
                        $('input.respuesta1[name=respuesta]').val(obj.results[x].op1);
                        $('input.respuesta2[name=respuesta]').val(obj.results[x].op2);
                        $('input.respuesta3[name=respuesta]').val(obj.results[x].op3);
                        $('input.respuesta4[name=respuesta]').val(obj.results[x].op4);
                        $('input.respuesta5[name=respuesta]').val(obj.results[x].op5);
                        $('input.respuesta6[name=respuesta]').val(obj.results[x].op6);
                        $('input.respuesta7[name=respuesta]').val(obj.results[x].op7);
                        $('input.respuesta8[name=respuesta]').val(obj.results[x].op8);
                        $('input.respuesta9[name=respuesta]').val(obj.results[x].op9);
                        $('input.respuesta10[name=respuesta]').val(obj.results[x].op10);
                    }
                }
            },
            error: function (errorMsg) {
                alert("Error llenando preguntas");
            }
        });
    }

    $(document).on("change", ".tipoPregunta", function(){
        var typeQuestion = $(this).val();
        var questionID = $(this).parent().parent().attr('id');
        var answersClass = "div#Answers" + questionID;

        appendAnswers(typeQuestion, questionID);
    });

    $("#addQuestion").on("click", function(){
        var lastQuestion = $("#questions").children().length;
        lastQuestion = parseInt(lastQuestion) + 1;

        appendQuestions(lastQuestion);
    });

    $('#questions').on('click','#removeQuestion', function(){
        if ($(this).parent().attr('id') != 'questions')
            $(this).parent().remove();
    });

    $('#submitQuestions').on('click', function(){
        var numeroPregunta = 1;
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
                $('#feedback').html('Preguntas no añadidas, ha ocurrido un error.');
            }
        });
    });
});
