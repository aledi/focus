<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
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
                            <label>Título</label>
                            <input id='titulo' class='titulo full-width' type='text' />
                        </div>
                        <div class='input-wrapper'>
                            <label>Imagen</label>
                            <div class='preview-resource'>
                                <select id='imagen1' class='imagen' type='text'>
                                    <option value=''>Selecciona una imagen</option>
                                </select>
                                <label class='preview'>Vista Previa</label>
                            </div>
                        </div>
                        <div class='input-wrapper'>
                            <label>Video</label>
                            <div class='preview-resource'>
                                <select id='video1' class='video' type='text'>
                                    <option value=''>Selecciona un video</option>
                                </select>
                                <label class='preview'>Vista Previa</label>
                            </div>
                        </div>
                        <div class='input-wrapper'>
                            <label>Pregunta</label>
                            <input id='pregunta' class='pregunta full-width' type='text' />
                        </div>
                        <div class='input-wrapper'>
                            <label>Tipo de pregunta</label>
                            <select id='tipo' class='tipoPregunta' required>
                                <option value='1'>Abiertas</option>
                                <option value='2'>Selección Única</option>
                                <option value='3'>Selección Múltiple</option>
                                <option value='4'>Ordenamiento</option>
                                <option value='5'>Matriz</option>
                                <option value='6'>Escala</option>
                            </select>
                        </div>
                        <div id='Answers1'></div>
                        <button type='button' id='removeQuestion' class='no-background'>Eliminar Pregunta</button>
                    </div>
                </div>

                <hr>
                <button type='button' id='addQuestion' class='no-background'>Agregar Nueva Pregunta</button>
                <button type='submit' id='submitQuestions'>Confimar Preguntas</button>

                <span id='feedback' class='feedback-text'></span>
            </div>
        </div>
    </section>
</body>
</html>
