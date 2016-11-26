<!--<?php //echo $_GET['id']?> -->
<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <script src='js/liga-panel.js' type='text/javascript'></script>
    <title> Focus - Ligar Panelista</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='liga-panel-wrapper'>
            <h2>Ligar Panelistas</h2>
            <div id='panelista'>
                <label>Buscar: <input id='filteringText' type='text' /></label>

                <p>Número de Muestra: <span id='current-checked'>0 / 0</span></p>
                <p class='alert'>*Los panelistas marcados en rojo no cuentan con información suficiente para responder encuestas</p>

                <table id='tablaPanelistas' class='padding-bottom'></table>
            </div>
            <button type='button' id='ligar-panelistas'>Ligar Panelistas</button>
            <span id='feedback' class='feedback-text'></span>
        </div>
    </section>
</body>
</html>
