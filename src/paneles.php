<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <script src='js/paneles.js' type='text/javascript'></script>
    <title> Focus - Paneles</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='paneles-wrapper'>
            <ul class='tabs'>
                <li class='tab-link current' data-tab='tab-agregar-panel'>Agregar Panel</li>
                <li class='tab-link' data-tab='tab-view-paneles'>Ver Paneles</li>
            </ul>

            <div id='tab-agregar-panel' class='tab-content current'>
                <h2 id='header-title'>Agregar Panel</h2>

                <div class='input-wrapper'>
                    <label>Nombre del Panel<span class='required-input'>*</span></label>
                    <input id='panel-name' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Número de Participantes<span class='required-input'>*</span></label>
                    <input id='participantes' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Descripción</label>
                    <textarea id='descripcion'></textarea>
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
                    <label>Seleccionar Cliente<span class='required-input'>*</span></label>
                    <select id='select-clientes'></select>
                    <span id='available-clientes-feedback' class='feedback-text'></span>
                </div>

                <button type='button' id='cancel-edit' class='no-background'>Cancelar</button>
                <button type='submit' id='save-panel'>Agregar</button>
                <span id='feedback' class='feedback-text'></span>
            </div>

            <div id='tab-view-paneles' class='tab-content'>
                <h2>Paneles Disponibles</h2>

                <div class='input-wrapper'>
                    <select id='clientes-filter-select'></select>
                </div>

                <table id='all-panels'></table>
                <span id='available-paneles-feedback' class='feedback-text'></span>
            </div>
        </div>
    </section>
</body>
</html>
