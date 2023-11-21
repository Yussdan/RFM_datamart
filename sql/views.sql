DROP MATERIALIZED view if exists analysis.view_OrderItems; 
create MATERIALIZED VIEW analysis.view_OrderItems AS (
	SELECT * FROM production.orderitems o 
);
DROP MATERIALIZED view if exists analysis.view_OrderStatuses; 
create MATERIALIZED VIEW analysis.view_OrderStatuses AS (
	SELECT * FROM production.orderstatuses o 
);
DROP MATERIALIZED view if exists analysis.view_Products; 
create MATERIALIZED VIEW analysis.view_Products AS (
	SELECT * FROM production.products p 
);
DROP MATERIALIZED view if exists analysis.view_Orders; 
create MATERIALIZED VIEW analysis.view_Orders AS (
	SELECT * FROM production.orders o 
);
DROP MATERIALIZED view if exists analysis.view_user; 
create MATERIALIZED VIEW analysis.view_user AS (
	SELECT * FROM production.users u
);
DROP MATERIALIZED view if exists analysis.view_orderstatuslog; 
create MATERIALIZED VIEW analysis.view_orderstatuslog AS (
	SELECT * FROM production.orderstatuslog u
); 
 /* для перерасчета view_orders в запросе orders_view.sql /*

/* хоть в задаче и сказано что обновлять витрину не надо, я подумал если вдруг значения в схеме product изменятся можно будет проще обновить view-ки/*
