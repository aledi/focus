<!doctype html>

<html lang='en'>
<head>
  	<meta charset='utf-8'>
    <link href='css/template.css' type='text/css' rel='stylesheet'/>
	<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js'></script>
	<script src='js/alta-panelistas.js' type='text/javascript'></script>
	<script src='js/modify-delete.js' type='text/javascript'></script>
  	<title> Focus - Panelistas</title>
</head>

<body>
    <div id='header'>
    	<div id="container">
    		<?php include_once('elements/navigation-bar.php');?>
    	</div>
    </div>
    <div id='contentContainer'>
		<div id="contentLeft">
			<div class="formHeader">
				<h2>Agregar Panelista</h2>
			</div>
			<div id="emailInput">
	            <p>1. Cuenta de correo electrónico:</p>
	            <input id="email" type="text"/>
	        </div>
	        <div id="nombre_panelista">
	            <p>2. Nombre(s) de Pila:</p>
	            <input id="fName" type="text"/>
	        </div>
	        <div id="apellidos_panelista">
	            <p>3. Apellido Paterno:</p>
	            <input id="lName" type="text"/>
	        </div>
	        <div id="apellidos_panelista_materno">
	            <p>3. Apellido Materno:</p>
	            <input id="lName_materno" type="text"/>
	        </div>
	        <div id="genero">
	            <p>4. Género:</p>
	            <p><input type="radio" value="0" name="gender">Masculino</p>
	            <p><input type="radio" value="1" name="gender">Femenino</p>
	        </div>
	        <div id="nivel_educacion">
	            <p>5. ¿Cuál es el nivel de educación más alto que ha recibido?</p>
	            <p><input type="radio" value="1" name="nivel_educativo">Primaria</p>
	            <p><input type="radio" value="2" name="nivel_educativo">Secundaria</p>
	            <p><input type="radio" value="3" name="nivel_educativo">Preparatoria o Técnica</p>
	            <p><input type="radio" value="4" name="nivel_educativo">Profesionista</p>
	            <p><input type="radio" value="5" name="nivel_educativo">Posgrado (maestría, doctorado)</p>
	            <p><input type="radio" value="0" name="nivel_educativo">Ninguno</p>
	        </div>
	        <div id="edad">
	            <p>6. ¿Cuál es su edad?</p>
	            <p><input type="radio" value="1" name="rango_edad">17 o menos.</p>
	            <p><input type="radio" value="2" name="rango_edad">21 - 29</p>
	            <p><input type="radio" value="3" name="rango_edad">30 - 39</p>
	            <p><input type="radio" value="4" name="rango_edad">40 - 49</p>
	            <p><input type="radio" value="5" name="rango_edad">50 - 59</p>
	            <p><input type="radio" value="6" name="rango_edad">60 o más</p>
	        </div>
	        <div id="estado_civil">
	            <p>7. ¿Cuál es su estado civil actual?</p>
	            <p><input type="radio" value="0" name="estadoCivil">Casado/a</p>
	            <p><input type="radio" value="1" name="estadoCivil">Viudo/a</p>
	            <p><input type="radio" value="2" name="estadoCivil">Divorciado/a</p>
	            <p><input type="radio" value="3" name="estadoCivil">Separado/a</p>
	            <p><input type="radio" value="4" name="estadoCivil">Soltero/a</p>
	            <p><input type="radio" value="5" name="estadoCivil">Unión Libre</p>
	        </div>
	        <div id="vivienda_Estado">
	        	<p>8. Estado de Vivienda: </p>
	            <select class="form-control" id="estado" name="estado">
	                <option value="0">Selecciona un estado...</option>
	                <option value="Aguascalientes">Aguascalientes</option>
	                <option value="Baja California">Baja California</option>
	                <option value="Baja California Sur">Baja California Sur</option>
	                <option value="Campeche">Campeche</option>
	                <option value="Coahuila">Coahuila</option>
	                <option value="Colima">Colima</option>
	                <option value="Chiapas">Chiapas</option>
	                <option value="Distrito Federal">Distrito Federal</option>
	                <option value="Durango">Durango</option>
	                <option value="Guanajuato">Guanajuato</option>
	                <option value="Guerrero">Guerrero</option>
	                <option value="Hidalgo">Hidalgo</option>
	                <option value="Jalisco">Jalisco</option>
	                <option value="Michoacan">Michoacán</option>
	                <option value="Morelos">Morelos</option>
	                <option value="Nayarit">Nayarit</option>
	                <option value="Nuevo Leon">Nuevo León</option>
	                <option value="Oaxaca">Oaxaca</option>
	                <option value="Puebla">Puebla</option>
	                <option value="Queretaro">Querétaro</option>
	                <option value="Quintana Roo">Quintana Roo</option>
	                <option value="San Luis Potosi">San Luis Potosí</option>
	                <option value="Sinaloa">Sinaloa</option>
	                <option value="Sonora">Sonora</option>
	                <option value="Tabasco">Tabasco</option>
	                <option value="Tamaulipas">Tamaulipas</option>
	                <option value="Tlaxcala">Tlaxcala</option>
	                <option value="Veracruz">Veracruz</option>
	                <option value="Yucatan">Yucatan</option>
	                <option value="Zacatecas">Zacatecas</option>
	            </select>
	        </div>
	        <div id="vivienda_municipio">
	            <p>9. ¿En qué municipio vive?</p>
	            <input id="municipio" type="text"/>
	        </div>
	        <div id="total_cuartos">
	            <p>10. ¿Cuál es el total de cuartos, piezas o habitaciones con que cuenta su hogar? Por favor no incluya baños, medios baños, pasillos, patios y zotehuelas.</p>
	            <p><input type="radio" value="1" name="cuartos">1</p>
	            <p><input type="radio" value="2" name="cuartos">2</p>
	            <p><input type="radio" value="3" name="cuartos">3</p>
	            <p><input type="radio" value="4" name="cuartos">4</p>
	            <p><input type="radio" value="5" name="cuartos">5</p>
	            <p><input type="radio" value="6" name="cuartos">6</p>
	            <p><input type="radio" value="7" name="cuartos">7 o más</p>
	        </div>
	        <div id="WC_completos">
	            <p>11. ¿Cuántos baños completos con regadera y W.C. (excusado) hay para uso exclusivo de los integrantes de su hogar?</p>
	            <p><input type="radio" value="0" name="banos">0</p>
	            <p><input type="radio" value="1" name="banos">1</p>
	            <p><input type="radio" value="2" name="banos">2</p>
	            <p><input type="radio" value="3" name="banos">3</p>
	            <p><input type="radio" value="4" name="banos">4 o más</p>
	        </div>
	        <div id="regaderas">
	            <p>12. ¿En su hogar cuenta con regadera funcionado en alguno de los baños?</p>
	            <p><input type="radio" value="0" name="regaderas">No tiene</p>
	            <p><input type="radio" value="1" name="regaderas">Sí tiene</p>
	        </div>
	        <div id="cantidad_focos">
	            <p>13. Contando todos los focos que utiliza para iluminar su hogar, incluyendo los de techos, paredes y lámparas de buró o piso, dígame ¿cuántos focos tiene su vivienda?</p>
	            <p><input type="radio" value="0" name="focos">0 a 5</p>
	            <p><input type="radio" value="1" name="focos">6 a 10</p>
	            <p><input type="radio" value="2" name="focos">11 a 15</p>
	            <p><input type="radio" value="3" name="focos">16 a 20</p>
	            <p><input type="radio" value="4" name="focos">21 o más</p>
	        </div>
	        <div id="tipo_piso">
	            <p>14. ¿El piso de su hogar es predominantemente de tierra, o de cemento, o de algún otro tipo de acabado?</p>
	            <p><input type="radio" value="0" name="piso">Tierra o cemento</p>
	            <p><input type="radio" value="1" name="piso">Otro tipo de material o acabado</p>
	        </div>
	        <div id="cantidad_carros">
	            <p>15. ¿Cuántos automóviles propios, excluyendo taxis, tienen en su hogar?</p>
	            <p><input type="radio" value="0" name="auto">0</p>
	            <p><input type="radio" value="1" name="auto">1</p>
	            <p><input type="radio" value="2" name="auto">2</p>
	            <p><input type="radio" value="3" name="auto">3 o más</p>
	        </div>
	        <div id="estudio_ingreso">
	            <p>16. Pensando en la persona que aporta la mayor parte del ingreso en este hogar, ¿cuál fue el último año de estudios que completó esa persona?</p>
	            <p><input type="radio" value="0" name="nivel_educativo_ingreso">No estudió</p>
	            <p><input type="radio" value="1" name="nivel_educativo_ingreso">Primaria Incompleta</p>
	            <p><input type="radio" value="2" name="nivel_educativo_ingreso">Primaria Completa</p>
	            <p><input type="radio" value="3" name="nivel_educativo_ingreso">Secundaria Completa/Incompleta</p>
	            <p><input type="radio" value="4" name="nivel_educativo_ingreso">Carrera Comercial/Técnica</p>
	            <p><input type="radio" value="5" name="nivel_educativo_ingreso">Preparatoria Completa/Incompleta</p>
	            <p><input type="radio" value="6" name="nivel_educativo_ingreso">Licenciatura Completa/Incompleta</p>
	            <p><input type="radio" value="7" name="nivel_educativo_ingreso">Diplomado/Maestría</p>
	            <p><input type="radio" value="8" name="nivel_educativo_ingreso">Doctorado</p>
	        </div>
	        <div id="estufa">
	            <p>17. ¿En este hogar cuentan con estufa de gas o eléctrica?</p>
	            <p><input type="radio" value="0" name="estufa">No tiene</p>
	            <p><input type="radio" value="1" name="estufa">Sí tiene</p>
	        </div>
	        <div id="telefono">
	            <p>18. Número de teléfono móvil (10 dígitos)</p>
	            <input id="telefono_cel" type="text"/>
	        </div>
	        <div id="medioEnterado">
	        </div>
	        <div id="fotoINE">
	        </div>
	        <div id="enviarInfo">
	            <button type='submit' id='sendInfoPanelistas'>Enviar</button>
	        </div>
	        <div id='feedback'></div>
		</div>

		<div id="content">
			<div class="formHeader">
				<h2>Panelistas Disponibles</h2>
			</div>
			<table id="allPanelists">
			
			</table>
	        <div id='feedback'></div>
		</div>
    </div>
	<?php include_once('elements/footer.php');?>
</body>
</html>
