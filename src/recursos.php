<!doctype html>

<html lang='en'>
<head>
    <link rel="icon" href="img/focusicon.ico" type="image/x-icon">
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <script src='js/jquery-1.12.3.js'></script>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <!--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>-->
    <script src='js/recursos.js'></script>
    <title> Focus - Recursos</title>
</head>
<body>
    <?php include_once('elements/header.php');?>
    <section class='recursos-section'>
        <div class='recursos-wrapper'>
            <h2>Recursos</h2>
            <div class='input-wrapper'>
                Selecciona un archivo:
                <input type='file' name='file' id='file'>
            </div>
            <div class='input-wrapper'>
                Tipo:
                <input id='radio-image' type='radio' name='tipo' value='1'>Imagen</input>
                <input id='radio-video' type='radio' name='tipo' value='2'>Video</input>
            </div>
            <div class='input-wrapper'>
                Nombre:
                <input type='text' name='file-name' id='file-name'></input>
                <select id='extension' name='fileType' required>
                    <option value=''>Selecciona un tipo de archivo</option>
                </select>
            </div>
            <button type='submit' name='submit' id='upload-data'>Guardar</button>
            <span id='feedback' class='feedback-text'></span>
            <div>
                <table id='all-resources'></table>
            </div>
        </div>
    </section>
</body>
</html>
