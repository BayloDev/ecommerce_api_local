<?php
include '../connect.php';
$cart_ids = filterRequest('cart_ids');
$stmt = $con->prepare("DELETE FROM cart WHERE cart_id IN ($cart_ids) AND cart_order = 0");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}