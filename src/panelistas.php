<!doctype html>

<html lang='en'>
<head>
    <meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
    <script src='js/jquery-1.12.3.js'></script>
    <script src='js/alta-panelistas.js' type='text/javascript'></script>
    <script src='js/modify-delete.js' type='text/javascript'></script>
    <title> Focus - Panelistas</title>
</head>

<body>
    <div class='header'>
        <div class='container'>
            <?php include_once('elements/navigation-bar.php');?>
        </div>
    </div>
    <div class='content-container'>

        <ul class='tabs'>
            <li class='tab-link current' data-tab='tab-agregarPanelista'>Agregar Panelista</li>
            <li class='tab-link' data-tab='tab-modificarPanelista'>Modificar Panelista</li>
        </ul>

        <div id='tab-agregarPanelista' class='tab-content current'>
            <div class='formHeader'>
                <h2 id='headerTitle'>Agregar Panelista</h2>
            </div>
            <div id='nombre_panelista'>
                <p>Nombre(s)</p>
                <input id='fName' type='text'/>
            </div>
            <div id='apellidos_panelista'>
                <p>Apellido(s):</p>
                <input id='lName' type='text'/>
            </div>
            <div id='emailInput'>
                <p>Correo Electrónico:</p>
                <input id='email' type='text'/>
            </div>
            <div id='usernameInput'>
                <p>Nombre de Usuario:</p>
                <input id='username' type='text'/>
            </div>
            <div id='passwordInput'>
                <p>Contraseña:</p>
                <input id='password' type='text'/>
            </div>
            <div id='genero'>
                <p>Género:</p>
                <p><input type='radio' value='0' name='gender'>Masculino</p>
                <p><input type='radio' value='1' name='gender'>Femenino</p>
            </div>
            <div id='fechaNacimiento'>
                <p>Fecha de Nacimiento:</p>
                <input id='fechaNacimiento' type='text'/>
            </div>
            <div id='nivel_educacion'>
                <p>Educación:</p>
                <p><input type='radio' value='1' name='nivel_educativo'>Primaria</p>
                <p><input type='radio' value='2' name='nivel_educativo'>Secundaria</p>
                <p><input type='radio' value='3' name='nivel_educativo'>Preparatoria o Técnica</p>
                <p><input type='radio' value='4' name='nivel_educativo'>Profesionista</p>
                <p><input type='radio' value='5' name='nivel_educativo'>Posgrado (maestría, doctorado)</p>
                <p><input type='radio' value='0' name='nivel_educativo'>Ninguno</p>
            </div>
            <div id='vivienda_calleNumero'>
                <p>Calle y Número:</p>
                <input id='calleNumero' type='text'/>
            </div>
            <div id='vivienda_colonia'>
                <p>Colonia:</p>
                <input id='colonia' type='text'/>
            </div>
            <div id='vivienda_municipio'>
                <p>Municipio:</p>
                <input id='municipio' type='text'/>
            </div>
            <div id='vivienda_Estado'>
                <p>Estado:</p>
                <select class='form-control' id='estado' name='estado'>
                    <option value='0'>Selecciona un estado...</option>
                    <option value='AGS'>Aguascalientes</option>
                    <option value='BC'>Baja California</option>
                    <option value='BCS'>Baja California Sur</option>
                    <option value='CAMP'>Campeche</option>
                    <option value='CHIS'>Coahuila</option>
                    <option value='CHIH'>Colima</option>
                    <option value='COAH'>Chiapas</option>
                    <option value='COL'>Colima</option>
                    <option value='CDMX'>Ciudad de México</option>
                    <option value='DGO'>Durango</option>
                    <option value='GTO'>Guanajuato</option>
                    <option value='GRO'>Guerrero</option>
                    <option value='HGO'>Hidalgo</option>
                    <option value='JAL'>Jalisco</option>
                    <option value='EDOMEX'>Estado de México</option>
                    <option value='MICH'>Michoacán</option>
                    <option value='MOR'>Morelos</option>
                    <option value='NAY'>Nayarit</option>
                    <option value='NL'>Nuevo León</option>
                    <option value='OAX'>Oaxaca</option>
                    <option value='PUE'>Puebla</option>
                    <option value='QRO'>Querétaro</option>
                    <option value='QROO'>Quintana Roo</option>
                    <option value='SLP'>San Luis Potosí</option>
                    <option value='SIN'>Sinaloa</option>
                    <option value='SON'>Sonora</option>
                    <option value='TAB'>Tabasco</option>
                    <option value='TAM'>Tamaulipas</option>
                    <option value='TLAX'>Tlaxcala</option>
                    <option value='VER'>Veracruz</option>
                    <option value='YUC'>Yucatan</option>
                    <option value='ZAC'>Zacatecas</option>
                </select>
            </div>
            <div id='vivienda_cp'>
                <p>Código Postal:</p>
                <input id='cp' type='text'/>
            </div>
            <br><br>
            <div id='enviarInfo'>
                <button type='submit' id='sendInfoPanelistas'>Enviar</button>
            </div>
            <div id='feedback'></div>
        </div>

        <div id='tab-modificarPanelista' class='tab-content'>
            <div class='formHeader'>
                <h2>Panelistas Disponibles</h2>
            </div>
            <table id='allPanelists'></table>
            <div id='feedback'></div>
        </div>
    </div>
    <?php include_once('elements/footer.php');?>
</body>
</html>
