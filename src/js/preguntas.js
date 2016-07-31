$(document).on('ready', function () {
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

		if(typeQuestion != 2){
			for(x = 1; x < 10; x++){
				currentHTML += '<div class="answer">';
	            	currentHTML += '<p>Opción ' + (x + 1) + '</p>';
	            	currentHTML += '<input class="respuesta' + (x + 1) + '" name="respuesta" type="text"/>';
	            currentHTML += "</div>";
	     	}
    	}
    	else {
    		currentHTML += '<div class="answer">';
    			currentHTML += '<p>Respuesta</p>';
            	currentHTML += '<textarea class="respuesta" name="respuesta"></textarea>';
    		currentHTML += '</div>';
    	}

    	$("#Answers" + questionID).append(currentHTML);
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
		        	            '<input class="pregunta" name="respuesta" type="text"/>' +
		        	        '</div>';
			currentHTML += '<div class="questionType">' +
								  	'<p>Tipo de pregunta: </p>' +
                        		  	'<select class="tipoPregunta" name="respuesta" required>' +
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
		                        '<input class="imagen" name="respuesta" type="text"/>' +
		                    '</div>';
            currentHTML += '<div class="videoContent">' +
		                        '<p>Video URL:</p>' +
		                        '<input class="video" name="respuesta" type="text"/>' +
		                    '</div>';
            currentHTML += '<div id="Answers'+lastQuestion+'">' +
            				'</div>' +
            				'<div class="feedback"></div>' + 
            				'</div>';

        $("#questions").append(currentHTML);
	});

	$('#submitQuestions').on('click', function(){
		console.log("Entra Botón");
		var nombrePregunta;
		var tipoPregunta;
		var imagenPregunta;
		var videoPregunta;
		var respuesta = 0;
		var taskArray = new Array();

		$('#questions').children().each(function () {
    		alert(this.value); // "this" is the current element in the loop
			
			$("input[name=task]").each(function() {
   				taskArray.push($(this).val());
			});
		});
	})
});