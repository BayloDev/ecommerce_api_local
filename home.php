<?php
include 'connect.php';

$allData = array();
$categories = getAllData('categories', null, null, false);
if ($categories == null) {
    echo json_encode(array("status" => "failure"));
} else {
    $items = getAllData('itemsView', "items_discount !=0", null, false);
    if ($items == null) {
        $stmt = $con->prepare("SELECT itemsView.* 
        FROM  itemsView INNER JOIN favorites ON itemsView.items_id=favorites.favorites_items_id ORDER BY itemsView.items_discount DESC LIMIT 20
        ");
        $stmt->execute();
        $count = $stmt->rowCount();
        $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
        if ($count > 0) {
            echo json_encode(array("status" => "success", "categories" => $categories, "items" => $items),);
        } else {
            $stmt = $con->prepare("SELECT itemsView.* FROM itemsView ORDER BY itemsView.items_date_time DESC LIMIT 20
            ");
            $stmt->execute();
            $count = $stmt->rowCount();
            $items = $stmt->fetchAll(PDO::FETCH_ASSOC);
            if ($count > 0) {
                echo json_encode(array("status" => "success", "categories" => $categories, "items" => $items));
            } else {
                  echo json_encode(array("status" => "success", "categories" => $categories, "items" => null));
            }
        }
    } else {
        echo json_encode(array("status" => "success", "categories" => $categories, "items" => $items),);
    }
}
