$(document).on('ready', function () {
	var idEncuesta = -1;
	idEncuesta = window.location.search.substring(1)
    idEncuesta = idEncuesta.substring(3);

    function appendQuestions(typeQuestion, questionID){
    	var currentHTML = '';
    	if(typeQuestion != 2){
			for(x = 1; x <= 10; x++){
				currentHTML += '<div class="answer">';
	            	currentHTML += '<p>Opción ' + x + '</p>';
	            	currentHTML += '<input class="respuesta' + x + '" name="respuesta'+questionID+'" type="text"/>';
	            currentHTML += "</div>";
	     	}
    	}
    	else {
    		currentHTML += '<div class="answer">';
    			currentHTML += '<p>Respuesta</p>';
            	currentHTML += '<textarea class="respuesta'+questionID+'" name="respuesta'+questionID+'"></textarea>';
    		currentHTML += '</div>';
    	}

    	$("#Answers" + questionID).append(currentHTML);
    }

    if(idEncuesta != -1){

    	var parameters = {
    		action : 'GET_PREGUNTAS',
    		encuesta : idEncuesta
    	};

    	console.log(parameters);

        $.ajax({
            url: "../api/controller.php",
            type: "POST",
            data: parameters,
            dataType: "json",
            success: function(obj){
                console.log(obj);
                var typeQuestion = obj.results[0].tipo;
                var questionID = obj.results[0].numPregunta;

                $('.pregunta').val(obj.results[0].pregunta);
                $('.tipoPregunta').val(obj.results[0].tipo);

                appendQuestions(typeQuestion, questionID);

                $('.imagen').val(obj.results[0].imagen);
                $('.video').val(obj.results[0].video);

                if(typeQuestion == 2){
                	$('.respuesta' + questionID).val(obj.results[0].op1);
                }
                else {
        			$('.respuesta1').val(obj.results[0].op1);
        			$('.respuesta2').val(obj.results[0].op2);
        			$('.respuesta3').val(obj.results[0].op3);
        			$('.respuesta4').val(obj.results[0].op4);
        			$('.respuesta5').val(obj.results[0].op5);
        			$('.respuesta6').val(obj.results[0].op6);
        			$('.respuesta7').val(obj.results[0].op7);
        			$('.respuesta8').val(obj.results[0].op8);
        			$('.respuesta9').val(obj.results[0].op9);
        			$('.respuesta10').val(obj.results[0].op10);
                }
            },
            error: function(errorMsg)
            {
                alert("Error llenando preguntas");
            }
        });
    }

	$(document).on("change", ".tipoPregunta", function(){
		console.log('Form Value:');
		console.log($(this).val());
		var typeQuestion = $(this).val();
		var currentHTML = '';

		var questionID = $(this).parent().parent().attr('id');
		console.log('QuestionID:');	
		console.log(questionID);
		var answersClass = "div#Answers" + questionID;

		$(this).parent().parent().find(answersClass).empty();

		appendQuestions(typeQuestion, questionID);

    	currentHTML = '';
    	//console.log($(this).parent().parent().find("div.Answers").text());
	});

	$("#addQuestion").on("click", function(){
		var currentHTML = '';
		
		var lastQuestion = $("#questions").children().length;
		lastQuestion = parseInt(lastQuestion) + 1;
		console.log(lastQuestion);

		
		currentHTML += '<div id="' + lastQuestion + '" class="questionForm">';
			currentHTML += '<hr>';
			currentHTML += '<div class="questionInput">' +
		        	            '<p>Pregunta '+ lastQuestion +' :</p>' +
		        	            '<input class="pregunta" name="respuesta'+lastQuestion+'" type="text"/>' +
		        	        '</div>';
			currentHTML += '<div class="questionType">' +
								  	'<p>Tipo de pregunta: </p>' +
                        		  	'<select class="tipoPregunta" name="respuesta'+lastQuestion+'" required>' +
		                          	'<option value="0">Seleccionar Tipo...</option>' +
		                          	'<option value="1">Selección Única</option>' +
		                          	'<option value="2">Abiertas</option>' +
		                          	'<option value="3">Ordenamiento</option>' +
		                          	'<option value="4">Selección Múltiple</option>' +
                        		'</select>' +
                        		'<p class="feedTypeQuestion"></p>' +
                    		'</div>';
	        currentHTML += '<div class="imagen_content">' +
		                        '<p>Imagen URL:</p>' +
		                        '<input class="imagen" name="respuesta'+lastQuestion+'" type="text"/>' +
		                    '</div>';
            currentHTML += '<div class="videoContent">' +
		                        '<p>Video URL:</p>' +
		                        '<input class="video" name="respuesta'+lastQuestion+'" type="text"/>' +
		                    '</div>';
            currentHTML += '<div id="Answers'+lastQuestion+'">' +
            				'</div>' +
            				'<div class="feedback"></div>' + 
            				'</div>';

        $("#questions").append(currentHTML);
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
    	//	alert(this.value); // "this" is the current element in the loop
			
			$('[name=respuesta'+numeroPregunta+']').each(function() {
				if(iteration === 1){
					questionObject.numPregunta = numeroPregunta;
					questionObject.pregunta = $(this).val();
				}
				else if(iteration === 2){
					questionObject.tipo = $(this).val();
				}
				else if(iteration === 3){
					questionObject.imagen = $(this).val();
				}
				else if(iteration === 4) {
					questionObject.video = $(this).val();
				}
				else if(iteration === 5) {
					questionObject.op1 = $(this).val();
				}
				else if(iteration === 6) {
					questionObject.op2 = $(this).val();
				}
				else if(iteration === 7) {
					questionObject.op3 = $(this).val();
				}
				else if(iteration === 8) {
					questionObject.op4 = $(this).val();
				}
				else if(iteration === 9) {
					questionObject.op5 = $(this).val();
				}
				else if(iteration === 10) {
					questionObject.op6 = $(this).val();
				}
				else if(iteration === 11) {
					questionObject.op7 = $(this).val();
				}
				else if(iteration === 12) {
					questionObject.op8 = $(this).val();
				}
				else if(iteration === 13) {
					questionObject.op9 = $(this).val();
				}
				else if(iteration === 14) {
					questionObject.op10 = $(this).val();
				}
				iteration++;			
			});

			if(questionObject.tipo == 2){
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

        var parameters = {
            'action': 'SET_PREGUNTAS_ENCUESTA',
            'encuesta': idEncuesta,
            'preguntas': questionsArray
        };

        $.ajax({
            type: 'POST',
            url: '../api/controller.php',
            data: parameters,
            dataType: 'json',
            success: function (obj) {
                alert("Preguntas ligadas exitosamente.");
                //location.replace("preguntas.php?id=" + obj.id);
            },
            error: function (error) {
                 $('#feedback').html("Preguntas no añadidas, ha ocurrido un error.");
            }
        });
	})


});