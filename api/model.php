<?php

date_default_timezone_set('America/Mexico_City');

function connect() {
    // servername, username, password, dbname
    $connection = new mysqli('localhost', 'root', 'root', 'focus');
    $connection->set_charset('utf8');

    # Check connection
    if ($connection->connect_error) {
        return null;
    }

    return $connection;
}

// -------------------------------
// Log In
// -------------------------------

function validateWebCredentials ($username, $password) {
    $conn = connect();

    if ($conn != null) {

        $sql = "SELECT id, username, nombre, apellidos, email, tipo FROM Usuario WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'SUCCESS', 'id' => (int)$row['id'], 'tipo' => (int)$row['tipo'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre'], 'apellidos' => $row['apellidos']);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function validatePanelistaCredentials ($username, $password) {
    $conn = connect();

    if ($conn != null) {
        $sql0 = "SELECT id, username, genero, email, nombre, apellidos FROM Panelista WHERE username = '$username' AND password = '$password'";
        $result0 = $conn->query($sql0);

        if ($result0->num_rows > 0) {
            $row0 = $result0->fetch_assoc();
            $panelista = $row0['id'];

            $sql = "SELECT Panel.id, nombre, fechaInicio, fechaFin FROM Panel INNER JOIN PanelistaEnPanel ON Panel.id = PanelistaEnPanel.panel WHERE Panel.fechaInicio <= CURDATE() AND Panel.fechaFin >= CURDATE() AND PanelistaEnPanel.panelista = '$panelista'";
            $result = $conn->query($sql);

            $paneles = array();

            while ($row = $result->fetch_assoc()) {
                $panelId = $row['id'];
                $sql2 = "SELECT id, nombre, fechaInicio, fechaFin FROM Encuesta WHERE panel = '$panelId' AND fechaInicio <= CURDATE() AND fechaFin >= CURDATE()";
                $result2 = $conn->query($sql2);

                $encuestas = array();

                while ($row2 = $result2->fetch_assoc()) {
                    $encuestaId = $row2['id'];
                    $sql3 = "SELECT id, tipo, numPregunta, pregunta, video, imagen, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10 FROM Pregunta WHERE encuesta = '$encuestaId'";
                    $result3 = $conn->query($sql3);

                    $preguntas = array();

                    while ($row3 = $result3->fetch_assoc()) {
                        $opciones = array($row3['op1'], $row3['op2'], $row3['op3'], $row3['op4'], $row3['op5'], $row3['op6'], $row3['op7'], $row3['op8'], $row3['op9'], $row3['op10']);
                        $opciones = array_filter($opciones, 'emptyString');
                        $pregunta = array('id' => (int)$row3['id'], 'tipo' => (int)$row3['tipo'], 'numPregunta' => (int)$row3['numPregunta'], 'pregunta' => $row3['pregunta'], 'video' => $row3['video'], 'imagen' => $row3['imagen'], 'opciones' => $opciones);
                        $preguntas[] = $pregunta;
                    }

                    $contestada = FALSE;

                    $sql4 = "SELECT id FROM Respuesta WHERE encuesta = '$encuestaId' AND panelista = '$panelista'";
                    $result4 = $conn->query($sql4);

                    if ($result4->num_rows > 0) {
                        $contestada = TRUE;
                    }

                    $encuesta = array('id' => (int)$row2['id'], 'nombre' => $row2['nombre'], 'fechaInicio' => $row2['fechaInicio'], 'fechaFin' => $row2['fechaFin'], 'contestada' => $contestada, 'preguntas' => $preguntas);
                    $encuestas[] = $encuesta;
                }

                $panel = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'encuestas' => $encuestas);
                $paneles[] = $panel;
            }

            $conn->close();
            return array('status' => 'SUCCESS', 'id' => (int)$row0['id'], 'username' => $row0['username'], 'genero' => (int)$row0['genero'], 'email' => $row0['email'], 'nombre' => $row0['nombre']." ".$row0['apellidos'], 'paneles' => $paneles);

        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

// -------------------------------
// Registration
// -------------------------------

function registerUser ($tipo, $username, $password, $nombre, $apellidos, $email) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username FROM Usuario WHERE username = '$username'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username']);
        }

        $sql = "INSERT INTO Usuario (username, password, nombre, apellidos, email, tipo) VALUES ('$username', '$password', '$nombre', '$apellidos', '$email', '$tipo')";

        if ($conn->query($sql) === TRUE) {
            $lastId = mysqli_insert_id($conn);
            $conn->close();
            return array('status' => 'SUCCESS', 'id' => $lastId);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function registerPanelista ($username, $password, $nombre, $apellidos, $email, $genero, $fechaNacimiento, $educacion, $calleNumero, $colonia, $municipio, $estado, $cp) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, email FROM Panelista WHERE username = '$username' OR email = '$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email']);
        }

        $sql = "INSERT INTO Panelista (username, password, nombre, apellidos, email, genero, fechaNacimiento, educacion, calleNumero, colonia, municipio, estado, cp) VALUES ('$username', '$password', '$nombre', '$apellidos', '$email', '$genero', '$fechaNacimiento', '$educacion', '$calleNumero', '$colonia', '$municipio', '$estado', '$cp')";

        if ($conn->query($sql) === TRUE) {
            $lastId = mysqli_insert_id($conn);
            $conn->close();
            return array('status' => 'SUCCESS', 'id' => $lastId);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function registerPanel ($nombre, $descripcion, $fechaInicio, $fechaFin, $cliente, $creador) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre FROM Panel WHERE nombre = '$nombre'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'RECORD_EXISTS', 'id' => (int)$row['id'], 'nombre' => $row['nombre']);
        }

        $sql = "INSERT INTO Panel (nombre, descripcion, fechaInicio, fechaFin, cliente, creador) VALUES ('$nombre', '$descripcion', '$fechaInicio', '$fechaFin', $cliente, '$creador')";

        if ($conn->query($sql) === TRUE) {
            $lastId = mysqli_insert_id($conn);
            $conn->close();
            return array('status' => 'SUCCESS', 'id' => $lastId);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function registerEncuesta ($nombre, $fechaInicio, $fechaFin, $panel) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, panel FROM Encuesta WHERE nombre = '$nombre' AND panel = '$panel'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'RECORD_EXISTS', 'id' => (int)$row['id'], 'nombre' => $row['nombre'], 'panel' => (int)$row['panel']);
        }

        $sql = "INSERT INTO Encuesta (nombre, fechaInicio, fechaFin, panel) VALUES ('$nombre', '$fechaInicio', '$fechaFin', '$panel')";

        if ($conn->query($sql) === TRUE) {
            $lastId = mysqli_insert_id($conn);

            $tokens = array();

            $sql2 = "SELECT deviceToken FROM Panelista INNER JOIN PanelistaEnPanel ON Panelista.id = PanelistaEnPanel.panelista WHERE PanelistaEnPanel.panel = '$panel' AND Panelista.deviceToken != ''";

            $result = $conn->query($sql2);
            while ($row = $result->fetch_assoc()) {
                array_push($tokens, $row['deviceToken']);
            }

            $conn->close();
            return array('status' => 'SUCCESS', 'id' => $lastId, 'deviceTokens' => $tokens);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function registerResource ($nombre, $tipo) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre FROM Recurso WHERE nombre = '$nombre'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'RECORD_EXISTS', 'id' => (int)$row['id'], 'nombre' => $row['nombre']);
        }

        $sql = "INSERT INTO Recurso (nombre, tipo) VALUES ('$nombre', '$tipo')";

        if ($conn->query($sql) === TRUE) {
            $lastId = mysqli_insert_id($conn);
            $conn->close();
            return array('status' => 'SUCCESS', 'id' => $lastId);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

// -------------------------------
// Fetch
// -------------------------------

function fetchUsers ($tipo) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, nombre, apellidos, email FROM Usuario WHERE tipo = '$tipo'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $client = array('id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre'], 'apellidos' => $row['apellidos']);
            $response[] = $client;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchUser ($tipo, $id) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, nombre, apellidos, email FROM Usuario WHERE tipo = '$tipo' AND id = '$id'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $user = array('id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre'], 'apellidos' => $row['apellidos']);
        }

        $conn->close();
        return array('result' => $user);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPaneles () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, fechaInicio, fechaFin, cliente, creador FROM Panel ORDER BY fechaInicio DESC";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $cliente = $row['cliente'];
            $sql2 = "SELECT nombre, apellidos FROM Usuario WHERE id = '$cliente'";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();

            $client = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'cliente' => $row2['nombre'].' '.$row2['apellidos'], 'creador' => (int)$row['creador']);
            $response[] = $client;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPanel ($id) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, descripcion, fechaInicio, fechaFin, cliente, creador FROM Panel WHERE id = '$id'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $cliente = $row['cliente'];
            $sql2 = "SELECT id FROM Usuario WHERE id = '$cliente'";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();

            $panel = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'descripcion' => $row['descripcion'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'cliente' => (int)$row2['id'], 'creador' => (int)$row['creador']);
        }

        $conn->close();
        return array('result' => $panel);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPanelistas () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, nombre, apellidos, email, genero, TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad, educacion, calleNumero, colonia, municipio, estado, cp FROM Panelista";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $panelista = array('id' => (int)$row['id'], 'username' => $row['username'], 'nombre' => $row['nombre'], 'apellidos' => $row['apellidos'], 'email' => $row['email'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'educacion' => (int)$row['educacion'], 'calleNumero' => $row['calleNumero'], 'colonia' => $row['colonia'], 'municipio' => $row['municipio'], 'estado' => $row['estado'], 'cp' => (int)$row['cp']);
            $response[] = $panelista;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPanelista ($id) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, nombre, apellidos, email, genero, fechaNacimiento, educacion, calleNumero, colonia, municipio, estado, cp FROM Panelista WHERE id = '$id'";
        $result = $conn->query($sql);

        while ($row = $result->fetch_assoc()) {
            $panelista = array('id' => (int)$row['id'], 'username' => $row['username'], 'nombre' => $row['nombre'], 'apellidos' => $row['apellidos'], 'email' => $row['email'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'fechaNacimiento' => $row['fechaNacimiento'], 'educacion' => (int)$row['educacion'], 'calleNumero' => $row['calleNumero'], 'colonia' => $row['colonia'], 'municipio' => $row['municipio'], 'estado' => $row['estado'], 'cp' => (int)$row['cp']);
        }

        $conn->close();
        return array('result' => $panelista);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchEncuestas () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, fechaInicio, fechaFin, panel FROM Encuesta ORDER BY fechaInicio DESC";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $panel = $row['panel'];
            $sql2 = "SELECT nombre FROM Panel WHERE id = '$panel'";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();

            $panelista = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'panel' => $row2['nombre']);
            $response[] = $panelista;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchEncuestasForCliente ($cliente) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT Encuesta.id as id, Encuesta.nombre as nombre, Encuesta.fechaInicio as fechaInicio, Encuesta.fechaFin as fechaFin, panel FROM Encuesta INNER JOIN Panel ON Encuesta.panel = Panel.id WHERE Panel.cliente = '$cliente'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $panel = $row['panel'];
            $sql2 = "SELECT nombre FROM Panel WHERE id = '$panel'";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();

            $panelista = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'panel' => $row2['nombre']);
            $response[] = $panelista;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchEncuesta ($id) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, fechaInicio, fechaFin, panel FROM Encuesta WHERE id = '$id'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $panel = $row['panel'];
            $sql2 = "SELECT id FROM Panel WHERE id = '$panel'";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();

            $panelista = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'panel' => $row2['id']);
        }

        $conn->close();
        return array('result' => $panelista);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPanelistasPanel ($panel) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, apellidos, genero, educacion, TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad, estado, municipio FROM Panelista";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $id = $row['id'];
            $sql2 = "SELECT id FROM PanelistaEnPanel WHERE panel = '$panel' AND panelista = '$id'";
            $result2 = $conn->query($sql2);
            $checked = FALSE;

            if ($result2->num_rows > 0) {
                $checked = TRUE;
            }

            $panelista = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'apellidos' => $row['apellidos'], 'edad' => (int)$row['edad'], 'genero' => (int)$row['genero'], 'educacion' => (int)$row['educacion'], 'municipio' => $row['municipio'], 'estado' => $row['estado'], 'checked' => $checked);
            $response[] = $panelista;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPreguntasEncuesta ($encuesta) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT * FROM Pregunta WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $pregunta = array('id' => (int)$row['id'], 'encuesta' => (int)$encuesta, 'numPregunta' => (int)$row['numPregunta'], 'tipo' => (int)$row['tipo'], 'pregunta' => $row['pregunta'], 'video' => $row['video'], 'imagen' => $row['imagen'], 'op1' => $row['op1'], 'op2' => $row['op2'], 'op3' => $row['op3'], 'op4' => $row['op4'], 'op5' => $row['op5'], 'op6' => $row['op6'], 'op7' => $row['op7'], 'op8' => $row['op8'], 'op9' => $row['op9'], 'op10' => $row['op10']);
            $response[] = $pregunta;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchMobileData ($panelista) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT Panel.id, nombre, fechaInicio, fechaFin FROM Panel INNER JOIN PanelistaEnPanel ON Panel.id = PanelistaEnPanel.panel WHERE Panel.fechaInicio <= CURDATE() AND Panel.fechaFin >= CURDATE() AND PanelistaEnPanel.panelista = '$panelista'";
        $result = $conn->query($sql);

        $paneles = array();

        while ($row = $result->fetch_assoc()) {
            $panelId = $row['id'];
            $sql2 = "SELECT id, nombre, fechaInicio, fechaFin FROM Encuesta WHERE panel = '$panelId' AND fechaInicio <= CURDATE() AND fechaFin >= CURDATE()";
            $result2 = $conn->query($sql2);

            $encuestas = array();

            while ($row2 = $result2->fetch_assoc()) {
                $encuestaId = $row2['id'];
                $sql3 = "SELECT id, tipo, numPregunta, pregunta, video, imagen, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10 FROM Pregunta WHERE encuesta = '$encuestaId'";
                $result3 = $conn->query($sql3);

                $preguntas = array();

                while ($row3 = $result3->fetch_assoc()) {
                    $opciones = array($row3['op1'], $row3['op2'], $row3['op3'], $row3['op4'], $row3['op5'], $row3['op6'], $row3['op7'], $row3['op8'], $row3['op9'], $row3['op10']);
                    $opciones = array_filter($opciones, 'emptyString');
                    $pregunta = array('id' => (int)$row3['id'], 'tipo' => (int)$row3['tipo'], 'numPregunta' => (int)$row3['numPregunta'], 'pregunta' => $row3['pregunta'], 'video' => $row3['video'], 'imagen' => $row3['imagen'], 'opciones' => $opciones);
                    $preguntas[] = $pregunta;
                }

                $contestada = FALSE;

                $sql4 = "SELECT id FROM Respuesta WHERE encuesta = '$encuestaId' AND panelista = '$panelista'";
                $result4 = $conn->query($sql4);

                if ($result4->num_rows > 0) {
                    $contestada = TRUE;
                }

                $encuesta = array('id' => (int)$row2['id'], 'nombre' => $row2['nombre'], 'fechaInicio' => $row2['fechaInicio'], 'fechaFin' => $row2['fechaFin'], 'contestada' => $contestada, 'preguntas' => $preguntas);
                $encuestas[] = $encuesta;
            }

            $panel = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'encuestas' => $encuestas);
            $paneles[] = $panel;
        }

        $conn->close();
        return array('paneles' => $paneles);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchResources() {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT * FROM Recurso";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $recurso = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'tipo' => (int)$row['tipo']);
            $response[] = $recurso;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchResourcesOfType($type) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT * FROM Recurso WHERE tipo = '$type'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $recurso = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'tipo' => (int)$row['tipo']);
            $response[] = $recurso;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function emptyString ($string) {
    return($string !== '');
}

// -------------------------------
// Save
// -------------------------------

function savePanelistasPanel ($panel, $panelistas) {
    $conn = connect();

    $inserts = 0;
    $errors = 0;
    $deletes = 0;

    if ($conn != null) {
        $sql = "SELECT * FROM PanelistaEnPanel WHERE panel = '$panel'";
        $result = $conn->query($sql);
        $deletes = $result->num_rows;
        $sql = "DELETE FROM PanelistaEnPanel WHERE panel = '$panel'";
        $result = $conn->query($sql);

        $tokens = array();

        foreach ($panelistas as &$panelista) {
            $sql = "INSERT INTO PanelistaEnPanel (panelista, panel) VALUES ('$panelista', '$panel')";
            $sql2 = "SELECT deviceToken FROM Panelista WHERE id = '$panelista' AND deviceToken != ''";

            if ($conn->query($sql) === TRUE) {
                $inserts = $inserts + 1;
            } else {
                $errors = $errors + 1;
            }

            $result = $conn->query($sql2);
            if ($row = $result->fetch_assoc()) {
                array_push($tokens, $row['deviceToken']);
            }
        }

        $deletes = $deletes - $errors - $inserts;

        $conn->close();
        return array('status' => 'SUCCESS', 'inserts' => $inserts, 'errors' => $errors, 'deletes' => $deletes, 'deviceTokens' => $tokens);
    }

    return array('status' => 'DATABASE_ERROR');
}

function savePreguntasEncuesta ($encuesta, $preguntas) {
    $conn = connect();

    $inserts = 0;
    $errors = 0;
    $deletes = 0;

    if ($conn != null) {
        $sql = "SELECT * FROM Pregunta WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);
        $deletes = $result->num_rows;
        $sql = "DELETE FROM Pregunta WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);

        foreach ($preguntas as &$pregunta) {
            $tipo = $pregunta['tipo'];
            $numPregunta = $pregunta['numPregunta'];
            $preguntaText = $pregunta['pregunta'];
            $video = $pregunta['video'];
            $imagen = $pregunta['imagen'];

            $opciones = $pregunta['opciones'];

            $op1 = '';
            $op2 = '';
            $op3 = '';
            $op4 = '';
            $op5 = '';
            $op6 = '';
            $op7 = '';
            $op8 = '';
            $op9 = '';
            $op10 = '';

            $count = count($opciones);

            if ($count > 0) {
                $op1 = $opciones[0];
            }

            if ($count > 1) {
                $op2 = $opciones[1];
            }

            if ($count > 2) {
                $op3 = $opciones[2];
            }

            if ($count > 3) {
                $op4 = $opciones[3];
            }

            if ($count > 4) {
                $op5 = $opciones[4];
            }

            if ($count > 5) {
                $op6 = $opciones[5];
            }

            if ($count > 6) {
                $op7 = $opciones[6];
            }

            if ($count > 7) {
                $op8 = $opciones[7];
            }

            if ($count > 8) {
                $op9 = $opciones[8];
            }

            if ($count > 9) {
                $op10 = $opciones[9];
            }

            $sql = "INSERT INTO Pregunta (encuesta, tipo, numPregunta, pregunta, video, imagen, numOpciones, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10) VALUES ('$encuesta', $tipo, '$numPregunta', '$preguntaText', '$video', '$imagen', '$count', '$op1', '$op2', '$op3', '$op4', '$op5', '$op6', '$op7', '$op8', '$op9', '$op10')";

            if ($conn->query($sql) === TRUE) {
                $inserts = $inserts + 1;
            } else {
                $errors = $errors + 1;
            }
        }

        $deletes = $deletes - $errors - $inserts;

        $conn->close();
        return array('status' => 'SUCCESS', 'inserts' => $inserts, 'errors' => $errors, 'deletes' => $deletes);
    }

    return array('status' => 'DATABASE_ERROR');
}

function startEncuesta ($encuesta, $panelista) {
    $conn = connect();

    if ($conn != null) {
        $sql = "INSERT INTO Respuesta (encuesta, panelista) VALUES ('$encuesta', '$panelista')";

        if ($conn->query($sql) === TRUE) {
            $lastId = mysqli_insert_id($conn);
            $conn->close();
            return array('status' => 'SUCCESS', 'id' => $lastId);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function saveRespuestas ($id, $respuestas) {
    $conn = connect();

    if ($conn != null) {
        $date = date('Y-m-d');
        $hour = date('H:i:s');

        $sql = "UPDATE Respuesta SET respuestas = '$respuestas', fecha = '$date', hora = '$hour' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

// -------------------------------
// Update
// -------------------------------

function updatePanelista ($id, $username, $nombre, $apellidos, $email, $genero, $fechaNacimiento, $educacion, $calleNumero, $colonia, $municipio, $estado, $cp) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, email FROM Panelista WHERE username = '$username' OR email = '$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            if ((int)$row['id'] != $id) {
                $conn->close();
                return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email']);
            }
        }

        $sql = "UPDATE Panelista SET username = '$username', nombre = '$nombre', apellidos = '$apellidos', email = '$email', genero = '$genero', fechaNacimiento = '$fechaNacimiento', educacion = '$educacion', calleNumero = '$calleNumero', colonia = '$colonia', municipio = '$municipio', estado = '$estado', cp = '$cp' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function updateUser ($id, $username, $nombre, $apellidos, $email) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username FROM Usuario WHERE username = '$username'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            if ((int)$row['id'] != $id) {
                $conn->close();
                return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username']);
            }
        }

        $sql = "UPDATE Usuario SET username = '$username', nombre = '$nombre', apellidos = '$apellidos', email = '$email' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function updatePanel ($id, $nombre, $descripcion, $fechaInicio, $fechaFin, $cliente) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre FROM Panel WHERE nombre = '$nombre'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            if ((int)$row['id'] != $id) {
                $conn->close();
                return array('status' => 'RECORD_EXISTS', 'id' => (int)$row['id'], 'nombre' => $row['nombre']);
            }
        }

        $sql = "UPDATE Panel SET nombre = '$nombre', descripcion = '$descripcion', fechaInicio = '$fechaInicio', fechaFin = '$fechaFin', cliente = '$cliente' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function updateEncuesta ($id, $nombre, $fechaInicio, $fechaFin, $panel) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, panel FROM Encuesta WHERE nombre = '$nombre' AND panel = '$panel'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            if ((int)$row['id'] != $id) {
                $conn->close();
                return array('status' => 'RECORD_EXISTS', 'id' => (int)$row['id'], 'nombre' => $row['nombre'], 'panel' => (int)$row['panel']);
            }
        }

        $sql = "UPDATE Encuesta SET nombre = '$nombre', fechaInicio = '$fechaInicio', fechaFin = '$fechaFin', panel = '$panel' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

// -------------------------------
// Delete
// -------------------------------

function removeRecord ($id, $table) {
    $conn = connect();

    if ($conn != null) {
        $sql = "DELETE FROM $table WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

// -------------------------------
// Devices
// -------------------------------

function registerDeviceToken ($id, $token, $type) {
    $conn = connect();

    if ($conn != null) {
        $sql = "UPDATE Panelista SET deviceToken = '$token', deviceType = '$type' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function unregisterDeviceToken ($id) {
    $conn = connect();

    if ($conn != null) {
        $sql = "UPDATE Panelista SET deviceToken = '', deviceType = '' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

// -------------------------------
// Reports
// -------------------------------

function getSummary ($encuesta) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT COUNT(*) as total FROM Panelista INNER JOIN PanelistaEnPanel ON Panelista.id = PanelistaEnPanel.panelista WHERE PanelistaEnPanel.panel = (SELECT panel FROM Encuesta WHERE id = '$encuesta')";
        $result = $conn->query($sql);
        $total = 0;
        $answers = 0;

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $total = (int)$row['total'];
        }

        if ($total === 0) {
            $conn->close();
            return array('status' => 'NO_DATA');
        }

        $sql = "SELECT COUNT(*) as answers, fechaInicio, fechaFin, TIMESTAMPDIFF(DAY, CURDATE(), fechaFin) AS dias FROM Respuesta INNER JOIN Encuesta ON Respuesta.encuesta = Encuesta.id WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != ''";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $answers = (int)$row['answers'];
        }

        return array('status' => 'SUCCESS', 'respuestas' => $answers, 'porcentaje' => $answers / $total, 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'dias' => (int)$row['dias']);
    }

    return array('status' => 'DATABASE_ERROR');
}

function generalReportData ($encuesta) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT panel FROM Encuesta WHERE id = '$encuesta'";
        $result = $conn->query($sql);
        $panel = 0;

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $panel = (int)$row['panel'];
        }

        $sql = "SELECT COUNT(*) as total FROM PanelistaEnPanel WHERE panel = '$panel'";
        $result = $conn->query($sql);
        $total = 0;
        $answers = 0;

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $total = (int)$row['total'];
        }

        if ($total === 0) {
            $conn->close();
            return array('status' => 'NO_DATA');
        }

        $sql = "SELECT COUNT(*) as answers FROM Respuesta WHERE encuesta = '$encuesta' AND respuestas != ''";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $answers = (int)$row['answers'];
        }

        $byGender = array();
        $byAge = array();
        $byState = array();

        if ($answers === 0) {
            $byGender = generalReportByGender($encuesta, $answers, TRUE);
            $byAge = generalReportByAge($encuesta, $answers, TRUE);
            $byEducation = generalReportByEducation($encuesta, $answers, TRUE);

            $byStateData = generalReportByState($encuesta, $answers, TRUE);
            $byState = $byStateData[0];
            $byStatePercentage = $byStateData[1];

            $conn->close();
            return array('status' => 'NO_DATA', 'respuestas' => 0, 'porcentaje' => 0, 'genero' => $byGender, 'edad' => $byAge, 'educacion' => $byEducation, 'estado' => $byState, 'estadoPercentage' => $byStatePercentage);
        }

        $byGender = generalReportByGender($encuesta, $answers, FALSE);
        $byAge = generalReportByAge($encuesta, $answers, FALSE);
        $byEducation = generalReportByEducation($encuesta, $answers, FALSE);

        $byStateData = generalReportByState($encuesta, $answers, FALSE);
        $byState = $byStateData[0];
        $byStatePercentage = $byStateData[1];

        return array('status' => 'SUCCESS', 'respuestas' => $answers, 'porcentaje' => $answers / $total, 'genero' => $byGender, 'edad' => $byAge, 'educacion' => $byEducation, 'estado' => $byState, 'estadoPercentage' => $byStatePercentage);
    }

    return array('status' => 'DATABASE_ERROR');
}

function generalReportByGender ($encuesta, $total, $default) {
    $conn = connect();

    if ($conn != null && !$default) {
        $sql = "SELECT COUNT(*) as h FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Panelista.genero = 0 AND Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != ''";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $conn->close();
            return array('H' => (int)$row['h'], 'M' => ($total - (int)$row['h']));
        }
    }

    $conn->close();
    return array('H' => 0, 'M' => 0);
}

function generalReportByEducation ($encuesta, $total, $default) {
    $conn = connect();

    if ($conn != null && !$default) {
        $sql = "SELECT educacion, COUNT(*) as count FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != '' GROUP BY educacion";
        $result = $conn->query($sql);

        $response = array();
        $flags = [false, false, false, false, false, false];

        while ($row = $result->fetch_assoc()) {
            $response[$row['educacion']] = (int)$row['count'];
            $flags[(int)$row['educacion'] - 1] = true;
        }

        if (!$flags[0]) {
            $response['1'] = 0;
        }

        if (!$flags[1]) {
            $response['2'] = 0;
        }

        if (!$flags[2]) {
            $response['3'] = 0;
        }

        if (!$flags[3]) {
            $response['4'] = 0;
        }

        if (!$flags[4]) {
            $response['5'] = 0;
        }

        if (!$flags[5]) {
            $response['6'] = 0;
        }

        $conn->close();
        return $response;
    }

    $conn->close();
    return array(array(), array());
}

function generalReportByAge ($encuesta, $total, $default) {
    $conn = connect();

    if ($conn != null && !$default) {
        $dateNow = date('Y-m-d');
        $date25 = date('Y-m-d', strtotime("-25 year", time()));
        $date35 = date('Y-m-d', strtotime("-35 year", time()));
        $date45 = date('Y-m-d', strtotime("-45 year", time()));
        $date55 = date('Y-m-d', strtotime("-55 year", time()));

        $response = array();
        $count = 0;

        $sql = "SELECT COUNT(*) as count FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != '' AND Panelista.fechaNacimiento >= '$date25'";
        $result = $conn->query($sql);

        if ($row = $result->fetch_assoc()) {
            $response['25'] = (int)$row['count'];
            $count = $count + (int)$row['count'];
        }

        $sql = "SELECT COUNT(*) as count FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != '' AND Panelista.fechaNacimiento >= '$date35' AND Panelista.fechaNacimiento < '$date25'";
        $result = $conn->query($sql);

        if ($row = $result->fetch_assoc()) {
            $response['35'] = (int)$row['count'];
            $count = $count + (int)$row['count'];
        }

        $sql = "SELECT COUNT(*) as count FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != '' AND Panelista.fechaNacimiento >= '$date45' AND Panelista.fechaNacimiento < '$date35'";
        $result = $conn->query($sql);

        if ($row = $result->fetch_assoc()) {
            $response['45'] = (int)$row['count'];
            $count = $count + (int)$row['count'];
        }

        $sql = "SELECT COUNT(*) as count FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != '' AND Panelista.fechaNacimiento >= '$date55' AND Panelista.fechaNacimiento < '$date45'";
        $result = $conn->query($sql);

        if ($row = $result->fetch_assoc()) {
            $response['55'] = (int)$row['count'];
            $count = $count + (int)$row['count'];
        }

        $response['100'] = $total - $count;

        $conn->close();
        return $response;
    }

    $conn->close();
    return array('25' => 0, '35' => 0, '45' => 0, '55' => 0, '100' => 0);
}

function generalReportByState ($encuesta, $total, $default) {
    $conn = connect();

    if ($conn != null && !$default) {
        $sql = "SELECT estado, COUNT(*) as count FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != '' GROUP BY estado";
        $result = $conn->query($sql);

        $response = array();
        $responsePercentage = array();

        while ($row = $result->fetch_assoc()) {
            $response[$row['estado']] = (int)$row['count'];
            $responsePercentage[$row['estado'].'%'] = (int)$row['count'] / $total;
        }

        $conn->close();
        return array($response, $responsePercentage);
    }

    $conn->close();
    return array(array(), array());
}

function currentAnswers ($encuesta) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT Panelista.id, nombre, apellidos, genero, TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad, educacion, municipio, estado FROM Panelista LEFT JOIN PanelistaEnPanel ON Panelista.id = PanelistaEnPanel.panelista WHERE PanelistaEnPanel.panel = (SELECT panel FROM Encuesta WHERE id = '$encuesta')";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $panelistaId = $row['id'];
            $fecha = '';
            $hora = '';
            $sql2 = "SELECT fecha, hora, respuestas FROM Respuesta WHERE panelista = '$panelistaId' AND encuesta = '$encuesta' AND respuestas != ''";
            $result2 = $conn->query($sql2);

            if ($result2->num_rows > 0) {
                $row2 = $result2->fetch_assoc();
                $fecha = $row2['fecha'];
                $hora = $row2['hora'];
            }

            $panelista = array('nombre' => $row['nombre'].' '.$row['apellidos'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'educacion' => (int)$row['educacion'], 'municipio' => $row['municipio'], 'estado' => $row['estado'], 'fecha' => $fecha, 'hora' => $hora);
            $response[] = $panelista;
        }

        $conn->close();

        usort($response, function ($item1, $item2) {
            return $item2['fecha'] <=> $item1['fecha'];
        });

        $panelistas = array('panelistas' => $response);
        return array_merge(getSummary($encuesta), $panelistas);
    }

    return array();
}

function reportData ($encuesta, $numPregunta, $genero, $edad, $estado, $educacion) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT tipo, numOpciones, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10 FROM Pregunta WHERE encuesta = '$encuesta' AND numPregunta = '$numPregunta'";
        $result = $conn->query($sql);
        $tipo = 0;
        $options = array();
        $votes = array();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $tipo = $row['tipo'];

            for ($x = 1; $x <= $row['numOpciones']; $x++) {
                $options[] = $row['op'.$x];
                $votes[] = 0;
            }
        }

        if ($genero === null && $edad === null && $estado === null && $educacion === null) {
            $sql = "SELECT respuestas FROM Respuesta WHERE encuesta = '$encuesta' AND respuestas != ''";
        } else {
            $sql = "SELECT respuestas FROM Respuesta INNER JOIN Panelista ON Panelista.id = Respuesta.panelista WHERE Respuesta.encuesta = '$encuesta' AND Respuesta.respuestas != ''";

            if ($genero !== null) {
                $sql = $sql." AND Panelista.genero = '$genero'";
            }

            if ($edad !== null) {
                $dateNow = date('Y-m-d');
                $date25 = date('Y-m-d', strtotime("-25 year", time()));
                $date35 = date('Y-m-d', strtotime("-35 year", time()));
                $date45 = date('Y-m-d', strtotime("-45 year", time()));
                $date55 = date('Y-m-d', strtotime("-55 year", time()));

                if ($edad == 25) {
                    $sql = $sql." AND Panelista.fechaNacimiento >= '$date25'";
                } else if ($edad == 35) {
                    $sql = $sql." AND Panelista.fechaNacimiento >= '$date35' AND Panelista.fechaNacimiento < '$date25'";
                } else if ($edad == 45) {
                    $sql = $sql." AND Panelista.fechaNacimiento >= '$date45' AND Panelista.fechaNacimiento < '$date35'";
                } else if ($edad == 55) {
                    $sql = $sql." AND Panelista.fechaNacimiento >= '$date55' AND Panelista.fechaNacimiento < '$date45'";
                } else if ($edad == 100) {
                    $sql = $sql." AND Panelista.fechaNacimiento < '$date55'";
                }
            }

            if ($estado !== null) {
                $sql = $sql." AND Panelista.estado = '$estado'";
            }

            if ($educacion !== null) {
                $sql = $sql." AND Panelista.educacion = '$educacion'";
            }
        }

        $result = $conn->query($sql);
        $values = array();
        $total = 0;

        while ($row = $result->fetch_assoc()) {
            $total = $total + 1;
            $answers = explode('|', $row['respuestas']);

            if ($tipo == 1) {
                $votes[] = $answers[$numPregunta - 1];
            } if ($tipo == 2) {
                for ($x = 0; $x < count($options); $x++) {
                    if ($answers[$numPregunta - 1] == $options[$x]) {
                        $votes[$x] = $votes[$x] + 1;
                        break;
                    }
                }
            } else if ($tipo == 3) {
                $multipleAnswers = explode('&', $answers[$numPregunta - 1]);

                for ($x = 0; $x < count($options); $x++) {
                    for ($y = 0; $y < count($multipleAnswers); $y++) {
                        if ($multipleAnswers[$y] == $options[$x]) {
                            $votes[$x] = $votes[$x] + 1;
                            break;
                        }
                    }
                }
            } else if ($tipo == 4) {
                $multipleAnswers = explode('&', $answers[$numPregunta - 1]);

                for ($x = 0; $x < count($options); $x++) {
                    for ($y = 0; $y < count($multipleAnswers); $y++) {
                        if ($multipleAnswers[$y] == $options[$x]) {
                            $votes[$x] = $votes[$x] + $y + 1;
                            break;
                        }
                    }
                }
            }
        }

        if ($total == 0) {
            $conn->close();
            return array('status' => 'NO_DATA');
        }

        for ($x = 0; $x < count($options); $x++) {
            $values[] = $votes[$x] / $total;
        }

        $conn->close();
        return array('status' => 'SUCCESS', 'tipo' => (int)$tipo, 'opciones' => $options, 'votos' => $votes, 'porcentajes' => $values);
    }

    return array('status' => 'DATABASE_ERROR');
}

function downloadData ($encuesta) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT Panelista.id as id, nombre, apellidos, genero, TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad, educacion, municipio, estado FROM Panelista LEFT JOIN PanelistaEnPanel ON Panelista.id = PanelistaEnPanel.panelista WHERE PanelistaEnPanel.panel = (SELECT panel FROM Encuesta WHERE id = '$encuesta')";
        $result = $conn->query($sql);
        $filas = array();

        while ($row = $result->fetch_assoc()) {
            $fila = array('nombre' => $row['nombre'].' '.$row['apellidos'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'educacion' => (int)$row['educacion'], 'municipio' => $row['municipio'], 'estado' => $row['estado']);
            $id = $row['id'];

            $sql = "SELECT respuestas, fecha, hora FROM Respuesta WHERE encuesta = '$encuesta' AND respuestas != '' AND panelista = '$id'";
            $result2 = $conn->query($sql);

            if ($result2->num_rows > 0) {
                $row2 = $result2->fetch_assoc();
                $fila['fechaRespuesta'] = $row2['fecha'];
                $fila['horaRespuesta'] = $row2['hora'];

                $answer = str_replace('&', ', ', rtrim($row2['respuestas'], '|'));
                $answers = explode('|', $answer);

                for ($i = 0; $i < count($answers); $i++) {
                    $answers[$i] = rtrim($answers[$i], ', ');
                }

                $fila['respuestas'] = $answers;
                $filas[] = $fila;
            }
        }

        $sql = "SELECT pregunta FROM Pregunta WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);
        $columnas = array('Nombre', 'Género', 'Edad', 'Educación', 'Municipio', 'Estado', 'Fecha de Respuesta', 'Hora de Respuesta');

        while ($row = $result->fetch_assoc()) {
            $columnas[] = $row['pregunta'];
        }

        return array('status' => 'SUCCESS', 'columnas' => $columnas, 'filas' => $filas);
    }

    return array('status' => 'DATABASE_ERROR');
}

?>
