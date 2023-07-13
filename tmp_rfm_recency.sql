
create table tmp_rfm_recency
(
	user_id INT NOT NULL PRIMARY KEY,
	recency INT NOT NULL CHECK(recency >= 1 AND recency <= 5)	
);

INSERT INTO  tmp_rfm_recency
WITH i AS 
(
    SELECT vu2.id, tmp2.ord, row_number() OVER (ORDER BY COALESCE(tmp2.ord, '0001-01-01') DESC) as ran
    FROM (
            SELECT id, order_ts AS ord
            FROM (
                SELECT vu.id, order_ts, row_number() OVER (PARTITION BY vu.id ORDER BY order_ts DESC) AS ran
                FROM view_user vu
                LEFT JOIN view_orders vo ON vu.id = vo.user_id
                LEFT JOIN view_orderstatuses vo2 ON vo.status = vo2.id
                WHERE key = 'Closed'
            ) tmp
            WHERE tmp.ran = 1
            ORDER BY tmp.order_ts DESC
         ) tmp2
    RIGHT JOIN view_user vu2 ON vu2.id = tmp2.id
    ORDER BY tmp2.ord DESC
)
SELECT id as user_id,
  CASE
    WHEN ran >= 1 AND ran <= (SELECT COUNT(*) FROM i) / 5 THEN 5
    WHEN ran > (SELECT COUNT(*) FROM i) / 5 AND ran <= 2 * (SELECT COUNT(*) FROM i) / 5 THEN 4
    WHEN ran > 2 * (SELECT COUNT(*) FROM i) / 5 AND ran <= 3 * (SELECT COUNT(*) FROM i) / 5 THEN 3
    WHEN ran > 3 * (SELECT COUNT(*) FROM i) / 5 AND ran <= 4 * (SELECT COUNT(*) FROM i) / 5 THEN 2
    ELSE 1
  END AS recency
FROM i;
