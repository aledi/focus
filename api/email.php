<?php
echo json_encode(sendMail($_POST['email'], $_POST['username'], $_POST['password']));

function sendMail($email, $nombre, $password){
	$subject = 'Cambio de contraseña de panelista';
    $message = 'Buenas tardes señor ' . $nombre . "\n\n" . 'Le mandamos un cordial saludo por parte del grupo Focus. Le informamos que su contraseña es ' . $password . ' si usted no solicitó un recordatorio de contraseña, le suplicamos que haga caso omiso a este mensaje.' . "\n\n" . 'Agradecemos sinceramente su preferencia y ¡Le deseamos un excelente día!';
    $to = $email;
    $type = 'plain'; // or HTML
    $charset = 'utf-8';

    $mail     = 'no-reply@'.str_replace('www.', '', $_SERVER['SERVER_NAME']);
    $uniqid   = md5(uniqid(time()));
    $headers  = 'From: '.$mail."\n";
    $headers .= 'Reply-to: '.$mail."\n";
    $headers .= 'Return-Path: '.$mail."\n";
    $headers .= 'Message-ID: <'.$uniqid.'@'.$_SERVER['SERVER_NAME'].">\n";
    $headers .= 'MIME-Version: 1.0'."\n";
    $headers .= 'Date: '.gmdate('D, d M Y H:i:s', time())."\n";
    $headers .= 'X-Priority: 3'."\n";
    $headers .= 'X-MSMail-Priority: Normal'."\n";
    $headers .= 'Content-Type: multipart/mixed;boundary="----------'.$uniqid.'"'."\n\n";
    $headers .= '------------'.$uniqid."\n";
    $headers .= 'Content-type: text/'.$type.';charset='.$charset.''."\n";
    $headers .= 'Content-transfer-encoding: 7bit';

     $retval = mail ($to, $subject, $message, $header);
     
     if( $retval == true ) {
        return "Message sent successfully...";
     } else {
        return "Message could not be sent...";
     }
}
?>