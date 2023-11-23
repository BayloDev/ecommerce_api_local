<?php
include "../connect.php";
$email = filterRequest('email');
$verify_code = filterRequest('verify_code');

$stmt = $con->prepare('SELECT user_email FROM users WHERE user_email = ? AND user_verify_code = ?');
$stmt->execute(array($email, $verify_code));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array('status' => 'success'));
} else {
    printFailure();
}
