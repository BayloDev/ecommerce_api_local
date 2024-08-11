<?php
include '../connect.php';
$userId = filterRequest('userId');
getAllData('ordersView', "orders_user_id=$userId");
