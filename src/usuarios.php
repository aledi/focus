<!doctype html>

<html lang='en'>
<head>
<<<<<<< HEAD
    <meta charset='utf-8'>
    <script src="js/jquery-1.12.3.js"></script>
=======
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  	<script src="js/jquery-1.12.3.js"></script>
>>>>>>> development
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/alta-panelistas.js' type='text/javascript'></script>
    <script src='js/modify-delete.js' type='text/javascript'></script>
    <title> Focus - Usuarios</title>
</head>

<body>
    <div class='header'>
        <div class='container'>
            <?php include_once('elements/navigation-bar.php');?>
        </div>
    </div>
    <div class='content-container'>

        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-agregarUsuario">Agregar Usuario</li>
            <li class="tab-link" data-tab="tab-modificarUsuario">Modificar Usuario</li>
        </ul>

        <div id="tab-agregarUsuario" class="tab-content current">
            <div class="formHeader">
                <h2 id='headerTitle'>Agregar Cliente</h2>
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
                <button type='submit' id='sendInfoCliente'>Confirmar</button>
            </div>
            <div id='feedback'></div>
        </div>

        <div id="tab-modificarUsuario" class="tab-content">
            <div class="formHeader">
                <h2>Usuarios Disponibles</h2>
            </div>
            <table id="allUsers"></table>
        </div>
    </div>
    <?php include_once('elements/footer.php');?>
</body>
</html>
