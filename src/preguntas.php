<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/preguntas.js' type='text/javascript'></script>
    <script src='js/modify-delete.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
  	<title> Focus - Encuestas</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<?php include_once('elements/navigation-bar.php');?>
    	</div>
    </div>
    <div id='contentContainer'>
    	<ul class="tabs">
			<li class="tab-link current" data-tab="tab-agregarPregunta">Ligar Pregunta</li>
			<!--<li class="tab-link" data-tab="tab-modificarEncuesta">Modificar Encuesta</li>-->
		</ul>
		
		<div id="tab-agregarEncuesta" class="tab-content current">
			<div class="formHeader">
				<h2>Ligar Pregunta</h2>
			</div>
            <div id="questions">
                <div id="1" class="questionForm">
                    <div class="questionType">
                        <select class="tipoPregunta" name="tipoPregunta" required>
                          <option value="0">Seleccionar Tipo...</option>
                          <option value="1">Selección Única</option>
                          <option value="2">Abiertas</option>
                          <option value="3">Ordenamiento</option>
                          <option value="4">Selección Múltiple</option>
                        </select>
                        <p class="feedTypeQuestion"></p>
                    </div>

        			<div class="questionInput">
        	            <p>Pregunta 1:</p>
        	            <input class="pregunta" name="1" type="text"/>
        	        </div>

        	        <div class="imagen_content">
                        <p>Imagen URL:</p>
                        <input class="imagen" type="text"/>
                    </div>

                    <div class="videoContent">
                        <p>Video URL:</p>
                        <input class="video" type="text"/>
                    </div>
                    <div id="Answers1">
            	        
                    </div>
        	        <div class='feedback'></div>
                </div>
            </div>
            <div class="enviarInfo">
                <br/>
                <button type='submit' class='addQuestion'>Agregar Pregunta</button>
            </div>
		</div>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>