(	
	select product_name, unit_price
	from products
	order by unit_price asc 
	limit 5
)
union all
(
	select product_name, unit_price
	from products
	order by unit_price desc 
	limit 5
)

order by unit_price desc

