create table tmp_rfm_monetary_value
(
	user_id INT NOT NULL PRIMARY KEY,
	monetary_value INT NOT NULL CHECK(monetary_value >= 1 AND monetary_value <= 5)
);

INSERT INTO  tmp_rfm_monetary_value
WITH i as (
	select id, COALESCE(order_sum, 0) as order_sum, row_number() OVER (ORDER BY COALESCE(order_sum, 0))as ran from
	(
		SELECT vu.id, SUM(cost) as order_sum
		FROM view_user vu
		LEFT JOIN view_orders vo ON vu.id = vo.user_id
		LEFT JOIN view_orderstatuses vo2 ON vo.status = vo2.id
		WHERE key = 'Closed'
		group by vu.id
		order by order_sum DESC
	) tmp right join view_user vu2 using(id)		
)
SELECT id as user_id, order_sum,
  CASE
    WHEN ran <= (SELECT COUNT(*) FROM i) / 5 THEN 1
    WHEN ran > (SELECT COUNT(*) FROM i) / 5 AND ran <= 2 * (SELECT COUNT(*) FROM i) / 5 THEN 2
    WHEN ran > 2 * (SELECT COUNT(*) FROM i) / 5 AND ran <= 3 * (SELECT COUNT(*) FROM i) / 5 THEN 3
    WHEN ran > 3 * (SELECT COUNT(*) FROM i) / 5 AND ran <= 4 * (SELECT COUNT(*) FROM i) / 5 THEN 4
    ELSE 5
  END AS frequency
FROM i;

