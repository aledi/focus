<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet' />
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/administradores.js' type='text/javascript'></script>
    <title> Focus - Administradores</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-agregarAdministrador">Agregar Administrador</li>
            <li class="tab-link" data-tab="tab-modificarAdministrador">Modificar Administrador</li>
        </ul>

        <div id="tab-agregarAdministrador" class="tab-content current">
            <h2 id='headerTitle'>Agregar Administrador</h2>

            <div id="emailInput">
                <p>1. Cuenta de correo electrónico:</p>
                <input id="email" type="text"/>
            </div>

            <div id="nombre_admin">
                <p>2. Nombre(s) de Pila:</p>
                <input id="firstName" type="text"/>
            </div>

            <div id="apellidos_admin">
                <p>3. Apellido Paterno:</p>
                <input id="lastName" type="text"/>
            </div>

            <div id="apellidos_admin_materno">
                <p>4. Apellido Materno:</p>
                <input id="lastNameMaterno" type="text"/>
            </div>

            <div id="usernameInput">
                <p>5. Nombre de Usuario:</p>
                <input id="username" type="text"/>
            </div>

            <div class='paswordInput'>
                <p> Password: </p>
                <input type='password' name='Password' placeholder='••••••••' id='password'>
            </div>

            <div class='paswordConfirmInput'>
                <p> Password Confirmation: </p>
                <input type='password' name='Password' placeholder='••••••••' id='passwordConfirm'>
            </div>

            <div id="enviarInfo">
                <br/>
                <button type='submit' id='sendInfoAdmin'>Registrar Administrador</button>
            </div>
            <div id='feedback'></div>
        </div>

        <div id="tab-modificarAdministrador" class="tab-content">
            <h2>Administradores Disponibles</h2>

            <table id="allAdmin"></table>
        </div>
    </section>
</body>
</html>
