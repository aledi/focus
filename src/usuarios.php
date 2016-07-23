<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
	<script src='js/alta-panelistas.js' type='text/javascript'></script>
  	<title> Focus - Usuarios</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<img src='img/focus_logo.png' href='home.php'/>
    	</div>
        <?php include_once('elements/navigation-bar.php');?>
    </div>
    <div id='loginForm'>
    	<ul class="tabs">
			<li class="tab-link current" data-tab="tab-agregarUsuario">Agregar Usuario</li>
			<li class="tab-link" data-tab="tab-agregarAdmin">Agregar Administrador</li>
			<li class="tab-link" id="tab-modUser" data-tab="tab-modificarUsuario">Modificar Usuario</li>
			<li class="tab-link" id="tab-modAdmin"data-tab="tab-modificarAdministrador">Modificar Administrador</li>
		</ul>

		<div id="tab-agregarUsuario" class="tab-content current">
			<div class="formHeader">
				<h2>Agregar Cliente</h2>
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
	        	<br/>
	            <button type='submit' id='sendInfoCliente'>Registrar Cliente</button>
	        </div>
	        <div id='feedback'></div>
		</div>

		<div id="tab-agregarAdmin" class="tab-content">
			<div class="formHeader">
				<h2>Agregar Administrador</h2>
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
	        	<br/>
	            <button type='submit' id='sendInfoAdmin'>Registrar Administrador</button>
	        </div>
	        <div id='feedback'></div>
		</div>
		<div id="tab-modificarUsuario" class="tab-content">
			<table id="allUsers">

			</table>
		</div>
		<div id="tab-modificarAdministrador" class="tab-content">
			<table id="allAdmin">
			
			</table>
		</div>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>
