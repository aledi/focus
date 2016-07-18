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

function validateWebCredentials ($username, $password) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, email, nombre, apPaterno, apMaterno, tipo FROM Usuario WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            return array('status' => 'SUCCESS', 'id' => (int)$row['id'], 'tipo' => (int)$row['tipo'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre']." ".$row['apPaterno']." ".$row['apMaterno']);
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

function registerUser ($tipo, $username, $password, $nombre, $apPaterno, $apMaterno, $email) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username FROM Usuario WHERE username = '$username'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username']);
        } else {
            $sql = "INSERT INTO Usuario (username, password, nombre, apPaterno, apMaterno, email, tipo) VALUES ('$username', '$password', '$nombre', '$apPaterno', '$apMaterno', '$email', '$tipo')";

            if ($conn->query($sql) === TRUE) {
                return array('status' => 'SUCCESS');
            } else {
                return array('status' => 'ERROR');
            }
        }

        $conn->close();
    }
}

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

function registerPanel ($nombre, $fechaInicio, $fechaFin, $cliente, $creador) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre FROM Panel WHERE nombre = '$nombre'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            return array('status' => 'RECORD_EXISTS', 'id' => (int)$row['id'], 'nombre' => $row['nombre']);
        } else {
            $sql = "INSERT INTO Panel (nombre, fechaInicio, fechaFin, cliente, creador) VALUES ('$nombre', '$fechaInicio', '$fechaFin', $cliente, '$creador')";

            if ($conn->query($sql) === TRUE) {
                return array('status' => 'SUCCESS');
            } else {
                return array('status' => 'ERROR');
            }
        }

        $conn->close();
    }
}

// -------------------------------
// Fetch
// -------------------------------

function fetchClientes () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, nombre, apPaterno, apMaterno, email FROM Usuario WHERE tipo = '1'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $client = array('id' => $row['id'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre'].' '.$row['apPaterno'].' '.$row['apMaterno']);
            $response[] = $client;
        }

        return array('results' => $response);

        $conn->close();
    }

    return array('status' => 'ERROR');
}


function fetchPanel () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, fechaInicio, fechaFin, cliente, creador FROM Panel";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $client = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'cliente' => (int)$row['cliente'], 'creador' => (int)$row['creador']);
            $response[] = $client;
        }

        return array('results' => $response);

        $conn->close();
    }

    return array('status' => 'ERROR');
}


function fetchPanelistas () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, apPaterno, apMaterno, genero, edad, edoCivil, estado, municipio FROM Panelista";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $panelista = array('id' => $row['id'], 'nombre' => $row['nombre'].' '.$row['apPaterno'].' '.$row['apMaterno'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'edoCivil' => (int)$row['edoCivil'], 'municipio' => $row['municipio'], 'estado' => $row['estado']);
            $response[] = $panelista;
        }

        return array('results' => $response);

        $conn->close();
    }

    return array('status' => 'ERROR');
}

// -------------------------------
// Save
// -------------------------------

function savePanelistaPanel ($panel, $panelistas) {
    $conn = connect();

    $inserts = 0;
    $errors = 0;
    $existing = 0;

    if ($conn != null) {
        foreach ($panelistas as &$panelista) {
            $sql = "SELECT id FROM PanelistaEnPanel WHERE panelista = '$panelista' AND panel = '$panel'";
            $result = $conn->query($sql);

            if ($result->num_rows === 0) {
                $sql = "INSERT INTO PanelistaEnPanel (panelista, panel) VALUES ('$panelista', '$panel')";

                if ($conn->query($sql) === TRUE) {
                    $inserts = $inserts + 1;
                } else {
                    $errors = $errors + 1;
                }
            } else {
                $existing = $existing + 1;
            }
        }

        $conn->close();

        return array('status' => 'SUCCESS', 'inserts' => $inserts, 'errors' => $errors, 'existing' => $existing);
    }

    return array('status' => 'ERROR');
}

?>
