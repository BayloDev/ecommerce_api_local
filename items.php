<?php
include "connect.php";

$category_id = filterRequest('category_id');
$user_id = filterRequest('user_id');

$stmt = $con->prepare("SELECT itemsView.*, 1 AS favorite FROM itemsView 
INNER JOIN favorites ON 
favorites.favorites_items_id = itemsView.items_id AND favorites.favorites_user_id =? AND itemsView.categories_id =?
UNION ALL
SELECT itemsView.*, 0 AS favorite FROM itemsView WHERE itemsView.categories_id =? AND itemsView.items_id NOT IN (
SELECT itemsView.items_id  FROM itemsView INNER JOIN favorites ON favorites.favorites_items_id = itemsView.items_id 
WHERE favorites.favorites_user_id =? 
)");
$stmt->execute(array($user_id, $category_id, $category_id, $user_id));
$count = $stmt->rowCount();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
if ($count > 0) {
    echo json_encode(array('status' => 'success', 'data' => $data));
} else {
    echo json_encode(array('status' => 'failure'));
}