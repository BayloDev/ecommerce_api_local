<?php
include "../connect.php";
$couponName = filterRequest('couponName');
$timeNow = date("Y-m-d H:i:s");
$stmt = $con->prepare('SELECT * FROM coupon WHERE coupon_name = ? AND coupon_expire_date > ? AND coupon_count > 0');
$stmt->execute(array($couponName, $timeNow));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if ($count > 0) {
    echo  json_encode(array("status" => "success", "data" => $data));
} else {
    echo  json_encode(array("status" => "failure"));
}
