<?php
echo json_encode(sendMail($_POST['email'], $_POST['username'], $_POST['password']));

function sendMail($email, $nombre, $password){
	$to = $email;
	$subject = 'Focus - Recordatorio de Contraseña';
	$from = 'focus@no-reply.com';
	 
	// To send HTML mail, the Content-type header must be set
	$headers = 'From: me@gmail.com' . '\r\n' .
                'Reply-To: me@gmail.com' . '\r\n' .
                'X-Mailer: PHP/' . phpversion() . '\r\n' .
                'MIME-Version: 1.0\r\n' . '\r\n' .
                'Content-Type: text/html; charset=ISO-8859-1\r\n';
 
	// Compose a simple HTML email message
	$message = 'Buenas tardes señor ' . $nombre . "\n\n" . 'Le mandamos un cordial saludo por parte del grupo Focus. Le informamos que su contraseña es <strong>' . $password . '</strong> si usted no solicitó un recordatorio de contraseña, le suplicamos que haga caso omiso a este mensaje.' . "\n\n" . 'Agradecemos sinceramente su preferencia y ¡Le deseamos un excelente día!';
	$message = wordwrap($message, 70, "\r\n");

     $retval = mail ($to, $subject, $message, $header);
     
     if( $retval == true ) {
        return "Message sent successfully...";
     } else {
        return "Message could not be sent...";
     }
}
?>