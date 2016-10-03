<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/avances.js' type='text/javascript'></script>
    <script src='js/encuestas-shared.js' type='text/javascript'></script>
    <script src='js/date-functions.js' type='text/javascript'></script>
    <title> Focus - Avances</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    </div>
    <section>
        <div class='avances-wrapper'>
            <h2 id='header-title'>Avances</h2>
            <select id='avances-encuestas-select' class='encuestas-select'>
                <option value='0'>Selecciona una encuesta</option>
            </select>
            <span id='available-encuestas-feedback' class='feedback-text'></span>
            <p id='avance-summary' class='avance-info'></p>
            <table id='avances-table'></table>
        </div>
    </section>
</body>
</html>
