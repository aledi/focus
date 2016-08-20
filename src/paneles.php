<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/paneles.js' type='text/javascript'></script>
    <title> Focus - Paneles</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='paneles-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregarPanel'>Agregar Panel</li>
                <li class='tab-link' data-tab='tab-modificarPanel'>Modificar Panel</li>
            </ul>

            <div id='tab-agregarPanel' class='tab-content current'>
                <h2 id='headerTitle'>Agregar Panel</h2>

                <div class='input-wrapper'>
                    <label>Nombre del Panel:</label>
                    <input id='panelName' type='text'/>
                </div>
                <div class='input-wrapper'>
                    <label>Descripción:</label>
                    <textarea id='descripcion' type='text'/></textarea>
                </div>
                <div class='input-wrapper'>
                    <label>Fecha de Inicio (yyyy-mm-dd):</label>
                    <input id='dateStarts' type='text'/>
                </div>
                <div class='input-wrapper'>
                    <label>Fecha Final (yyyy-mm-dd):</label>
                    <input id='dateEnds' type='text'/>
                </div>
                <div>
                    <p>Seleccionar Cliente: </p>
                    <table id='tableClientes'>

                    </table>
                </div>

                <button type='submit' id='savePanel'>Agregar</button>
                <span id='feedback'></span>
            </div>

            <div id='tab-modificarPanel' class='tab-content'>
                <h2>Paneles Disponibles</h2>

                <table id='allPanels'></table>
            </div>
        </div>
    </section>
</body>
</html>
