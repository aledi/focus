<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <script src='js/jquery-1.12.3.js'></script>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <!--<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>-->
    <script src='js/date-functions.js' type='text/javascript'></script>
    <script src='js/encuestas.js' type='text/javascript'></script>
    <script src='js/encuestas-shared.js' type='text/javascript'></script>
    <script src='js/selects-shared.js' type='text/javascript'></script>
    <title> Focus - Encuestas</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='encuestas-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregar-encuesta'>Agregar Encuesta</li>
                <li class='tab-link' data-tab='tab-view-encuestas'>Ver Encuestas</li>
            </ul>

            <div id='tab-agregar-encuesta' class='tab-content current'>
                <h2 id='header-title'>Agregar Encuesta</h2>

                <div class='input-wrapper'>
                    <label>Nombre de Encuesta<span class='required-input'>*</span></label>
                    <input id='nombre' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Fecha de Inicio<span class='required-input'>*</span></label>
                    <select id='dia'></select>
                    <select id='mes'></select>
                    <select id='anio'></select>
                </div>

                <div class='input-wrapper'>
                    <label>Fecha Final<span class='required-input'>*</span></label>
                    <select id='dia-fin'></select>
                    <select id='mes-fin'></select>
                    <select id='anio-fin'></select>
                </div>

                <div class='input-wrapper'>
                    <label>Seleccionar Panel<span class='required-input'>*</span></label>
                    <select id='select-paneles'></select>
                </div>

                <button type='button' id='cancel-edit' class='no-background'>Cancelar</button>
                <button type='submit' id='save-encuesta'>Agregar</button>
                <span id='feedback' class='feedback-text'></span>
            </div>

            <div id='tab-view-encuestas' class='tab-content'>
                <h2>Encuestas Disponibles</h2>

                <div class='input-wrapper'>
                    <label>Elige un Cliente</label>
                    <select id='clientes-filter-select'></select>
                </div>

                <div class='input-wrapper'>
                    <label>Elige un Panel</label>
                    <select id='paneles-filter-select'>
                        <option value='0'> Selecciona un panel </option>
                    </select>
                </div>

                <table id='all-encuestas'></table>
                <span id='available-encuestas-feedback' class='feedback-text'></span>
            </div>
        </div>
    </section>
</body>
</html>
