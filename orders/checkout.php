<?php
include '../connect.php';
$orderUserId = filterRequest('orderUserId');
$orderAddress = filterRequest('orderAddress');
$orderPrice = filterRequest('orderPrice');
$orderDeliveryPrice = filterRequest('orderDeliveryPrice');
$orderCouponId = filterRequest('orderCouponId');
$orderPaymentMethod = filterRequest('orderPaymentMethod');
$timeNow = date("Y-m-d H:i:s");
if ($orderCouponId == '0') {
    $orderTotalPrice = $orderPrice + $orderDeliveryPrice;
    $data = array(
        'orders_user_id' => $orderUserId,
        'orders_address' => $orderAddress,
        'orders_price' => $orderPrice,
        'orders_delivery_price' => $orderDeliveryPrice,
        'orders_total_price' => $orderTotalPrice,
        'orders_coupon_id' => $orderCouponId,
        'orders_payment_method' => $orderPaymentMethod,
    );

    $count = insertData('orders', $data, false);
    if ($count > 0) {
        $stmt = $con->prepare("SELECT MAX(orders_id) FROM orders WHERE orders_user_id = ?");
        $stmt->execute(array($orderUserId));
        $maxOrderId = $stmt->fetchColumn();

        $data = array(
            'cart_order' => $maxOrderId,
        );
        updateData('cart', $data, "cart_user_id=$orderUserId AND cart_order=0");
    }
} else {
    $stmt = $con->prepare('SELECT coupon_discount FROM coupon WHERE coupon_id = ? AND coupon_expire_date > ? AND coupon_count > 0');
    $stmt->execute(array($orderCouponId, $timeNow));
    $couponDiscount = $stmt->fetch(PDO::FETCH_ASSOC);

    $count = $stmt->rowCount();

    if ($count > 0) {
        $orderTotalPrice = $orderPrice * (1 - $couponDiscount['coupon_discount'] / 100) + $orderDeliveryPrice;
        $data = array(
            'orders_user_id' => $orderUserId,
            'orders_address' => $orderAddress,
            'orders_price' => $orderPrice,
            'orders_delivery_price' => $orderDeliveryPrice,
            'orders_total_price' => $orderTotalPrice,
            'orders_coupon_id' => $orderCouponId,
            'orders_payment_method' => $orderPaymentMethod,
        );

        $count = insertData('orders', $data, false);
        if ($count > 0) {
            $stmt = $con->prepare("SELECT MAX(orders_id) FROM orders WHERE orders_user_id = ?");
            $stmt->execute(array($orderUserId));
            $maxOrderId = $stmt->fetchColumn();

            $data = array(
                'cart_order' => $maxOrderId,
            );
            updateData('cart', $data, "cart_user_id=$orderUserId AND cart_order=0",false);
            $data = array(
                'coupon_count' => 'coupon_count' - 1,
            );
            $stmt = $con->prepare("UPDATE coupon SET 'coupon_count' = 'coupon_count' - 1 WHERE coupon_id = $orderCouponId");
            $count = $stmt->rowCount();
            if ($count > 0) {
                echo  json_encode(array("status" => "success"));
            } else {
                echo  json_encode(array("status" => "failure"));
            }
        }
    } else {
        echo  json_encode(array("status" => "coupon failure"));
    }
}
