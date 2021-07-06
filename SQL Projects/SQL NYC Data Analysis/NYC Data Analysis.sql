-- Show all databases
show databases;

-- Create database projects
create database projects;

-- Connecting to the database projects
use projects;

-- Show all tables in projects database
show tables;


-- SQL NYC Data Analysis


-- Selecting NYC_1 with all columns imported from csv file
select * from nyc_1;

-- Selecting NYC_2 with all columns imported from csv file
select * from nyc_2;


-- SQL Query


-- Q1. write query to show name from NYC_1
select name 
from nyc_1;

-- Q2. write query to show count of id in nyc_1
select count(id) as Count_Of_Id 
from nyc_1;

-- Q3. write query to show count of id in nyc_2
select count(id) as Count_Of_Id 
from nyc_2;

-- Q4. write query to show host id in nyc_1
select host_id 
from nyc_1;

-- Q5. write query to show all unique host id from nyc_1
select distinct host_id
from nyc_1;

-- Q6. write query to show all unique neighbourhood_group from nyc_1
select distinct neighbourhood_group
from nyc_1;

-- Q7. write query to show all unique neighbourhood from nyc_1
select distinct neighbourhood
from nyc_1;

-- Q8. write query to show room_type from nyc_1
select room_type*
from nyc_1;

-- Q9. write query to show all values of Brooklyn & Manhattan from nyc_1
select *
from nyc_1
where neighbourhood_group in ('Brooklyn','Manhattan');

-- Q10. write query to show unique value of room type from nyc_1
select distinct room_type
from nyc_1;

-- Q11. write query to show maximum price from nyc_2
select max(price) as Maximum_Price
from nyc_2 ;

-- Q12. write query to show maximum price from nyc_2
select min(price) as Minimum_Price
from nyc_2 ;

-- Q13. write query to show average price from nyc_2
select avg(price) as Average_Price
from nyc_2 ;

-- Q14. write query to show minimum value of minimum_nights from nyc_2
select min(minimum_nights) as Minimum_Night_Value
from nyc_2 ;

-- Q15. write query to show maximum value of minimum_nights from nyc_2
select max(minimum_nights) as Maximum_Night_Value
from nyc_2 ;

-- Q16. write query to show average availability_365
select avg(availability_365) as Average_Availability_365
from nyc_2 ;

-- Q17. write query to show id , availability_365 and all availability_365 value is greater than 300
select id,availability_365
from nyc_2
where availability_365 > 300;

-- Q18. write query to show count of id where price is in between 300 to 400
select count(id) as Total_Value 
from nyc_2
where price between 300 and 400;

-- Q19. write query to show count of id where minimum_nights spend is less than 5
select count(id) as Total_Value 
from nyc_2
where minimum_nights < 5;

-- Q20. write query to show count where minimum_nights spend is greater than 100
select count(id) as Total_Value 
from nyc_2
where minimum_nights > 100;

-- Q21. write query to show all data of nyc_1 & nyc_2
select * 
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id; 

-- Q22. write query to show host name and price
select n1.host_name, n2.price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- Q23. write query to show room_type and price
select n1.room_type, n2.price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- Q24. write query to show neighbourhood_group&minimum_nights spend
select n1.neighbourhood_group, n2.minimum_nights
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- Q25. write query to show neighbourhood & availability_365
select n1.neighbourhood, n2.availability_365
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id;

-- Q26. write query to show total price by neighbourhood_group
select n1.neighbourhood_group,sum(n2.price) as Total_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood_group;

-- Q27. write query to show maximum price by neighbourhood_group
select n1.neighbourhood_group,max(n2.price) as Maximum_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood_group;

-- Q28. write query to show maximum night spend by neighbourhood_group
select n1.neighbourhood_group,max(n2.minimum_nights) as Maximum_Night_Spend
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood_group;

-- Q29. write query to show maximum reviews_per_month spend by neighbourhood
select n1.neighbourhood,max(n2.reviews_per_month) as Maximum_Reviews_Per_Month
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood;

-- Q30. write query to show maximum price by room type
select n1.room_type,max(n2.price) as Maximum_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- Q31. write query to show average number_of_reviews by room_type
select n1.room_type,avg(n2.number_of_reviews) as Average_No_Of_Reviews
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- Q32. write query to show average price by room type
select n1.room_type,avg(n2.price) as Average_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- Q33. write query to show average night spend by room type
select n1.room_type,avg(n2.minimum_nights) as Average_Night_Spend
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type;

-- Q34. write query to show average price by room type but average price is less than 100
select n1.room_type,avg(n2.price) as Average_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type
having Average_Price < 100;

-- Q35. write query to show average night by neighbourhood and average_nights is greater than 5
select n1.neighbourhood,avg(n2.minimum_nights) as Average_Night_Spend
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood
having Average_Night_Spend > 5;

-- Q36. write query to show all data from nyc_1 and price is greater than 200 using sub-query
select n1.*
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n2.price in (select price from nyc_2 where price > 200);

-- Q37. write query to show all values from nyc_2 table and host id is 314941
select n2.*
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n1.host_id = 314941;

-- Q38. Find all pairs of id having the same host id, each pair coming once only
select distinct n.id
from nyc_1 n,nyc_1 n1
where n.host_id = n1.host_id;

-- Q39. write sql query to show fetch all records that have the term cozy in name
select * 
from nyc_1
where name like '%cozy%';

-- Q40. write query to show price host id neighbourhood_group of manhattanneighbourhood_group
select n2.price,n1.host_id,n1.neighbourhood_group
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n1.neighbourhood_group = 'Manhattan';

-- Q41. write query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood also price is greater than 100
select n1.id,n1.host_name,n1.neighbourhood,n2.price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n2.price > 100 and n1.neighbourhood in ('Upper West Side','Williamsburg');

-- Q42. write query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select n1.id,n1.host_name,n1.neighbourhood,n2.price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n1.host_name = 'Elise' and n1.neighbourhood = 'Bedford-Stuyvesant';

-- Q43. write query to show host_name,availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select n1.host_name,n2.availability_365,n2.minimum_nights
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n2.availability_365 > 100 and n2.minimum_nights > 100;

-- Q44. write query to show to fetch id ,host_name , number_of_reviews, and reviews_per_month but show only that records where number of reviews are 500+ and review per month is 5+
select n1.id,n1.host_name,n2.number_of_reviews,n2.reviews_per_month
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n2.number_of_reviews > 500 and n2.reviews_per_month > 5;

-- Q45. write query to show neighbourhood_group which have most total number of review
select n1.neighbourhood_group,sum(n2.number_of_reviews) as Total_Reviews
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.neighbourhood_group
limit 1;

-- Q46. write query to show host name which have most cheaper total price
select n1.host_name,sum(n2.price) as Total_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.host_name
order by Total_Price asc limit 1;

-- Q47. write query to show host name which have most costly total price
select n1.host_name,sum(n2.price) as Total_Price
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.host_name
order by Total_Price desc limit 1;

-- Q48. write query to show host name which have max price using sub-query
select n1.host_name
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n2.price = (select max(price) from nyc_2);

-- Q49. write query to show neighbourhood_group which price are less than 100
select n1.neighbourhood_group
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
where n2.price < 100;

-- Q50. write query to find max price, average availability_365 for each room type and order in ascending by maximum price
select n1.room_type,max(n2.price) as Maximum_Price,avg(n2.availability_365) as Average_availability_365 
from nyc_1 n1 inner join nyc_2 n2
on n1.id = n2.id
group by n1.room_type
order by Maximum_Price asc;
