<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <link href='css/reportes.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src='js/reportes.js' type='text/javascript'></script>
    <script src='js/encuestas-shared.js' type='text/javascript'></script>
    <title> Focus - Reportes</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    </div>
    <section class='reportes-section'>
        <div class='reportes-wrapper'>
            <h2>Reportes</h2>
            <div class='selects-wrapper'>
                <div class='main-selects'>
                    <select id='reportes-encuestas-select' class='encuestas-select'>
                        <option value='0'>Selecciona una encuesta</option>
                    </select>
                    <select id='preguntas-select' class='encuestas-select'></select>
                </div>
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
                        <option value='0'>Selecciona un estado</option>
                        <option value='AGS'>Aguascalientes</option>
                        <option value='BC'>Baja California</option>
                        <option value='BCS'>Baja California Sur</option>
                        <option value='CAMP'>Campeche</option>
                        <option value='COAH'>Coahuila</option>
                        <option value='COL'>Colima</option>
                        <option value='CHIS'>Chiapas</option>
                        <option value='CDMX'>Ciudad de México</option>
                        <option value='DGO'>Durango</option>
                        <option value='GTO'>Guanajuato</option>
                        <option value='GRO'>Guerrero</option>
                        <option value='HGO'>Hidalgo</option>
                        <option value='JAL'>Jalisco</option>
                        <option value='EDOMEX'>Estado de México</option>
                        <option value='MICH'>Michoacán</option>
                        <option value='MOR'>Morelos</option>
                        <option value='NAY'>Nayarit</option>
                        <option value='NL'>Nuevo León</option>
                        <option value='OAX'>Oaxaca</option>
                        <option value='PUE'>Puebla</option>
                        <option value='QRO'>Querétaro</option>
                        <option value='QROO'>Quintana Roo</option>
                        <option value='SLP'>San Luis Potosí</option>
                        <option value='SIN'>Sinaloa</option>
                        <option value='SON'>Sonora</option>
                        <option value='TAB'>Tabasco</option>
                        <option value='TAM'>Tamaulipas</option>
                        <option value='TLAX'>Tlaxcala</option>
                        <option value='VER'>Veracruz</option>
                        <option value='YUC'>Yucatan</option>
                        <option value='ZAC'>Zacatecas</option>
                    </select>
                    <select id='educacion-select' class='encuestas-select'>
                        <option value='0'>Selecciona un nivel de educación</option>
                        <option value='1'>Primaria</option>
                        <option value='2'>Secundaria</option>
                        <option value='3'>Preparatoria</option>
                        <option value='4'>Profesional</option>
                        <option value='5'>Posgrado</option>
                        <option value='6'>Ninguno</option>
                    </select>
                    <button id='filtros-button' class='filtros-button' type='button'>Aplicar filtros</button>
                    <span id='reportes-filtros-feedback' class='feedback-text'></span>
                </div>
            </div>
            <span id='reportes-feedback' class='feedback-text'></span>
            <div id='chart1' class='chart1'></div>
            <div id='chart2' class='chart2'></div>
            <div id='chart3' class='chart3'></div>
        </div>
    </section>
</body>
</html>
