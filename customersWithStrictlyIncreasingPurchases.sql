with customer_cte as (
    select customer_id, year(order_date) yr, 
    sum(price) price from orders 
    group by customer_id, year(order_date)
)
select c1.customer_id from customer_cte c1 
left join  customer_cte c2 on
c1.customer_id = c2.customer_id and  
c1.yr + 1 = c2.yr and 
c2.price > c1.price 
group by c1.customer_id 
having count(c1.customer_id) - count(c2.customer_id) = 1
 

-- having clause is used to remove single entries present in the table