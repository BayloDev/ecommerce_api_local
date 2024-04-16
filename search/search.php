<?php
include '../connect.php';
$search = filterRequest('search');
$searchLike='%'.$search.'%';
$stmt = $con->prepare("SELECT * FROM itemsView 
WHERE itemsView.items_name_en LIKE ? 
   OR itemsView.items_name_ar LIKE ? 
   OR itemsView.items_name_fr LIKE ?
");
$stmt->execute(array($searchLike,$searchLike,$searchLike));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();
if ($count > 0) {
    echo json_encode(array("data" => $data));
} else {
    echo json_encode(array("data" => null));
}
