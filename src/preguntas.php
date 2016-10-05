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
                <li class='tab-link current' data-tab='tab-agregar-pregunta'>Preguntas</li>
            </ul>

            <div id='tab-agregar-pregunta' class='tab-content current'>
                <h2 id='header-title'>Preguntas</h2>

                <div id='questions'>
                    <div id='1' class='questionForm'>
                        <div class='input-wrapper'>
                            <label>Pregunta</label>
                            <input id='pregunta' class='pregunta' name='respuesta' type='text' />
                        </div>
                        <div class='input-wrapper'>
                            <label>Tipo de pregunta</label>
                            <select id='tipo' class='tipoPregunta' name='respuesta' required>
                                <option value='1'>Abiertas</option>
                                <option value='2'>Selección Única</option>
                                <option value='3'>Selección Múltiple</option>
                                <option value='4'>Ordenamiento</option>
                            </select>
                        </div>
                        <div class='input-wrapper'>
                            <label>Imagen</label>
                            <select id='imagen1' class='imagen' name='respuesta' type='text'>
                                <option value=''>Selecciona una imagen</option>
                            </select>
                        </div>

                        <div class='input-wrapper'>
                            <label>Video</label>
                            <select id='video1' class='video' name='respuesta' type='text'>
                                <option value=''>Selecciona un video</option>
                            </select>
                        </div>
                        <div id='Answers1'></div>
                        <button type="button" id='removeQuestion' class='no-background'>Eliminar Pregunta</button>
                    </div>
                </div>

                <button type='button' id='addQuestion' class='no-background'>Agregar Nueva Pregunta</button>
                <button type='submit' id='submitQuestions'>Confimar Preguntas</button>

                <span id='feedback' class='feedback-text'></span>
            </div>
        </div>
    </section>
</body>
</html>
