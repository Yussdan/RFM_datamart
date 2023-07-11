create MATERIALIZED VIEW view_OrderItems AS (
	SELECT * FROM production.orderitems o 
);
create MATERIALIZED VIEW view_OrderStatuses AS (
	SELECT * FROM production.orderstatuses o 
);
create MATERIALIZED VIEW view_Products AS (
	SELECT * FROM production.products p 
);
create MATERIALIZED VIEW view_Orders AS (
	SELECT * FROM production.orders o 
);