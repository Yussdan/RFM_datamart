INSERT into analysis.dm_rfm_segments
select * from 
analysis.tmp_rfm_frequency inner join analysis.tmp_rfm_monetary_value using(user_id)
inner join analysis.tmp_rfm_recency using(user_id)
ORDER BY user_id
user id | frequency | monetary_value | recency      
0	    |3          |4               |1
1	    |3          |3               |4
2	    |3          |5               |2
3	    |3          |3               |2
4	    |3          |3               |4
5	    |5          |5               |5
6	    |3          |5               |1
7	    |2          |2               |4
8	    |1          |3               |1
9	    |3          |2               |1
10	    |5          |2               |3


