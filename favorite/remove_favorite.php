<?php
include '../connect.php';
$user_id = filterRequest('user_id');
$item_id = filterRequest('item_id');

deleteData('favorites', "favorites_user_id = '$user_id' AND favorites_items_id = '$item_id'");
