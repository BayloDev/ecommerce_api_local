<?php
include '../connect.php';
$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$item_number = filterRequest('item_number');

$stmt = $con->prepare('UPDATE cart SET cart_item_number = ? WHERE cart_user_id = ? AND cart_item_id = ?');
$stmt->execute(array($item_number, $user_id, $item_id));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}
