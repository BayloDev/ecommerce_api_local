<?php
include '../connect.php';
$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');

$stmt = $con->prepare('DELETE FROM cart WHERE cart_user_id = ? AND cart_item_id = ?');
$stmt->execute(array($user_id, $item_id));
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}
