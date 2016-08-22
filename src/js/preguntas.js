'use strict';

$(document).on('ready', function () {
    var idEncuesta = -1;
    idEncuesta = window.location.search.substring(1)
    idEncuesta = idEncuesta.substring(3);

    function appendAnswers(typeQuestion, questionID){
        if (typeQuestion != 1) {
            var currentHTML = '';

            for (var x = 1; x <= 10; x++) {
                currentHTML += '<div class="answer">';
                currentHTML += '<p>Opción ' + x + '</p>';
                currentHTML += '<input class="respuesta' + x + '" name="respuesta' + questionID + '" type="text"/>';
                currentHTML += "</div>";
             }
        }

        $("#Answers" + questionID).append(currentHTML);
    }

    function appendQuestions (lastQuestion) {
        var currentHTML = '<div id="' + lastQuestion + '" class="questionForm">';
        currentHTML += '<hr>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Pregunta:</p>' +
            '<input class="pregunta" name="respuesta'+lastQuestion+'" type="text"/>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Tipo de pregunta: </p>' +
            '<select class="tipoPregunta" name="respuesta'+lastQuestion+'" required>' +
            '<option value="1">Abiertas</option>' +
            '<option value="2">Selección Única</option>' +
            '<option value="3">Selección Múltiple</option>' +
            '<option value="4">Ordenamiento</option>' +
            '</select>' +
            '<p class="feedTypeQuestion"></p>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Imagen URL:</p>' +
            '<input class="imagen" name="respuesta'+lastQuestion+'" type="text"/>' +
            '</div>';
        currentHTML += '<div class="input-wrapper">' +
            '<p>Video URL:</p>' +
            '<input class="video" name="respuesta'+lastQuestion+'" type="text"/>' +
            '</div>';
        currentHTML += '<div id="Answers'+lastQuestion+'">' +
            '</div>' +
            '<div class="feedback"></div>' +
            '<div class="button"><button type="submit" class="removerPregunta">Remover Pregunta</button></div>' +
            '</div>';

        $("#questions").append(currentHTML);
        appendAnswers(1, lastQuestion);
    }

    if (idEncuesta != '') {
        $.ajax({
            url: "../api/controller.php",
            type: "POST",
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

                    $('input.pregunta[name=respuesta' + questionID + ']').val(obj.results[x].pregunta);
                    $('select.tipoPregunta[name=respuesta' + questionID + ']').val(obj.results[x].tipo);

                    appendAnswers(typeQuestion, questionID);

                    $('input.imagen[name=respuesta' + questionID + ']').val(obj.results[x].imagen);
                    $('input.video[name=respuesta' + questionID + ']').val(obj.results[x].video);

                    if (typeQuestion == 1) {
                        $('textarea.respuesta' + questionID + '[name=respuesta' + questionID + ']').val(obj.results[x].op1);
                    } else {
                        $('input.respuesta1[name=respuesta' + questionID +']').val(obj.results[x].op1);
                        $('input.respuesta2[name=respuesta' + questionID +']').val(obj.results[x].op2);
                        $('input.respuesta3[name=respuesta' + questionID +']').val(obj.results[x].op3);
                        $('input.respuesta4[name=respuesta' + questionID +']').val(obj.results[x].op4);
                        $('input.respuesta5[name=respuesta' + questionID +']').val(obj.results[x].op5);
                        $('input.respuesta6[name=respuesta' + questionID +']').val(obj.results[x].op6);
                        $('input.respuesta7[name=respuesta' + questionID +']').val(obj.results[x].op7);
                        $('input.respuesta8[name=respuesta' + questionID +']').val(obj.results[x].op8);
                        $('input.respuesta9[name=respuesta' + questionID +']').val(obj.results[x].op9);
                        $('input.respuesta10[name=respuesta' + questionID +']').val(obj.results[x].op10);
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
        var currentHTML = ''; // ??????????
        var questionID = $(this).parent().parent().attr('id');
        var answersClass = "div#Answers" + questionID;

        $(this).parent().parent().find(answersClass).empty();

        appendAnswers(typeQuestion, questionID);

        currentHTML = ''; // ????????
    });

    $("#addQuestion").on("click", function(){
        var currentHTML = ''; // ?????????????
        var lastQuestion = $("#questions").children().length;
        lastQuestion = parseInt(lastQuestion) + 1;

        appendQuestions(lastQuestion);
    });

    $('#questions').on('click','.removerPregunta', function(){
        $(this).parent().parent().remove();
    });

    $('#submitQuestions').on('click', function(){
        var iteration = 1;
        var numeroPregunta = 1;
        var nombrePregunta;
        var tipoPregunta;
        var imagenPregunta;
        var videoPregunta;
        var respuesta = 0;
        var questionsArray = [];
        var questionObject = {};

        $('#questions').children().each(function () {
            // "this" is the current element in the loop
            $('[name=respuesta'+numeroPregunta+']').each(function() {
                if (iteration === 1) {
                    questionObject.numPregunta = numeroPregunta;
                    questionObject.pregunta = $(this).val();
                } else if(iteration === 2) {
                    questionObject.tipo = $(this).val();
                } else if(iteration === 3) {
                    questionObject.imagen = $(this).val();
                } else if(iteration === 4) {
                    questionObject.video = $(this).val();
                } else if(iteration === 5) {
                    questionObject.op1 = $(this).val();
                } else if(iteration === 6) {
                    questionObject.op2 = $(this).val();
                } else if(iteration === 7) {
                    questionObject.op3 = $(this).val();
                } else if(iteration === 8) {
                    questionObject.op4 = $(this).val();
                } else if(iteration === 9) {
                    questionObject.op5 = $(this).val();
                } else if(iteration === 10) {
                    questionObject.op6 = $(this).val();
                } else if(iteration === 11) {
                    questionObject.op7 = $(this).val();
                } else if(iteration === 12) {
                    questionObject.op8 = $(this).val();
                } else if(iteration === 13) {
                    questionObject.op9 = $(this).val();
                } else if(iteration === 14) {
                    questionObject.op10 = $(this).val();
                }

                iteration++;
            });

            if (questionObject.tipo == 1) {
                questionObject.op2 = '';
                questionObject.op3 = '';
                questionObject.op4 = '';
                questionObject.op5 = '';
                questionObject.op6 = '';
                questionObject.op7 = '';
                questionObject.op8 = '';
                questionObject.op9 = '';
                questionObject.op10 = '';
            }

            iteration = 1;
            questionsArray.push(questionObject);
            numeroPregunta++;
            questionObject = {};
        });

        var idEncuesta = window.location.search.substring(1)
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
                alert("Preguntas ligadas exitosamente.");
                location.replace('encuestas.php');
            },
            error: function (error) {
                $('#feedback').html("Preguntas no añadidas, ha ocurrido un error.");
            }
        });
    });

});
