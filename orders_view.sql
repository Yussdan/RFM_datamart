DROP MATERIALIZED VIEW view_Orders;
create MATERIALIZED VIEW view_Orders AS
(
    SELECT * FROM production.orders o  
    inner join (
        select order_id, status_id as stat from
        (
            select * , row_number() over(partition by order_id order by dttm desc) as ran from view_orderstatuslog
        ) tmp 
        where ran=1
    ) tmp USING(order_id)
)