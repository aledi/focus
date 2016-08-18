<!doctype html>

<html lang='en'>
<head>
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  	<link href='css/template.css' type='text/css' rel='stylesheet'/>
    <link href='css/usuarios.css' type='text/css' rel='stylesheet'/>
  	<script src="js/jquery-1.12.3.js"></script>
    <script src='js/usuarios.js' type='text/javascript'></script>
    <title> Focus - Usuarios</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='usuarios-wrapper'>
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-agregarUsuario">Agregar Usuario</li>
                <li class="tab-link" data-tab="tab-modificarUsuario">Modificar Usuario</li>
            </ul>

            <div id='tab-agregarUsuario' class='tab-content current'>
                <h2 id='headerTitle'>Agregar Cliente</h2>

                <div class='input-wrapper'>
                    <label>Correo Electrónico:</label>
                    <input id='email' type='text'/>
                </div>
                <div class='input-wrapper'>
                    <label>Nombre(s):</label>
                    <input id='firstName' type='text'/>
                </div>

                <div class='input-wrapper'>
                    <label>Apellido Paterno:</label>
                    <input id='lastName' type='text'/>
                </div>

                <div class='input-wrapper'>
                    <label>Apellido Materno:</label>
                    <input id='lastNameMaterno' type='text'/>
                </div>

                <div class='input-wrapper'>
                    <label>Nombre de Usuario:</label>
                    <input id='username' type='text'/>
                </div>

                <div class='input-wrapper'>
                    <label>Contraseña:</label>
                    <input type='password' name='Password' placeholder='••••••••' id='password'>
                </div>

                <div class='input-wrapper'>
                    <label>Confirmar Contraseña:</label>
                    <input type='password' name='Password' placeholder='••••••••' id='passwordConf'>
                </div>

                <button type='submit' id='sendInfoCliente'>Confirmar</button>
                <span id='feedback'></span>
            </div>

            <div id="tab-modificarUsuario" class="tab-content">
                <div class="formHeader">
                    <h2>Usuarios Disponibles</h2>
                </div>
                <table id="allUsers"></table>
            </div>
        </div>
    </section>
</body>
</html>
