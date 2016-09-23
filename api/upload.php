<?php

function uploadFile($name, $tipo) {
    $target_dir = '../resources/'.($tipo == 1 ? 'images/' : 'videos/');
    $target_file = $target_dir.$name;
    $fileType = pathinfo($target_file, PATHINFO_EXTENSION);

    if (file_exists($target_file)) {
        return array('status' => 'RESOURCE_EXISTS');
    }

    // Check file size to 25MB
    if ($_FILES['file']['size'] > 26214400) {
        return array('status' => 'SIZE');
    }

    if($fileType != 'jpg' && $fileType != 'png' && $fileType != 'mp4' ) {
        return array('status' => 'FORMAT');
    }

    if (move_uploaded_file($_FILES['file']['tmp_name'], $target_file)) {
        chmod($target_file, 0777);
        return array('status' => 'SUCCESS');
    } else {
        return array('status' => 'ERROR');
    }
}

?>
