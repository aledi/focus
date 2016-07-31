$(document).on('ready', function () {
	$(".tipoPregunta").on("change", function(){
		var typeQuestion = $('select[name=tipoPregunta]').val();
		var currentHTML = '';

		var questionID = $(this).parent().parent().attr('id');

		var answersClass = "div#Answers" + questionID;

		$(this).parent().parent().find(answersClass).empty();

		if(typeQuestion != 2){
			for(x = 1; x < 10; x++){
				currentHTML += '<div class="answer">';
	            	currentHTML += '<p>Opción ' + (x + 1) + '</p>';
	            	currentHTML += '<input class="respuesta' + (x + 1) + '" type="text"/>';
	            currentHTML += "</div>";
	     	}
    	}
    	else {
    		currentHTML += '<div class="answer">';
    			currentHTML += '<p>Respuesta</p>';
            	currentHTML += '<textarea class="respuesta"></textarea>';
    		currentHTML += '</div>';
    	}

    	$("#Answers" + questionID).append(currentHTML);
    	currentHTML = '';
    	//console.log($(this).parent().parent().find("div.Answers").text());
	});

	$(".addQuestion").on("click", function(){
		var currentHTML = '';
		
		var lastQuestion = $("#questions").children().length;
		lastQuestion = parseInt(lastQuestion) + 1;
		console.log(lastQuestion);

		currentHTML += '<div id="' + lastQuestion + '" class="questionForm">';
			currentHTML += '<div class="questionType">' +
                        		  '<select class="tipoPregunta" name="tipoPregunta" required>' +
		                          '<option value="0">Seleccionar Tipo...</option>' +
		                          '<option value="1">Selección Única</option>' +
		                          '<option value="2">Abiertas</option>' +
		                          '<option value="3">Ordenamiento</option>' +
		                          '<option value="4">Selección Múltiple</option>' +
                        		'</select>' +
                        		'<p class="feedTypeQuestion"></p>' +
                    		'</div>';
            currentHTML += '<div class="questionInput">' +
		        	            '<p>Pregunta '+ lastQuestion +' :</p>' +
		        	            '<input class="pregunta" name="1" type="text"/>' +
		        	        '</div>';
	        currentHTML += '<div class="imagen_content">' +
		                        '<p>Imagen URL:</p>' +
		                        '<input class="imagen" type="text"/>' +
		                    '</div>';
            currentHTML += '<div class="videoContent">' +
		                        '<p>Video URL:</p>' +
		                        '<input class="video" type="text"/>' +
		                    '</div>';
            currentHTML += '<div id="Answers'+(lastQuestion + 1)+'>' +
            				'</div>' +
            				'<div class="feedback"></div>' + 
            				'</div';

        $("#questions").append(currentHTML);
	});

});