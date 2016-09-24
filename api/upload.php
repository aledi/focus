<?php

function uploadFile($name, $tipo) {
    $target_dir = '../resources/'.($tipo == 1 ? 'images/' : 'videos/');
    $target_file = $target_dir.$name;
    $fileType = pathinfo($target_file, PATHINFO_EXTENSION);

    if (file_exists($target_file)) {
        return array('status' => 'ERROR', 'reason' => 'El archivo ya existe, favor de asignar un nuevo nombre.');
    }

    // Check file size to 25MB
    if ($_FILES['file']['size'] > 26214400) {
        return array('status' => 'ERROR', 'reason' => 'El archivo es muy grande!.');
    }

    if($fileType != 'jpg' && $fileType != 'png' && $fileType != 'mp4' ) {
        return array('status' => 'ERROR', 'reason' => 'Formato no disponible, favor de usar solamente .jpg, .png, o .mp4');
    }

    if (move_uploaded_file($_FILES['file']['tmp_name'], $target_file)) {
        chmod($target_file, 0777);
        return array('status' => 'SUCCESS');
    } else {
        return array('status' => 'ERROR', 'reason' => 'Alta fallida, favor de intentar de nuevo.');
    }
}

?>
