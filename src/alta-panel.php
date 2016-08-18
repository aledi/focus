<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/nuevo-panel.js' type='text/javascript'></script>
    <title> Focus - Alta Panel</title>
</head>

<body>
    <?php include_once('elements/header.php');?>

    <section>
        <form class='form-login'>
            <h1> Alta de Páneles </h1>
            <div id="panelInput">
                <p>1. Nombre del Panel:</p>
                <input id="panelName" type="text"/>
            </div>

            <div id="date_starts">
                <p>2. Fecha de Inicio (yyyy-mm-dd):</p>
                <input id="dateStarts" type="text"/>
            </div>

            <div id="date_ends">
                <p>3. Fecha Final (yyyy-mm-dd):</p>
                <input id="dateEnds" type="text"/>
            </div>

            <div id="clients">
                <p>4. Seleccionar Cliente: </p>
                <select id="clientesDropdown">
                </select>
            </div>

            <div>
                <button type='submit' id='loginButtonNuevoPanel'>Crear Panel</button>
            </div>
            <div id='feedback'></div>
        </form>
    </section>
</body>
</html>
