<?php
include "../connect.php";
$email = filterRequest('email');
$password = sha1($_POST['password']);
$verify_code = rand(10000, 99999);

$stmt = $con->prepare('SELECT * FROM users WHERE user_email = ?');
$stmt->execute(array($email));
$count = $stmt->rowCount();
$data = $stmt->fetch(PDO::FETCH_ASSOC);
if ($count > 0) {
    if ($data['user_password'] == $password) {
        if ($data['user_approve'] == 1) {
            unset($data['user_password']);
            unset($data['user_date_create']);
            unset($data['user_verify_code']);
            unset($data['user_approve']);
            echo json_encode(array('status' => 'sign in success', 'data' => $data));
        } else {
            $data = array("user_verify_code" => $verify_code);
            sendEmail($email, 'Verify Code Ecommerce', "Code : $verify_code");
            $isCodelSent = sendEmail($email, 'Verify Code Ecommerce', "Code : $verify_code");
         //   if ($isCodelSent) {
                updateData('users', $data, "user_email ='$email'");
           // } else {
             //   printFailure('code not sent');
            //}
        }
    } else {
        echo printFailure($message = 'wrong password');
    }
} else {
    echo printFailure($message = 'user not found');
}
