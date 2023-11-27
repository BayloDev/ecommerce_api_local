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


 
CREATE OR REPLACE VIEW myFavorites AS
SELECT items.*, favorites.*
FROM items INNER JOIN favorites ON items.items_id = favorites.favorites_items_id

CREATE OR REPLACE VIEW cartView AS 
SELECT  items.*, cart.*,cart_item_number*items.items_price AS total_price
FROM items INNER JOIN cart ON items.items_id = cart.cart_item_id 
