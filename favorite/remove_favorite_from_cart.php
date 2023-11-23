<?php
include '../connect.php';
$favorites_id = filterRequest('favorites_id');
deleteData('favorites', "favorites_id = '$favorites_id'");
