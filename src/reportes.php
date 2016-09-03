<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/reportes.js' type='text/javascript'></script>
    <script src='js/encuestas-shared.js' type='text/javascript'></script>
    <title> Focus - Reportes</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    </div>
    <section>
        <h1>Reportes</h1>
        <select id='reportes-encuestas-select' class='encuestas-select'>
            <option value='0'>Selecciona una encuesta</option>
        </select>
        <select id='preguntas-select' class='encuestas-select'></select>
        <select id='edad-select' class='encuestas-select'>
            <option value='0'>Selecciona una edad</option>
        </select>
        <select id='genero-select' class='encuestas-select'>
            <option value='0'>Selecciona un género</option>
            <option value='1'>Masculino</option>
            <option value='2'>Femenino</option>
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
    </section>
</body>
</html>
