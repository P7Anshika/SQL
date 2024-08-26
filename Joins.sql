select * from sales;

select * from people;

select s.SaleDate, s.Amount, p.salesperson, s.SPID, p.spid
from  sales as s
join people as p on p.SPID =s.SPID;

select s.SaleDate , s.Amount, s.pid, pr.product
from sales as s
join products as pr on pr.PID = s.PID;

select s.Saledate, s.Amount, pr.product, p.salesperson, p.team
from sales as s
join people as p on p.SPID= s.SPID
join products as pr on pr.PID=s.PID;

select s.SaleDate, s.Amount, pr.product, p.team
from sales as s
join people as p on p.SPID=s.SPID
join products as pr on pr.PID=s.PID
where amount <500
and  p.team in('Delish');

select geoID, sum(amount), sum(boxes), avg(amount)
from sales 
group by geoID;

select * from geo;

select g.Geo, sum(amount), sum(boxes) , avg(amount)
from sales as s 
join geo as g on g.GeoID=s.GeoID
group by g.Geo;

select pr.category, p.team, sum(boxes), sum(amount)
from sales as s
join people as p on s.SPID=s.SPID
join products as pr on pr.PID=s.PID
group by pr.category, p.team;

select pr.category, p.team, sum(boxes), sum(amount)
from sales as s
join people as p on s.SPID=s.SPID
join products as pr on pr.PID=s.PID
group by pr.category, p.team
order by pr.category, p.team;