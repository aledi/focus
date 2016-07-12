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
      <li style="float:right"><button id="logOutButton" class="active">Sign Out</button></li>
    </ul>
    <!-- <ul id = 'logOutButton' class='nav navbar-nav navbar-right'>
        <li><a href='logIn.php'>Cerrar Sesión <span class='glyphicon glyphicon-log-out'></span></a></li>
    </ul> -->
</div>

<script type = 'text/javascript'>

$('#logOutButton').on('click', function (event) {
    event.preventDefault();

    var parameters = {
        'action': 'LOG_OUT'
    };

    $.ajax({
        type: 'POST',
        url: '../api/controller.php',
        data: parameters,
        dataType: 'json',
        success: function (obj) {
            if (obj.status === "SUCCESS") {
                alert("¡Hasta pronto!");
                location.replace("signin.php");
            }
        }
    });
});

</script>
