SELECT ItemsView.*,
       1 AS favorite
FROM ItemsView
       INNER JOIN favorites ON ItemsView.items_id = favorites.favorites_items_id
       AND favorites.favorites_user_id = 70
       AND ItemsView.categories_id = 1
UNION ALL
SELECT ItemsView.*,
       0 AS favorite
FROM ItemsView
WHERE ItemsView.categories_id = 1
       AND ItemsView.items_id NOT IN (
              SELECT ItemsView.items_id
              FROM ItemsView
                     INNER JOIN favorites ON ItemsView.items_id = favorites.favorites_items_id
                     AND favorites.favorites_user_id = 70
       ),


CREATE OR REPLACE VIEW itemsView AS
SELECT items.*, categories.*
FROM items INNER JOIN categories ON items.items_categories = categories.categories_id

CREATE OR REPLACE VIEW myFavorites AS
SELECT items.*, favorites.*
FROM items INNER JOIN favorites ON items.items_id = favorites.favorites_items_id

CREATE OR REPLACE VIEW cartView AS 
SELECT  items.*, cart.*,cart_item_number*(items.items_price*(1-items.items_discount/100)) AS total_price
FROM items INNER JOIN cart ON items.items_id = cart.cart_item_id WHERE cart_order=0

CREATE OR REPLACE VIEW ordersView AS 
SELECT orders.orders_id,orders.orders_user_id,orders.orders_total_price,orders.orders_date_time,orders.orders_status,cart.cart_item_number,items.items_name_en,items.items_name_ar,items.items_name_fr
FROM orders INNER JOIN cart ON orders.orders_id = cart.cart_order INNER JOIN items ON cart_item_id=items.items_id
