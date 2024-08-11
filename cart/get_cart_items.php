<?php
include '../connect.php';
$user_id = filterRequest('user_id');
$stmt = $con->prepare('SELECT cartView.*,cartView.items_price*cartView.items_discount/100 AS final_price FROM cartView WHERE cart_user_id =? AND cart_order = 0');
$stmt->execute(array($user_id));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("data" => $data));
} else {
    echo json_encode(array("data" => null));
}
