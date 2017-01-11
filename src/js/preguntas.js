'use strict';

var globalImages = [];
var globalVideo = [];

// -----------------------------------------------------------------------------------------------
// Helper Functions
// -----------------------------------------------------------------------------------------------

function appendSelect (lastQuestion) {
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

function appendAnswers (typeQuestion, questionID) {
    var currentHTML = '';

    $('#Answers' + questionID).empty();

    if (typeQuestion != 1 && typeQuestion != 6) {
        if (typeQuestion == 2) {
            currentHTML += '<div class="input-wrapper">';
            currentHTML += '<label>Mostrar como</label>';
            currentHTML += '<input type="radio" value="0" name="combo' + questionID + '" checked="checked"> Lista </input>';
            currentHTML += '<input type="radio" value="1" name="combo' + questionID + '"> Combo </input>';
            currentHTML += '</div>';
        }

        for (var x = 1; x <= 20; x++) {
            currentHTML += '<div class="input-wrapper answer">';
            currentHTML += '<label>Opción ' + x + '</label>';
            currentHTML += '<input id="opcion' + x + '" class="respuesta' + x + ' full-width" type="text"/>';
            currentHTML += '</div>';
        }

        if (typeQuestion == 5) {
            for (var x = 1; x <= 20; x++) {
                currentHTML += '<div class="input-wrapper answer">';
                currentHTML += '<label>Subpregunta ' + x + '</label>';
                currentHTML += '<input id="subpregunta' + x + '" class="subpregunta' + x + ' full-width" type="text"/>';
                currentHTML += '</div>';
            }
         }
    } else if (typeQuestion == 6) {
        currentHTML += '<div class="input-wrapper answer">';
        currentHTML += '<label>Escala</label>';
        currentHTML += '<input class="respuesta1 required-input" id="opcion1" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>';
        currentHTML += ' - ';
        currentHTML += '<input class="respuesta2 required-input" id="opcion2" type="text" onkeypress="return event.charCode >= 48 && event.charCode <= 57"/>';
        currentHTML += '</div>';
    }

    $('#Answers' + questionID).append(currentHTML);
    currentHTML = '';
}

function appendQuestions (lastQuestion) {
    var currentHTML = '<div id="' + lastQuestion + '" class="questionForm">';
    currentHTML += '<hr>';
    currentHTML += '<div class="input-wrapper">' +
        '<label>Título</label>' +
        '<input id="titulo" class="titulo full-width" type="text" />' +
        '</div>';
    currentHTML += '<div class="input-wrapper">' +
        '<label>Imagen</label>' +
        '<div class="preview-resource-image">' +
        '<select id="imagen' + lastQuestion + '" class="imagen" type="text">' +
        '<option value="">Selecciona una Imagen</option></select>' +
        '<label class="preview"><a class="preview-link">Vista Previa</a></label>' +
        '</div>' +
        '</div>';
    currentHTML += '<div class="input-wrapper">' +
        '<label>Video</label>' +
        '<div class="preview-resource-video">' +
        '<select id="video' + lastQuestion + '" class="video" type="text">' +
        '<option value="">Selecciona un video</option></select>' +
        '<label class="preview"><a class="preview-link">Vista Previa</a></label>' +
        '</div>' +
        '</div>';
    currentHTML += '<div class="input-wrapper">' +
        '<label>Pregunta</label>' +
        '<input id="pregunta" class="pregunta full-width" type="text" />' +
        '</div>';
    currentHTML += '<div class="input-wrapper">' +
        '<label>Tipo de pregunta</label>' +
        '<select id="tipo" class="tipoPregunta" required>' +
        '<option value="1">Abiertas</option>' +
        '<option value="2">Selección Única</option>' +
        '<option value="3">Selección Múltiple</option>' +
        '<option value="4">Ordenamiento</option>' +
        '<option value="5">Matriz</option>' +
        '<option value="6">Escala</option>' +
        '</select>' +
        '</div>';
    currentHTML += '<div id="Answers' + lastQuestion + '"></div>' +
        '<button type="button" id="removeQuestion" class="no-background">Eliminar Pregunta</button>' +
        '</div>';

    $('#questions').append(currentHTML);
    appendSelect(lastQuestion);
    appendAnswers(1, lastQuestion);
}

// -----------------------------------------------------------------------------------------------
// Fetch Recursos and Questions, if needed
// -----------------------------------------------------------------------------------------------

$(document).on('ready', function () {
    var idEncuesta = window.location.search.substring(1);
    var dataToSend = { action : 'GET_PREGUNTAS' };

    if (idEncuesta.includes('parentid')) {
        var idArray = idEncuesta.split('?');
        var parentidEncuesta = idArray[1].substring(9);
        idEncuesta = idArray[0].substring(3);
        dataToSend.encuesta = parentidEncuesta;
    }
    else {
        idEncuesta = idEncuesta.substring(3);
        dataToSend.encuesta = idEncuesta;
    }

    idEncuesta = idEncuesta.substring(3);

    $('#imagen1').parent().find('label').hide();
    $('#video1').parent().find('label').hide();

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: {
            action : 'GET_RECURSOS'
        },
        dataType: 'json',
        success: function (response) {
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

    if (idEncuesta !== '') {
        $.ajax({
            url: '../api/controller.php',
            type: 'POST',
            data: dataToSend,
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
                    $('#' + (x + 1) + ' > .input-wrapper > #titulo').val(response.results[x].titulo);

                    appendAnswers(response.results[x].tipo, (x + 1));

                    if (response.results[x].imagen == "") {
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-image > .preview').hide();
                    } else{
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-image > .preview').show();
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-image > .preview > .preview-link').attr('href','../resources/images/' + response.results[x].imagen);
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-image > .preview > .preview-link').attr('target','_blank');
                    }

                    $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-image > #imagen' + (x + 1)).val(response.results[x].imagen);

                    if (response.results[x].video == "") {
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-video > .preview').hide();
                    } else{
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-video > .preview').show();
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-video > .preview > .preview-link').attr('href','../resources/videos/' + response.results[x].video);
                        $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-video > .preview > .preview-link').attr('target','_blank');
                    }

                    $('#' + (x + 1) + ' > .input-wrapper > .preview-resource-video > #video' + (x + 1)).val(response.results[x].video);

                    if (response.results[x].tipo !== 1) {
                        var opciones = response.results[x].opciones;
                        var subPreguntas = response.results[x].subPreguntas;
                        var comboRadio = $('input[name="combo' + (x + 1) + '"][value="' + response.results[x].combo + '"]')

                        if (comboRadio) {
                            comboRadio.prop('checked', true);
                        }

                        for (var i = 0; i < opciones.length; i++) {
                            $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .respuesta' + (i + 1)).val(opciones[i]);
                        }

                        if (response.results[x].tipo == 5) {
                            for (var i = 0; i < subPreguntas.length; i++) {
                                $('#' + (x + 1) + ' > #Answers' + (x + 1) + ' > .answer > .subpregunta' + (i + 1)).val(subPreguntas[i]);
                            }
                        }
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
        var answersClass = 'div#Answers' + questionID;

        appendAnswers(typeQuestion, questionID);
    });

    $('#addQuestion').on('click', function() {
        var lastQuestion = $('#questions').children().length;
        lastQuestion = parseInt(lastQuestion) + 1;

        appendQuestions(lastQuestion);

        $('#imagen' + lastQuestion).parent().find('label').hide();
        $('#video' + lastQuestion).parent().find('label').hide();
    });

    $('#questions').on('click', '#removeQuestion', function () {
        if (confirmDelete('esta Pregunta')) {
            if ($(this).parent().attr('id') === 'questions') {
                return;
            }

            $(this).parent().remove();
        }
    });

    $('#questions').on('change','.imagen', function (){
        var currentValueImage = $(this).val();
        if(currentValueImage == ""){
            $(this).parent().find('label').hide();
        }
        else {
            $(this).parent().find('label').show();
            $(this).parent().find('.preview-link').attr('href','../resources/images/' + currentValueImage);
            $(this).parent().find('.preview-link').attr('target','_blank');
        }
    });

    $('#questions').on('change','.video', function (){
        var currentValueVideo = $(this).val();

        if(currentValueVideo == ""){
            $(this).parent().find('label').hide();
        }
        else {
            $(this).parent().find('label').show();
            $(this).parent().find('.preview-link').attr('href','../resources/videos/' + currentValueVideo);
            $(this).parent().find('.preview-link').attr('target','_blank');
        }
    });


    $('#submitQuestions').on('click', function () {
        var numeroPregunta = 1;
        var questionsArray = [];
        var questionObject = {};
        var questionValidated = true;
        questionObject.opciones = [];
        questionObject.subPreguntas = [];

        $('#questions').children().each(function () {
            questionObject.numPregunta = numeroPregunta;
            questionObject.titulo = $(this).find('#titulo').val();
            questionObject.imagen = $(this).find('.imagen').val();
            questionObject.video = $(this).find('.video').val();
            questionObject.pregunta = $(this).find('#pregunta').val();
            questionObject.tipo = $(this).find('#tipo').val();

            if (questionObject.tipo == 6) {
                if (parseInt($(this).find('#opcion1').val()) == 0 || parseInt($(this).find('#opcion2').val()) == 0) {
                    alert("Los valores de la pregunta escala #" + questionObject.numPregunta + " deben ser mayor a cero.");
                    questionValidated = false;
                } else if (parseInt($(this).find('#opcion1').val()) >= parseInt($(this).find('#opcion2').val())) {
                    alert("El valor inicial de la escala de la pregunta #" + questionObject.numPregunta + " deben ser menor al valor final.");
                    questionValidated = false;
                }
            }

            if (questionObject.tipo !== 1) {
                var opcion = 1;
                var asCombo = $(this).find('input[name=combo' + numeroPregunta + ']:checked').val();

                questionObject.combo = !asCombo ? 0 : asCombo;

                while ($(this).find('#opcion' + opcion).val()) {
                    questionObject.opciones.push($(this).find('#opcion' + opcion).val());
                    opcion++;
                }

                if (questionObject.tipo == 5) {
                    var subPregunta = 1;

                    while ($(this).find('#subpregunta' + subPregunta).val()) {
                        questionObject.subPreguntas.push($(this).find('#subpregunta' + subPregunta).val());
                        subPregunta++;
                    }
                }
            }

            questionsArray.push(questionObject);
            numeroPregunta++;
            questionObject = {};
            questionObject.opciones = [];
            questionObject.subPreguntas = [];
        });

        if (!questionValidated) {
            return;
        }

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
