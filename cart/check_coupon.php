<?php
include "../connect.php";
$couponName = filterRequest('couponName');

$stmt = $con->prepare('SELECT * FROM coupon WHERE coupon_name = ?');
$stmt->execute(array($couponName));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if ($count > 0) {
    echo  json_encode(array("status" => "success", "data" => $data));
} else {
    echo  json_encode(array("status" => "failure"));
}
