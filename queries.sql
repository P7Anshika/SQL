select * from sales;

select SaleDate, Amount,Boxes, Amount / Boxes 'Amount per Box' from sales;

select SaleDate, Amount, PID, geoid from sales 
where geoid='g1'
order by PID, Amount desc;

select SaleDate, Amount, PID,boxes,  geoid from sales 
where boxes between 0 and 50;

select * from people;

Select * from people where salesperson like '%B%';  


select SaleDate, Amount,
	case when amount < 1000 then 'under1k'
		when Amount<5000  then 'under 5k'
	else'more'
end as 'category'
from sales;






