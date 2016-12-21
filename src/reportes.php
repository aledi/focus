<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <link href='css/reportes.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
    <script src='js/reportes.js' type='text/javascript'></script>
    <script src='js/states.js' type='text/javascript'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <script src='js/selects-shared.js' type='text/javascript'></script>
    <title> Focus - Reportes</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    </div>
    <section class='reportes-section'>
        <div class='reportes-wrapper'>
            <h2>Reportes</h2>
            <table id='reportes-table' class='hidden'></table>
            <a id='dlink' class='hidden'></a>

            <div class='main-selects'>
                <div class='input-wrapper'>
                    <select id='clientes-filter-select'></select>
                </div>

                <div class='input-wrapper'>
                    <select id='paneles-filter-select'></select>
                </div>

                <div class='input-wrapper'>
                    <select id='encuestas-filter-select' class='encuestas-select'></select>
                </div>

                <div class='input-wrapper'>
                    <select id='preguntas-filter-select' class='encuestas-select'></select></select>
                </div>

                <span id='selects-feedback' class='feedback-text'></span>
                <div class='button-wrapper'>
                    <button type='button' id='download-reportes' class='download-button'>Descargar Reporte</button>
                    <button type='button' id='refresh'>Actualizar</button>
                </div>
            </div>

            <div id='chart1' class='chart1'></div>
            <div class='filter-selects'>
                <select id='edad-select' class='encuestas-select'>
                    <option value='0'>Selecciona una edad</option>
                    <option value='25'>18 a 25</option>
                    <option value='35'>26 a 35</option>
                    <option value='45'>36 a 45</option>
                    <option value='55'>46 a 55</option>
                    <option value='100'>56 o más</option>
                </select>
                <select id='genero-select' class='encuestas-select'>
                    <option value='-1'>Selecciona un género</option>
                    <option value='0'>Masculino</option>
                    <option value='1'>Femenino</option>
                </select>
                <select id='estado-select' class='encuestas-select'>
                </select>
                <select id='educacion-select' class='encuestas-select'>
                    <option value='0'>Selecciona un nivel de educación</option>
                    <option value='1'>Primaria</option>
                    <option value='2'>Secundaria</option>
                    <option value='3'>Preparatoria o Técnica</option>
                    <option value='4'>Profesional</option>
                    <option value='5'>Posgrado</option>
                    <option value='6'>Ninguno</option>
                </select>
                <button id='filtros-button' class='filtros-button' type='button'>Aplicar filtros</button>
                <span id='reportes-filtros-feedback' class='feedback-text'></span>
            </div>
            <span id='reportes-feedback' class='feedback-text'></span>
            <table id='abiertas-table' class='abiertas-table'></table>
            <div id='chart2' class='chart2'></div>
            <div id='chart3' class='chart3'></div>
            <div id='chart4' class='chart4'></div>
        </div>
    </section>
</body>
</html>
