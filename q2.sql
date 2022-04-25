select shipped_date, orders.order_id, sum(unit_price*quantity) as totalprice, extract(year from shipped_date) as year 
from orders, order_details

where orders.order_id = order_details.order_id

group by orders.order_id 
having (orders.shipped_date between '1997-12-30' and '1998-01-05') 
or 
((sum(unit_price*quantity) > 4000) and shipped_date is null )

order by orders.shipped_date asc
