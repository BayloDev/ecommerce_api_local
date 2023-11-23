<?php
$from_name = 'bilal';
$from_mail = 'bilalarbaoui3@gmail.com';
$replyto = 'bilalarbaoui3@gmail.com';
$uid = 'id21300774_bilal';
$body = 'Verify Code Ecommerce';
$content='code : 13678';
$header = "From: ".$from_name." <".$from_mail.">\r\n";
$header .= "Reply-To: ".$replyto."\r\n";
$header .= "MIME-Version: 1.0\r\n";
$header .= "Content-Type: multipart/mixed; boundary=\"".$uid."\"\r\n";
$header .= "--".$uid."\r\n";
$header .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
$header .= "Content-Transfer-Encoding: 8bit\r\n";
$header .= $body."\r\n";
$header .= "--".$uid."\r\n";
//$header .= "Content-Type: application/pdf; name=\"".$filename."\"\r\n"; 
$header .= "Content-Transfer-Encoding: base64\r\n";
//$header .= "Content-Disposition: attachment; filename=\"".$filename."\"\r\n";
$header .= $content."\r\n";
$header .= "--".$uid."--";
//$header = "\nFrom: ecommerce@support.com\nCC: ecommerce@support.com";
mail('baylo1557@gmail.com', 'Verify code', 'code : 1265', $header);
?>