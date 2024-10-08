<?php
include '../connect.php';
$cart_user_id = filterRequest('user_id');
$cart_item_id = filterRequest('item_id');
$item_count = filterRequest('item_count');
$stmt = $con->prepare('SELECT cart_item_number,cart_id FROM cart WHERE cart_user_id = ? AND cart_item_id = ? AND cart_order = 0');
$stmt->execute(array($cart_user_id, $cart_item_id));
$data = $stmt->fetch(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {

    $stmt = $con->prepare('UPDATE cart SET cart_item_number = ? WHERE cart_id = ?');
    $stmt->execute(array($item_count, $data['cart_id']));
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
} else {
    $stmt = $con->prepare("INSERT INTO cart (cart_user_id,cart_item_id,cart_item_number) VALUES (?,?,?)");
    $stmt->execute(array($cart_user_id, $cart_item_id, $item_count));
    $count = $stmt->rowCount();
    if ($count > 0) {
        echo json_encode(array("status" => "success"));
    } else {
        echo json_encode(array("status" => "failure"));
    }
}
