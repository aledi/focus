<?php 
    if (!isset($_SESSION['id'])){
        header("Location: signin.php");
    }
?>

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
      <li><a href="liga-panel-panelista.php">Ligar Panelistas</a></li>
      <li style="float:right"><a class="active signOutButton">Sign Out</a></li>
    </ul>
</div>