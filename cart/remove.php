<?php
include '../connect.php';
$cart_ids = filterRequest('cart_ids');
//print_r($cart_ids);
//$data = array(5834,5,654);
//print_r($data) ;
//$fields = implode(',', array_values($data));
//echo $fields;
$stmt = $con->prepare("DELETE FROM cart WHERE cart_id IN ($cart_ids) ");
$stmt->execute();
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "failure"));
}