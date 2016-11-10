<!doctype html>

<html lang='en'>
<head>
    <link rel='icon' href='img/focusicon.ico' type='image/x-icon'>
    <meta http-equiv='content-type' content='text/html; charset=UTF-8' />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/avances.js' type='text/javascript'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <script src='js/selects-shared.js' type='text/javascript'></script>
    <title> Focus - Avances</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    </div>
    <section>
        <div class='avances-wrapper'>
            <h2 id='header-title'>Avances</h2>

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

            <div class='input-wrapper'>
                <label>Elige una Encuesta</label>
                <select id='encuestas-filter-select' class='encuestas-select'>
                    <option value='0'>Selecciona una encuesta</option>
                </select>
            </div>

            <span id='available-encuestas-feedback' class='feedback-text'></span>
            <p id='avance-summary' class='avance-info'></p>
            <table id='avances-table'></table>
        </div>
    </section>
</body>
</html>
