<?php

function connect() {
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "focus";

    $connection = new mysqli($servername, $username, $password, $dbname);

    # Check connection
    if ($connection->connect_error) {
        return null;
    } else {
        return $connection;
    }
}

// -------------------------------
// Log In
// -------------------------------

function validateWebCredentials ($username, $password, $tipo) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, email, nombre, apPaterno, apMaterno FROM Usuario WHERE username = '$username' AND password = '$password' AND tipo = '$tipo'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            return array('status' => 'SUCCESS', 'id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre']." ".$row['apPaterno']." ".$row['apMaterno']);
        } else {
            return array('status' => 'ERROR');
        }

        $conn->close();
    }
}

function validatePanelistaCredentials ($email, $password) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, email, nombre, apPaterno, apMaterno FROM Panelista WHERE email = '$email' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            return array('status' => 'SUCCESS', 'id' => (int)$row['id'], 'email' => $row['email'], 'nombre' => $row['nombre']." ".$row['apPaterno']." ".$row['apMaterno']);
        } else {
            return array('status' => 'ERROR');
        }

        $conn->close();
    }
}

// -------------------------------
// Registration
// -------------------------------

function registerPanelista ($email, $nombre, $apPaterno, $apMaterno, $genero, $educacion, $edad, $edoCivil, $estado, $municipio, $cuartos, $banios, $regadera, $focos, $piso, $autos, $estudiosProv, $estufa, $movil, $fotoINE) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, email FROM Panelista WHERE email = '$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'email' => $row['email']);
        } else {
            $sql = "INSERT INTO Panelista (email, nombre, apPaterno, apMaterno, genero, educacion, edad, edoCivil, estado, municipio, cuartos, banios, regadera, focos, piso, autos, estudiosProv, estufa, movil, fotoINE) VALUES ('$email', '$nombre', '$apPaterno', '$apMaterno', $genero, '$educacion', '$edad', '$edoCivil', '$estado', '$municipio', '$cuartos', '$banios', '$regadera', '$focos', '$piso', '$autos', '$estudiosProv', '$estufa', '$movil', '$fotoINE')";
            
            if ($conn->query($sql) === TRUE) {
                return array('status' => 'SUCCESS');
            } else {
                return array('status' => 'ERROR');
            }
        }

        $conn->close();
    }
}

?>
