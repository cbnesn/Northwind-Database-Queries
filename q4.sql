select orders.ship_name, orders.ship_country, orders.customer_id, orders.ship_name as company_name, 
concat(employees.first_name, ' ', employees.last_name) as salesperson, 
shippers.phone, products.product_id, products.product_name, orders.freight
from shippers, orders, order_details, products, employees
where employees.employee_id = orders.employee_id and order_details.order_id = orders.order_id and
	order_details.product_id = products.product_id and shippers.shipper_id = orders.ship_via and 
(
	right(orders.ship_country, 1) = 'y' and
	left(orders.customer_id, 1) = 'M' and
	orders.freight > 70
)
group by orders.ship_name, orders.ship_country, orders.customer_id, shippers.company_name, salesperson,
shippers.phone, products.product_id, orders.freight
order by ship_name asc