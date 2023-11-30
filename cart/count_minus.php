<?php
include '../connect.php';
$cart_id = filterRequest('cart_id');

$stmt = $con->prepare('UPDATE cart SET cart_item_number = cart_item_number -1  WHERE cart_id = ?');
$stmt->execute(array($cart_id));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}
