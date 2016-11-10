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
                <select id='clientes-filter-select'></select>
            </div>

            <div class='input-wrapper'>
                <select id='paneles-filter-select'></select>
            </div>

            <div class='input-wrapper'>
                <select id='encuestas-filter-select' class='encuestas-select'></select>
            </div>

            <span id='selects-feedback' class='feedback-text'></span>
            <p id='avance-summary' class='avance-info'></p>
            <table id='avances-table'></table>
        </div>
    </section>
</body>
</html>
