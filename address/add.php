<?php
include '../connect.php';
$userId = filterRequest('userId');
$userPhone = filterRequest('userPhone');
$addressName = filterRequest('addressName');
$long = filterRequest('long');
$lat = filterRequest('lat');

$stmt = $con->prepare(
    "UPDATE users SET user_phone = ?, user_address_name = ?, user_address_long = ?, user_address_lat = ? WHERE user_id = ?"
);
$stmt->execute(array($userPhone, $addressName, $long, $lat, $userId));
$count = $stmt->rowCount();

if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}