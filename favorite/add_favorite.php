<?php
include '../connect.php';
$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');
$data = array(
    'favorites_items_id' => $item_id,
    'favorites_user_id' => $user_id,
);
insertData('favorites', $data);
