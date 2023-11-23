<?php

include "../connect.php";

$email = filterRequest('email');
$verify_code = filterRequest('verify_code');

$stmt = $con->prepare("UPDATE users SET user_approve= ? WHERE user_email = ? AND user_verify_code = ?");
$stmt->execute(array(1, $email, $verify_code));
$count = $stmt->rowCount();

if ($count > 0) {
    $stmt = $con->prepare("SELECT user_id,user_email,user_name  FROM users WHERE user_email = ? ");
    $stmt->execute(array($email));
    $count = $stmt->rowCount();
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($count > 0) {
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }
} else {
    echo json_encode(array("status" => "failure"));
}
