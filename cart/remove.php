<?php
include '../connect.php';
//$cart_ids = filterRequest('cart');
$data = array(23, 45, 43);
foreach ($data as $field => $v) {
    $fields = implode(',', array_values($data));
}
$stmt = $con->prepare("DELETE FROM cart WHERE cart_id IN ($field) ");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}
