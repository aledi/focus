<!doctype html>

<html lang='en'>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href='css/template.css' type='text/css' rel='stylesheet' />
    <link href='css/clientes.css' type='text/css' rel='stylesheet'/>
    <script src="js/jquery-1.12.3.js"></script>
    <script src='js/administradores.js' type='text/javascript'></script>
    <title> Focus - Administradores</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='admins-wrapper'>
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-agregarAdministrador">Agregar Administrador</li>
                <li class="tab-link" data-tab="tab-modificarAdministrador">Modificar Administrador</li>
            </ul>

            <div id="tab-agregarAdministrador" class="tab-content current">
                <h2 id='headerTitle'>Agregar Administrador</h2>

                <div class='input-wrapper'>
                    <label>Nombre(s):</label>
                    <input id="firstName" type="text" placeholder='José' />
                </div>

                <div class='input-wrapper'>
                    <label>Apellido(s):</label>
                    <input id="lastName" type="text" placeholder='Pérez García' />
                </div>

                <div class='input-wrapper'>
                    <label>Correo Electrónico:</label>
                    <input id="email" type="text" placeholder='email@email.com' />
                </div>

                <div class='input-wrapper'>
                    <label>Usuario:</label>
                    <input id="username" type="text" placeholder='jperez' />
                </div>

                <div class='input-wrapper'>
                    <label>Contraseña: </label>
                    <input type='password' name='Password' placeholder='••••••••' id='password'>
                </div>

                <div class='input-wrapper'>
                    <label>Confirmar Contraseña: </label>
                    <input type='password' name='Password' placeholder='••••••••' id='passwordConfirm'>
                </div>

                <button type='submit' id='saveAdmin'>Agregar</button>
                <span id='feedback'></span>
            </div>

            <div id="tab-modificarAdministrador" class="tab-content">
                <h2>Administradores Disponibles</h2>

                <table id="allAdmins"></table>
            </div>
        </div>
    </section>
</body>
</html>
