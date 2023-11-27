<?php
include '../connect.php';
$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$stmt = $con->prepare('SELECT cart_item_number FROM cart WHERE cart_user_id = ? AND cart_item_id = ?');
$stmt->execute(array($user_id, $item_id));
$data = $stmt->fetch(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("count" => $data));
} else {
    echo json_encode(array("count" => 0));
}
