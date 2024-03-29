create table analysis.tmp_rfm_frequency
(
	user_id INT NOT NULL PRIMARY KEY,
	frequency INT NOT NULL CHECK(frequency >= 1 AND frequency <= 5)
);

INSERT INTO  analysis.tmp_rfm_frequency

WITH i as (
	select id, COALESCE(order_count, 0) as order_count, row_number() OVER (ORDER BY COALESCE(order_count, 0))as ran from
	(
		 SELECT vu.id, COUNT(*) as order_count
		 FROM analysis.view_user vu
		 LEFT JOIN analysis.view_orders vo ON vu.id = vo.user_id
		 LEFT JOIN analysis.view_orderstatuses vo2 ON vo.status = vo2.id
		 WHERE key = 'Closed'
		 group by vu.id
		 order by order_count desc
	) tmp right join analysis.view_user vu2 using(id)
)

SELECT id as user_id,
  CASE
    WHEN ran <= (SELECT COUNT(*) FROM i) / 5 THEN 1
    WHEN ran > (SELECT COUNT(*) FROM i) / 5 AND ran <= 2 * (SELECT COUNT(*) FROM i) / 5 THEN 2
    WHEN ran > 2 * (SELECT COUNT(*) FROM i) / 5 AND ran <= 3 * (SELECT COUNT(*) FROM i) / 5 THEN 3
    WHEN ran > 3 * (SELECT COUNT(*) FROM i) / 5 AND ran <= 4 * (SELECT COUNT(*) FROM i) / 5 THEN 4
    ELSE 5
  END AS frequency
FROM i;

