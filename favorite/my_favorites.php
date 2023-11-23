<?php
include '../connect.php';
$user_id = filterRequest('user_id');
getAllData('myFavorites', "favorites_user_id = ?", array($user_id));
