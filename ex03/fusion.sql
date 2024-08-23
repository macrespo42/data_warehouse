SELECT customers.event_time, 
  customers.event_type,
  customers.product_id,
  customers.price,
  customers.user_id,
  customers.user_session,
  item.category_id as item_category_id,
  item.category_code as item_category_code,
  item.brand as item_brand
FROM customers
LEFT JOIN item ON customers.product_id = item.product_id;
