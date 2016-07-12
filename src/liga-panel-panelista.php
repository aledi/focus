
<!-- python -m SimpleHTTPServer -->
<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/liga-panel.js' type='text/javascript'></script>
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
              <li style="float:right"><a class="active signOutButton" href="#about">Sign Out</a></li>
            </ul>
        </div>

    	<form id='formLogin'>
    		<h1> Ligar Panelistas a un Panel</h1>
            <div id="paneles">
                <p>1. Seleccionar Panel: </p>
                <select id="panelesDropdown">
                </select>
            </div>

            <div id="panelista">
                <p>2. Seleccionar Panelistas: (Mantener presionado Cntrl para varios)</p>
                <select id="panelistasDropdown" multiple>
                </select>
            </div>

	  		<div>
            	<button type='submit' id='loginButtonLigarPanel'>Ligar Panelistas</button>
        	</div>
            <div id='feedback'></div>
		</form>
    </div>
	<footer>
		<p>Copyright © 2016 Focus Consulting Group, SA. de C.V.</p>
	</footer>
</body>
</html>
