select extract(year from shipped_date) as shippedyear, category_name, 
cast (cast( floor ( sum(order_details.unit_price* order_details.quantity *(1 - order_details.discount )*100) )/100 as decimal(10,2)) as numeric) as categorysales
from categories, orders, order_details, products
where order_details.order_id = orders.order_id 
and categories.category_id = products.category_id 
and order_details.product_id = products.product_id
and (orders.shipped_date > '1997-06-01' )
group by category_name, shippedyear 
order by shippedyear asc, categories.category_name desc