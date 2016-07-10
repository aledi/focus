
<!-- python -m SimpleHTTPServer -->
<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/nuevo-panel.js' type='text/javascript'></script>
  	<title> Focus - Iniciar Sesión</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<img src='img/focus_logo.png'/>
    	</div>
    </div>
    <div id='loginForm'>
    	<div id='navigationBar'>
            <ul>
                <li><a href="alta-panelistas.php">Alta Panelistas</a></li>
                <li class="dropdown">
                    <a href="#" class="dropbtn">Nuevo Usuario</a>
                    <div class="dropdown-content">
                        <a href="alta-admin.php">Alta Administrador</a>
                        <a href="alta-cliente.php">Alta Cliente</a>
                    </div>
                </li>
              <li><a href="alta-panel.php">Nuevo Panel</a></li>
              <li><a href="liga-panel-panelista.php">Ligar Panelistas</li>
              <li style="float:right"><a class="active" href="#about">About</a></li>
            </ul>
        </div>

    	<form id='formLogin'>
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

            <div id="date_ends">
                <p>5. Creador del Panel:</p>
                <input id="panelCreator" type="text"/>
            </div>

	  		<div>
            	<button type='submit' id='loginButtonNuevoPanel'>Crear Panel</button>
        	</div>
            <div id='feedback'></div>
		</form>
    </div>
	<footer>
		<p>Copyright © 2016 Focus Consulting Group, SA. de C.V.</p>
	</footer>
</body>
</html>
