<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/preguntas.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
    <title> Focus - Encuestas</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-agregarEncuesta">Ligar Pregunta</li>
            <!--<li class="tab-link" data-tab="tab-modificarEncuesta">Modificar Encuesta</li>-->
        </ul>

        <div id="tab-agregarEncuesta" class="tab-content current">
            <div class="formHeader">
                <h2 id='headerTitle'>Ligar Pregunta</h2>
            </div>
            <div id="questions">
                <div id="1" class="questionForm">
                    <div class="questionInput">
                        <p>Pregunta 1:</p>
                        <input class="pregunta" name="respuesta1" type="text"/>
                    </div>
                    <div class="questionType">
                        <p>Tipo de pregunta: </p>
                        <select class="tipoPregunta" name="respuesta1" required>
                            <option value="1">Abiertas</option>
                            <option value="2">Selección Única</option>
                            <option value="3">Ordenamiento</option>
                            <option value="4">Selección Múltiple</option>
                        </select>
                        <p class="feedTypeQuestion"></p>
                    </div>
                    <div class="imagen_content">
                        <p>Imagen URL:</p>
                        <input class="imagen" name="respuesta1" type="text"/>
                    </div>

                    <div class="videoContent">
                        <p>Video URL:</p>
                        <input class="video" name="respuesta1" type="text"/>
                    </div>
                    <div id="Answers1">

                    </div>
                    <div class='feedback'></div>
                </div>
            </div>
            <div class="enviarInfo">
                <br/>
                <button type='submit' id='addQuestion'>Agregar Pregunta</button>
                <button type='submit' id='submitQuestions'>Confimar Preguntas</button>
                <br/>
            </div>
        </div>
    </section>
</body>
</html>
