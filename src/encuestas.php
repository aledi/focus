<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="js/jquery-1.12.3.js"></script>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <!--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>-->
    <script src='js/encuestas.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
    <title> Focus - Encuestas</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='encuestas-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregarEncuesta'>Agregar Encuesta</li>
                <li class='tab-link' data-tab='tab-modificarEncuesta'>Modificar Encuesta</li>
            </ul>

            <div id='tab-agregarEncuesta' class='tab-content current'>
                <h2 id='headerTitle'>Agregar Encuesta</h2>

                <div class='input-wrapper'>
                    <label>Nombre de Encuesta:</label>
                    <input id='nombre' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Fecha de Inicio (yyyy-mm-dd):</label>
                    <input id='dateStarts' type='text'/>
                </div>

                <div class='input-wrapper'>
                    <label>Fecha Final (yyyy-mm-dd):</label>
                    <input id='dateEnds' type='text'/>
                </div>

                <div class='input-wrapper'>
                    <label>Seleccionar Panel: </label>
                    <table id='allPanels'>

                    </table>
                </div>
                <div id="buttons">
                    <button type='submit' id='saveEncuesta'>Agregar</button>
                    <button type='submit' id='cancelModify'>Cancelar Cambios</button>
                    <span id='feedback'></span>
                </div>
            </div>

            <div id='tab-modificarEncuesta' class='tab-content'>
                <h2>Encuestas Disponibles</h2>

                <table id='allSurveys'></table>
            </div>
        </div>
    </section>
</body>
</html>
