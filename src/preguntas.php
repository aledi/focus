<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/preguntas.js' type='text/javascript'></script>
    <title> Focus - Preguntas</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='preguntas-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregar-pregunta'>Ligar Pregunta</li>
                 <li class='tab-link' data-tab='tab-agregar-recursos'>Recursos</li>
            </ul>

            <div id='tab-agregar-pregunta' class='tab-content current'>
                <h2 id='header-title'>Ligar Pregunta</h2>

                <div id='questions'>
                    <div id='1' class='questionForm'>
                        <div class='input-wrapper'>
                            <label>Pregunta:</label>
                            <input id='pregunta' class='pregunta' name='respuesta' type='text' />
                        </div>
                        <div class='input-wrapper'>
                            <label>Tipo de pregunta:</label>
                            <select id='tipo' class='tipoPregunta' name='respuesta' required>
                                <option value='1'>Abiertas</option>
                                <option value='2'>Selección Única</option>
                                <option value='3'>Selección Múltiple</option>
                                <option value='4'>Ordenamiento</option>
                            </select>
                        </div>
                        <div class='input-wrapper'>
                            <label>Imagen URL:</label>
                            <input id='imagen' class='imagen' name='respuesta' type='text' />
                        </div>

                        <div class='input-wrapper'>
                            <label>Video URL:</label>
                            <input id='video' class='video' name='respuesta' type='text' />
                        </div>
                        <div id='Answers1'></div>
                        <button type="button" id='removeQuestion' class='no-background'>Eliminar Pregunta</button>
                    </div>
                </div>

                <button type='button' id='addQuestion' class='no-background'>Agregar Nueva Pregunta</button>
                <button type='submit' id='submitQuestions'>Confimar Preguntas</button>

                <span class='feedback'></span>
            </div>
            <div id='tab-agregar-recursos' class='tab-content'> 
                <form action="../api/upload.php" method="post" enctype="multipart/form-data">
                    Select image to upload:
                    <input type="file" name="fileToUpload" id="fileToUpload">
                    <br/>
                    <input type="submit" value="Upload Image" name="submit">
                </form>
            </div>
        </div>
    </section>
</body>
</html>
