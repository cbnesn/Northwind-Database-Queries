select order_id as orderid, unit_price*quantity as totalprice,
(unit_price*quantity*(1-discount)) as totalwithdiscountprice
from order_details
order by totalwithdiscountprice DESC
limit 10
;

