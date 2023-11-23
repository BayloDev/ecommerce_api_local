<?php
include "../connect.php";
$username = filterRequest('username');
$email = filterRequest('email');
$password = sha1($_POST['password']);
$verify_code = rand(10000, 99999);

$stmt = $con->prepare('SELECT * FROM users WHERE user_email = ?');
$stmt->execute(array($email));
$count = $stmt->rowCount();

if ($count > 0) {
    printFailure('email already exists');
} else {
    $isCodelSent = sendEmail($email, 'Verify Code Ecommerce', "Code : $verify_code");
 // if ($isCodelSent) {
    $data = array(
        "user_name" => $username,
        "user_email" => $email,
        "user_password" => $password,
        "user_verify_code" => $verify_code,
    );
    insertData("users", $data);
 //} else {
   //  printFailure($message='code not sent');
    //}
}