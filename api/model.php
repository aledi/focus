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
    }

    return $connection;
}

// -------------------------------
// Log In
// -------------------------------

function validateWebCredentials ($username, $password) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, nombre, apPaterno, apMaterno, email, tipo FROM Usuario WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'SUCCESS', 'id' => (int)$row['id'], 'tipo' => (int)$row['tipo'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre']." ".$row['apPaterno']." ".$row['apMaterno']);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function validatePanelistaCredentials ($email, $password) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, email, nombre, apPaterno, apMaterno FROM Panelista WHERE email = '$email' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'SUCCESS', 'id' => (int)$row['id'], 'email' => $row['email'], 'nombre' => $row['nombre']." ".$row['apPaterno']." ".$row['apMaterno']);
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
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

            $conn->close();
            return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username']);
        }

        $sql = "INSERT INTO Usuario (username, password, nombre, apPaterno, apMaterno, email, tipo) VALUES ('$username', '$password', '$nombre', '$apPaterno', '$apMaterno', '$email', '$tipo')";

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

function registerPanelista ($usenrame, $password, $nombre, $apellidos, $email, $genero, $fechaNacimiento, $educacion, $calleNumero, $colonia, $municipio, $estado, $cp) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, username, email FROM Panelista WHERE username = '$username' OR email = '$email'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            $conn->close();
            return array('status' => 'USER_EXISTS', 'id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email']);
        }

        $sql = "INSERT INTO Panelista (username, password, nombre, apellidos, email, genero, fechaNacimiento, educacion, calleNumero, colonia, municipio, estado, cp) VALUES ('$usenrame', '$password', '$nombre', '$apellidos', '$email', '$genero', '$fechaNacimiento', '$educacion', '$calleNumero', '$colonia', '$municipio', '$estado', '$cp')";

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

        $sql = "INSERT INTO Panel (nombre, decripcion, fechaInicio, fechaFin, cliente, creador) VALUES ('$nombre', '$descripcion', '$fechaInicio', '$fechaFin', $cliente, '$creador')";

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
        $sql = "SELECT id, username, nombre, apPaterno, apMaterno, email FROM Usuario WHERE tipo = '$tipo'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $client = array('id' => (int)$row['id'], 'username' => $row['username'], 'email' => $row['email'], 'nombre' => $row['nombre'].' '.$row['apPaterno'].' '.$row['apMaterno']);
            $response[] = $client;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchPaneles () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, fechaInicio, fechaFin, cliente, creador FROM Panel";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $cliente = $row['cliente'];
            $sql2 = "SELECT nombre, apPaterno, apMaterno FROM Usuario WHERE id = '$cliente'";
            $result2 = $conn->query($sql2);
            $row2 = $result2->fetch_assoc();

            $client = array('id' => (int)$row['id'], 'nombre' => $row['nombre'], 'fechaInicio' => $row['fechaInicio'], 'fechaFin' => $row['fechaFin'], 'cliente' => $row2['nombre'].' '.$row2['apPaterno'].' '.$row2['apMaterno'], 'creador' => (int)$row['creador']);
            $response[] = $client;
        }

        $conn->close();
        return array('results' => $response);
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
            $panelista = array('id' => (int)$row['id'], 'username' => $row['username'], 'nombre' => $row['nombre'].' '.$row['apellidos'], 'email' => $row['email'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'educacion' => (int)$row['educacion'], 'calleNumero' => $row['calleNumero'], 'colonia' => $row['colonia'], 'municipio' => $row['municipio'], 'estado' => $row['estado'], 'cp' => (int)$row['cp']);
            $response[] = $panelista;
        }

        $conn->close();
        return array('results' => $response);
    }

    return array('status' => 'DATABASE_ERROR');
}

function fetchEncuestas () {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, fechaInicio, fechaFin, panel FROM Encuesta";
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

function fetchPanelistasPanel ($panel) {
    $conn = connect();

    if ($conn != null) {
        $sql = "SELECT id, nombre, apPaterno, apMaterno, genero, TIMESTAMPDIFF(YEAR, fechaNacimiento, CURDATE()) AS edad, edoCivil, estado, municipio FROM Panelista";
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

            $panelista = array('id' => (int)$row['id'], 'nombre' => $row['nombre'].' '.$row['apPaterno'].' '.$row['apMaterno'], 'genero' => (int)$row['genero'], 'edad' => (int)$row['edad'], 'edoCivil' => (int)$row['edoCivil'], 'municipio' => $row['municipio'], 'estado' => $row['estado'], 'checked' => $checked);
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
        $sql = "SELECT id, numPregunta, pregunta, tipo, video, imagen, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10 FROM Preguntas WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);

        $response = array();

        while ($row = $result->fetch_assoc()) {
            $pregunta = array('id' => (int)$row['id'], 'encuesta' => (int)$encuesta, 'numPregunta' => (int)$row['numPregunta'], 'pregunta' => $row['pregunta'], 'tipo' => $row['tipo'], 'video' => $row['video'], 'imagen' => $row['imagen'], 'op1' => $row['op1'], 'op2' => $row['op2'], 'op3' => $row['op3'], 'op4' => $row['op4'], 'op5' => $row['op5'], 'op6' => $row['op6'], 'op7' => $row['op7'], 'op8' => $row['op8'], 'op9' => $row['op9'], 'op10' => $row['op10']);
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
        $sql = "SELECT Panel.id, nombre, fechaInicio, fechaFin FROM Panel INNER JOIN PanelistaEnPanel ON Panel.id = PanelistaEnPanel.panel WHERE PanelistaEnPanel.panelista = '$panelista'";
        $result = $conn->query($sql);

        $paneles = array();

        while ($row = $result->fetch_assoc()) {
            $panelId = $row['id'];
            $sql2 = "SELECT id, nombre, fechaInicio, fechaFin FROM Encuesta WHERE panel = '$panelId'";
            $result2 = $conn->query($sql2);

            $encuestas = array();

            while ($row2 = $result2->fetch_assoc()) {
                $encuestaId = $row2['id'];
                $sql3 = "SELECT id, tipo, numPregunta, pregunta, video, imagen, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10 FROM Preguntas WHERE encuesta = '$encuestaId'";
                $result3 = $conn->query($sql3);

                $preguntas = array();

                while ($row3 = $result3->fetch_assoc()) {
                    $pregunta = array('id' => (int)$row3['id'], 'tipo' => (int)$row3['tipo'], 'numPregunta' => (int)$row3['numPregunta'], 'pregunta' => $row3['pregunta'], 'video' => $row3['video'], 'imagen' => $row3['imagen'], 'op1' => $row3['op1'], 'op2' => $row3['op2'], 'op3' => $row3['op3'], 'op4' => $row3['op4'], 'op5' => $row3['op5'], 'op6' => $row3['op6'], 'op7' => $row3['op7'], 'op8' => $row3['op8'], 'op9' => $row3['op9'], 'op10' => $row3['op10']);
                    $preguntas[] = $pregunta;
                }

                $contestada = FALSE;

                $sql4 = "SELECT id FROM Respuestas WHERE encuesta = '$encuestaId' AND panelista = '$panelista'";
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

        foreach ($panelistas as &$panelista) {
            $sql = "INSERT INTO PanelistaEnPanel (panelista, panel) VALUES ('$panelista', '$panel')";

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

function savePreguntasEncuesta ($encuesta, $preguntas) {
    $conn = connect();

    $inserts = 0;
    $errors = 0;
    $deletes = 0;

    if ($conn != null) {
        $sql = "SELECT * FROM Preguntas WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);
        $deletes = $result->num_rows;
        $sql = "DELETE FROM Preguntas WHERE encuesta = '$encuesta'";
        $result = $conn->query($sql);

        foreach ($preguntas as &$pregunta) {
            $tipo = $pregunta['tipo'];
            $numPregunta = $pregunta['numPregunta'];
            $preguntaText = $pregunta['pregunta'];
            $video = $pregunta['video'];
            $imagen = $pregunta['imagen'];
            $op1 = $pregunta['op1'];
            $op2 = $pregunta['op2'];
            $op3 = $pregunta['op3'];
            $op4 = $pregunta['op4'];
            $op5 = $pregunta['op5'];
            $op6 = $pregunta['op6'];
            $op7 = $pregunta['op7'];
            $op8 = $pregunta['op8'];
            $op9 = $pregunta['op9'];
            $op10 = $pregunta['op10'];

            $sql = "INSERT INTO Preguntas (encuesta, tipo, numPregunta, pregunta, video, imagen, op1, op2, op3, op4, op5, op6, op7, op8, op9, op10) VALUES ('$encuesta', $tipo, '$numPregunta', '$preguntaText', '$video', '$imagen', '$op1', '$op2', '$op3', '$op4', '$op5', '$op6', '$op7', '$op8', '$op9', '$op10')";

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

// -------------------------------
// Update
// -------------------------------

function updatePanelista ($id, $usenrame, $password, $nombre, $apellidos, $email, $genero, $fechaNacimiento, $educacion, $calleNumero, $colonia, $municipio, $estado, $cp) {
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

        $sql = "UPDATE Panelista SET username = '$username', password = '$password', nombre = '$nombre', apellidos = '$apellidos', email = '$email', genero = '$genero', fechaNacimiento = '$fechaNacimiento', educacion = '$educacion', calleNumero = '$calleNumero', colonia = '$colonia', municipio = '$municipio', estado = '$estado', cp = '$cp' WHERE id = '$id'";

        if ($conn->query($sql) === TRUE) {
            $conn->close();
            return array('status' => 'SUCCESS');
        }

        $conn->close();
        return array('status' => 'ERROR');
    }

    return array('status' => 'DATABASE_ERROR');
}

function updateUser ($id, $username, $password, $nombre, $apPaterno, $apMaterno, $email) {
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

        $sql = "UPDATE Usuario SET username = '$username', password = '$password', nombre = '$nombre', apPaterno = '$apPaterno', apMaterno = '$apMaterno', email = '$email' WHERE id = '$id'";

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

?>
