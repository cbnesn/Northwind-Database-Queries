select products.product_id, orders.customer_id, cast(TO_CHAR(date(orders.order_date), 'yyyy') as numeric) as "year",
cast(case when TO_CHAR(date(orders.order_date), 'yyyy') = '1999' 
	 then ((order_details.unit_price *quantity * (1-discount))) else 0 end as double precision) as "Year 1999" ,
cast(case when TO_CHAR(date(orders.order_date), 'yyyy') = '1998' 
	 then ((order_details.unit_price *quantity * (1-discount))) else 0 end as double precision) as "Year 1998" ,
cast(case when TO_CHAR(date(orders.order_date), 'yyyy') = '1997' 
	 then ((order_details.unit_price *quantity * (1-discount))) else 0 end as double precision) as "Year 1997" ,
cast(case when TO_CHAR(date(orders.order_date), 'yyyy') = '1996' 
	 then ((order_details.unit_price *quantity * (1-discount))) else 0 end as double precision) as "Year 1996" 

from products, orders, order_details, (select 1 as "Year 1999", 2 as "Year 1998", 3 as "Year 1997", 4 as "Year 1996",
									   sum(order_details.unit_price *quantity * (1-discount)) as lol from order_details, products, orders 
where products.product_id = order_details.product_id and orders.order_id = order_details.order_id) as extra_source 
where products.product_id = order_details.product_id and orders.order_id = order_details.order_id
group by products.product_id, orders.customer_id, order_details.quantity, "Year 1999", "Year 1998", "Year 1997", "Year 1996",
order_details.discount,orders.shipped_date, cast(TO_CHAR(date(orders.order_date), 'yyyy') as numeric),order_details.unit_price,orders.order_date
having products.product_id < 5 and left(orders.customer_id, 1) = 'E' 
order by "year"