<?php

include '../connect.php';

$email = filterRequest('email');
$verify_code = rand(10000, 99999);

$stmt = $con->prepare("SELECT user_email FROM users WHERE user_email = ? ");
$stmt->execute(array($email));
$count = $stmt->rowCount();
if ($count > 0) {
    $isCodeSent = sendEmail($email, "Reset Password", "Code : $verify_code");
  //  if ($isCodeSent) {
        $data = array('user_verify_code' => $verify_code);
        updateData('users', $data, "user_email='$email'");
    /// } else {
      //printFailure($messsage = 'code not sent');
//    }
} else {
    printFailure($messsage = 'user not found');
}
