SELECT cast('Customers' as text) as tablename,
customers.city, customers.company_name, customers.contact_name FROM products,order_details,orders, customers cross JOIN suppliers 
WHERE (order_details.order_id = orders.order_id 
and order_details.product_id = products.product_id
and products.supplier_id = suppliers.supplier_id
and customers.customer_id = orders.customer_id)
and (customers.contact_name LIKE '%w%' and suppliers.contact_name LIKE '%g%')
group by tablename, customers.city, customers.company_name, customers.contact_name  
union all
SELECT cast('Suppliers' as text) as tablename,
suppliers.city, suppliers.company_name, suppliers.contact_name FROM products,order_details,orders, suppliers cross JOIN customers 
WHERE (order_details.order_id = orders.order_id 
and order_details.product_id = products.product_id
and products.supplier_id = suppliers.supplier_id
and customers.customer_id = orders.customer_id)
and (customers.contact_name LIKE '%w%' and suppliers.contact_name LIKE '%g%')
group by tablename, suppliers.city, suppliers.company_name, suppliers.contact_name  
order by contact_name