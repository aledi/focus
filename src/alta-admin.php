<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
    <script src='js/header.js' type='text/javascript'></script>
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
        <?php include_once('elements/navigation-bar.php');?>

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
            <button type='submit' id='sendInfoAdmin'>Enviar</button>
        </div>
        <div id='feedback'></div>
    </div>
    <?php include_once('elements/footer.php');?>
</body>
</html>
