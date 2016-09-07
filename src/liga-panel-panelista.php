<!--<?php //echo $_GET['id']?> -->
<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='elements/tableSorting/jquery.tablesorter.min.js'></script>
    <script src='js/liga-panel.js' type='text/javascript'></script>
    <script src='js/header.js' type='text/javascript'></script>
    <title> Focus - Ligar Panelista</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='liga-panel-wrapper'>
            <form class='form-login'>
                <h2>Ligar Panelistas</h2>
                <div id='panelista'>
                    <p>Filtrar Panelistas: <input id='filteringText' type='text' /></p>
                    <table id='tablaPanelistas' class='padding-bottom'></table>
                </div>
                <button type='submit' id='ligar-panelistas'>Ligar Panelistas</button>
                <div id='feedback'></div>
            </form>
        </div>
    </section>
</body>
</html>
