<!doctype html>

<html lang='en'>
<head>
  	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  	<link href='css/template.css' type='text/css' rel='stylesheet'/>
  	<script src="js/jquery-1.12.3.js"></script>
    <script src='js/clientes.js' type='text/javascript'></script>
    <title> Focus - Clientes</title>
</head>

<body>
    <?php include_once('elements/header.php');?>
    <section>
        <div class='clientes-wrapper'>
            <ul class="tabs">
                <li class="tab-link current" data-tab="tab-agregarCliente">Agregar Cliente</li>
                <li class="tab-link" data-tab="tab-modificarCliente">Modificar Cliente</li>
            </ul>

            <div id='tab-agregarCliente' class='tab-content current'>
                <h2 id='headerTitle'>Agregar Cliente</h2>

                <div class='input-wrapper'>
                    <label>Nombre(s):</label>
                    <input id='firstName' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Apellido(s):</label>
                    <input id='lastName' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Correo Electrónico:</label>
                    <input id='email' type='text' />
                </div>

                <div class='input-wrapper'>
                    <label>Usuario:</label>
                    <input id='username' type='text' />
                </div>

                <div id='cliente-password' class='input-wrapper'>
                    <label>Contraseña:</label>
                    <input type='password' name='Password' placeholder='••••••••' id='password'>
                </div>

                <div id='cliente-password-confirm' class='input-wrapper'>
                    <label>Confirmar Contraseña:</label>
                    <input type='password' name='Password' placeholder='••••••••' id='passwordConfirm'>
                </div>

                <button type='submit' id='saveCliente'>Agregar</button>
                <button type='submit' id='cancelModify'>Cancelar Cambios</button>
                <span id='feedback'></span>
            </div>

            <div id="tab-modificarCliente" class="tab-content">
                <h2>Clientes Disponibles</h2>

                <table id="allUsers"></table>
            </div>
        </div>
    </section>
</body>
</html>
