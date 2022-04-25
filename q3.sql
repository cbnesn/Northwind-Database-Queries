select categories.category_name, categories.category_id, products.product_name, products.product_id, 
products.unit_price, products.units_in_stock, products.units_on_order, products.reorder_level, products.discontinued
from categories, products

where categories.category_id = products.category_id and (products.reorder_level > 20 and products.units_on_order = 0 )

group by categories.category_name, categories.category_id, products.product_name, products.product_id

order by products.product_name ASC
