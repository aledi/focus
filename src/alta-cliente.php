<!-- python -m SimpleHTTPServer -->
<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/alta-panelistas.js' type='text/javascript'></script>
  	<title> Focus - Home</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<img src='img/focus_logo.png' href='home.php'/>
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
        <div id="emailInput">
            <p>1. Cuenta de correo electrónico:</p>
            <input id="email" type="text"/>
        </div>

        <div id="nombre_admin">
            <p>2. Nombre(s) de Pila:</p>
            <input id="fName" type="text"/>
        </div>

        <div id="apellidos_admin">
            <p>3. Apellido Paterno:</p>
            <input id="lName" type="text"/>
        </div>

        <div id="apellidos_admin_materno">
            <p>4. Apellido Materno:</p>
            <input id="lName_materno" type="text"/>
        </div>
        
        <div id="usernameInput">
            <p>5. Nombre de Usuario:</p>
            <input id="username" type="text"/>
        </div>

        <div class='paswordInput'>
            <p> Password: </p>
            <input type='password' name='Password' placeholder='***************' id='password'>
        </div>

        <div class='paswordConfirmInput'>
            <p> Password Confirmation: </p>
            <input type='password' name='Password' placeholder='***************' id='passwordConf'>
        </div>

        <div id="enviarInfo">
            <button type='submit' id='sendInfoCliente'>Registrar</button>
        </div>
        <div id='feedback'></div>
    </div>
	<footer>
		<p>Copyright © 2016 Focus Consulting Group, SA. de C.V.</p>
	</footer>
</body>
</html>
