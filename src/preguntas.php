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
        <div class='preguntas-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregarEncuesta'>Ligar Pregunta</li>
            </ul>

            <div id='tab-agregarEncuesta' class='tab-content current'>
                <h2 id='headerTitle'>Ligar Pregunta</h2>

                <div id='questions'>
                    <div id="1" class='questionForm'>
                        <div class='input-wrapper'>
                            <label>Pregunta: </label>
                            <input class='pregunta' name='respuesta' type='text'/>
                        </div>
                        <div class='input-wrapper'>
                            <label>Tipo de pregunta: </label>
                            <select class="tipoPregunta" name="respuesta" required>
                                <option value="1">Abiertas</option>
                                <option value="2">Selección Única</option>
                                <option value="3">Selección Múltiple</option>
                                <option value="4">Ordenamiento</option>
                            </select>
                            <p class="feedTypeQuestion"></p>
                        </div>
                        <div class='input-wrapper'>
                            <label>Imagen URL:</label>
                            <input class="imagen" name="respuesta" type="text"/>
                        </div>

                        <div class='input-wrapper'>
                            <label>Video URL:</label>
                            <input class="video" name="respuesta" type="text"/>
                        </div>
                        <div id="Answers1">

                        </div>
                        <span class='feedback'></span>
                        <div class="button">
                            <button type="submit" class="removerPregunta">Remover Pregunta</button>
                        </div>
                    </div> 
                </div>

                <button type='submit' id='addQuestion' class='no-background'>Agregar Nueva Pregunta</button>
                <button type='submit' id='submitQuestions'>Confimar Preguntas</button>
            </div>
        </div>
    </section>
</body>
</html>
