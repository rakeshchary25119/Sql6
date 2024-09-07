
with distance_cte as (
    select round(sqrt(pow((p1.x - p2.x),2) + pow((p1.y - p2.y),2)),2) 
    as distance from point2d p1 join point2d p2 
    on (p1.x <= p1.x and p1.y > p2.y) or 
    (p1.x <= p2.x and p1.y < p2.y) or 
    (p1.x > p2.x and p1.y <= p2.y)
) select min(distance) shortest from distance_cte

---------------------------
select
    round(min(sqrt(pow((p2.x - p1.x),2) + 
    pow((p2.y - p1.y),2))),2) as shortest
from Point2D p1, Point2D p2
where (p1.x, p1.y) <> (p2.x,p2.y)
