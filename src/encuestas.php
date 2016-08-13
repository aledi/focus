<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="js/jquery-1.12.3.js"></script>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <!--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>-->
    <script src='js/encuestas.js' type='text/javascript'></script>
    <script src='js/modify-delete.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
    <title> Focus - Encuestas</title>
</head>

<body>
    <div class='header'>
        <div class='container'>
            <?php include_once('elements/navigation-bar.php');?>
        </div>
    </div>
    <div class='content-container'>
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-agregarEncuesta">Agregar Encuesta</li>
            <li class="tab-link" data-tab="tab-modificarEncuesta">Modificar Encuesta</li>
        </ul>

        <div id="tab-agregarEncuesta" class="tab-content current">
            <div class="formHeader">
                <h2 id='headerTitle'>Agregar Encuesta</h2>
            </div>
            <div id="emailInput">
                <p>1. Nombre de Encuesta:</p>
                <input id="nombre" type="text"/>
            </div>

            <div id="date_starts">
                <p>2. Fecha de Inicio (yyyy-mm-dd):</p>
                <input id="dateStarts" type="text"/>
            </div>

            <div id="date_ends">
                <p>3. Fecha Final (yyyy-mm-dd):</p>
                <input id="dateEnds" type="text"/>
            </div>

            <div id="panels">
                <p>4. Seleccionar Panel: </p>
                <table id="allPanels">

                </table>
            </div>

            <div id="enviarInfo">
                <br/>
                <button type='submit' id='sendInfoEncuestas'>Confirmar</button>
            </div>
            <div id='feedback'></div>
        </div>

        <div id="tab-modificarEncuesta" class="tab-content">
            <div class="formHeader">
                <h2>Encuestas Disponibles</h2>
            </div>
            <table id="allSurveys"></table>
        </div>
    </div>
    <?php include_once('elements/footer.php');?>
</body>
</html>
