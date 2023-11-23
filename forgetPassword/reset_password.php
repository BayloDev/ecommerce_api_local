<?php
include "../connect.php";

$email = filterRequest('email');
$password = sha1($_POST['password']);

$stmt = $con->prepare('SELECT * FROM users WHERE user_email = ? AND user_password = ?');
$stmt->execute(array($email, $password));
$count = $stmt->rowCount();

if ($count > 0) {
    printFailure($message = 'old password');
} else {
    $data = array('user_password' => $password);
    updateData('users', $data, "user_email='$email'");
}
