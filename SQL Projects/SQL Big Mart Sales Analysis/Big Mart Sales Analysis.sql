-- Show all databases
show databases;

-- Create database projects
create database projects;

-- Connecting to the database projects
use projects;

-- Show all tables in projects database
show tables;


-- SQL Big Mart Sales Analysis


-- Selecting big_mart with all columns imported from csv file
select * from big_mart;


-- SQL Query


-- Q1. WRITE a sql query to show all Item_Identifier
select Item_Identifier 
from big_mart;

-- Q2. WRITE a sql query to show count of total Item_Identifier
select count(Item_Identifier) as Count_Of_Item_Identifier 
from big_mart;

-- Q3. WRITE a sql query to show maximum Item Weight
select max(Item_Weight) as Maximum_Item_Weight 
from big_mart;

-- Q4. WRITE a query to show minimum Item Weight
select min(Item_Weight) as Minimum_Item_Weight 
from big_mart;

-- Q5. WRITE a query to show average Item_Weight
select avg(Item_Weight) as Average_Item_Weight 
from big_mart;

-- Q6. WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Low Fat
select count(Item_Fat_Content) as Count_Of_Item_Fat_Identifier 
from big_mart
where Item_Fat_Content = "Low Fat";

-- Q7. WRITE a query to show count OF Item_Fat_Content WHERE Item_Fat_Content IS Regular
select count(Item_Fat_Content) as Count_Of_Item_Fat_Identifier 
from big_mart
where Item_Fat_Content = "Regular";

-- Q8. WRITE a query TO show maximum Item_MRP
select max(Item_MRP) as Maximum_Item_MRP
from big_mart;

-- Q9. WRITE a query TO show minimum Item_MRP
select min(Item_MRP) as Minimum_Item_MRP
from big_mart;

-- Q10. WRITE a query to show Item_Identifier , Item_Fat_Content ,Item_Type,Item_MRP and Item_MRP IS greater than 200
select Item_Identifier,Item_Fat_Content,Item_Type,Item_MRP
from big_mart
where Item_MRP > 200;

-- Q11. WRITE a query to show maximum Item_MRP WHERE Item_Fat_Content IS Low Fat
select max(Item_MRP) as Maximum_Item_MRP
from big_mart
where Item_Fat_Content = 'Low Fat';

-- Q12. WRITE a query to show minimum Item_MRp AND Item_Fat_Content IS Low Fat
select min(Item_MRP) as Minimum_Item_MRP
from big_mart
where Item_Fat_Content = 'Low Fat';

-- Q13. WRITE a query to show ALL DATA WHERE item MRP IS BETWEEN 50 TO 100
select * 
from big_mart 
where Item_MRP between 50 and 100;

-- Q14. WRITE a query to show ALL UNIQUE value Item_Fat_Content
select distinct Item_Fat_Content 
from big_mart;

-- Q15. WRITE a query to show ALL UNIQUE value Item_Type
select distinct Item_Type
from big_mart;

-- Q16. WRITE a query to show ALL DATA IN descending ORDER BY Item MRP
select * 
from big_mart
order by Item_MRP desc;

-- Q17. WRITE a query to show ALL DATA IN ascending ORDER BY Item_Outlet_Sales
select * 
from big_mart
order by Item_Outlet_Sales asc;

-- Q18. WRITE a query to show ALL DATA IN ascending BY Item_Type
select * 
from big_mart
order by Item_Type asc;

-- Q19. WRITE a query to show DATA OF item_type dairy & Meat
select *
from big_mart
where Item_Type in ('Dairy','Meat');

-- Q20. WRITE a query to show ALL UNIQUE value OF Outlet_Size
select distinct Outlet_Size
from big_mart;

-- Q21. WRITE a query to show ALL UNIQUE value OF Outlet_Location_Type
select distinct Outlet_Location_Type 
from big_mart;

-- Q22. WRITE a query to show ALL UNIQUE value OF Outlet_Type
select distinct Outlet_Type
from big_mart;

-- Q23. WRITE a query to show count NO. OF item BY Item_Type AND ordered it IN descending
select Item_Type,count(*) as No_Of_Items
from big_mart
group by Item_Type
order by No_Of_Items desc;

-- Q24. WRITE a query to show count NO. OF item BY Outlet_Size AND ordered it IN ascending
select Outlet_Size,count(*) as No_Of_Items
from big_mart
group by Outlet_Size
order by No_Of_Items asc;

-- Q25. WRITE a query to show count NO. OF item BY Outlet_Establishment_Year AND ordered it IN ascending
select Outlet_Establishment_Year,count(*) as No_Of_Items
from big_mart
group by Outlet_Establishment_Year
order by No_Of_Items asc;

-- Q26. WRITE a query to show count NO. OF item BY Outlet_Type AND ordered it IN descending
select Outlet_Type,count(*) as No_Of_Items
from big_mart
group by Outlet_Type 
order by No_Of_Items desc;

-- Q27. WRITE a query to show count of item BY Outlet_Location_Type AND ordered it IN descending
select Outlet_Location_Type,count(*) as No_Of_Items
from big_mart
group by Outlet_Location_Type
order by No_Of_Items desc;

-- Q28. WRITE a query to show maximum MRP BY Item_Type
select Item_Type,max(Item_MRP) as Maximum_MRP
from big_mart
group by Item_Type;

-- Q29. WRITE a query to show minimum MRP BY Item_Type
select Item_Type,min(Item_MRP) as Minimum_MRP
from big_mart
group by Item_Type;

-- Q30. WRITE a query to show minimum MRP BY Outlet_Establishment_Year AND ordered it IN descending
select Outlet_Establishment_Year,min(Item_MRP) as Minimum_MRP
from big_mart
group by Outlet_Establishment_Year
order by Minimum_MRP desc;

-- Q31. WRITE a query to show maximum MRP BY Outlet_Establishment_Year AND ordered IN descending
select Outlet_Establishment_Year,max(Item_MRP) as Maximum_MRP
from big_mart
group by Outlet_Establishment_Year
order by Maximum_MRP desc;

-- Q32. WRITE a query to show average MRP BY Outlet_Size AND ordered IN descending
select Outlet_Size,avg(Item_MRP) as Average_MRP
from big_mart
group by Outlet_Size
order by Average_MRP desc;

-- Q33. WRITE a query to show average MRP BY Outlet_Size
select Outlet_Size,avg(Item_MRP) as Average_MRP
from big_mart
group by Outlet_Size;

-- Q34. WRITE a query to show Average MRP BY Outlet_Type AND ordered IN ascending
select Outlet_Type,avg(Item_MRP) as Average_MRP
from big_mart
group by Outlet_Type
order by Average_MRP asc;

-- Q35. WRITE a query to show maximum MRP BY Outlet_Type
select Outlet_Type,max(Item_MRP) as Maximun_MRP
from big_mart
group by Outlet_Type;

-- Q36. WRITE a query to show maximum Item_Weight BY Item_Type
select Item_Type,max(Item_Weight) as Maximum_Item_Weight
from big_mart
group by Item_Type;

-- Q37. WRITE a query to show maximum Item_Weight BY Outlet_Establishment_Year
select Outlet_Establishment_Year,max(Item_Weight) as Maximum_Item_Weight
from big_mart
group by Outlet_Establishment_Year;

-- Q38. WRITE a query to show minimum Item_Weight BY Outlet_Type
select Outlet_Type,min(Item_Weight) as Minimum_Item_Weight
from big_mart
group by Outlet_Type;

-- Q39. WRITE a query to show average Item_Weight BY Outlet_Location_Type ORDER BY descending
select Outlet_Location_Type,avg(Item_Weight) as Average_Item_Weight 
from big_mart
group by Outlet_Location_Type
order by Average_Item_Weight desc;

-- Q40. WRITE a query to show maximum Item_Outlet_Sales BY Item_Type
select Item_Type,max(Item_Outlet_Sales) as Maximum_Item_Outlet_Sales
from big_mart
group by Item_Type;

-- Q41. WRITE a query to show minimum Item_Outlet_Sales BY Item_Type
select Item_Type,min(Item_Outlet_Sales) as Minimum_Item_Outlet_Sales
from big_mart
group by Item_Type;

-- Q42.WRITE a query to show minimum Item_Outlet_Sales BY Outlet_Establishment_Year
select Outlet_Establishment_Year,min(Item_Outlet_Sales) as Minimum_Item_Outlet_Sales
from big_mart
group by Outlet_Establishment_Year;

-- Q43. WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Establishment_Year ordered BY descending
select Outlet_Establishment_Year,max(Item_Outlet_Sales) as Maximum_Item_Outlet_Sales
from big_mart
group by Outlet_Establishment_Year
order by Maximum_Item_Outlet_Sales desc;

-- Q44. WRITE a query to show average Item_Outlet_Sales BY Outlet_Size AND ORDER it itn descending
select Outlet_Size,avg(Item_Outlet_Sales) as Average_Item_Outlet_Sales
from big_mart
group by Outlet_Size
order by Average_Item_Outlet_Sales desc;

-- Q45. WRITE a query to show average Item_Outlet_Sales BY Outlet_Size
select Outlet_Size,avg(Item_Outlet_Sales) as Average_Item_Outlet_Sales
from big_mart
group by Outlet_Size;

-- Q46. WRITE a query to show average Item_Outlet_Sales BY Outlet_Type
select Outlet_Type,avg(Item_Outlet_Sales) as Average_Item_Outlet_Sales
from big_mart
group by Outlet_Type;

-- Q47. WRITE a query to show maximum Item_Outlet_Sales BY Outlet_Type
select Outlet_Type,max(Item_Outlet_Sales) as Maximum_Item_Outlet_Sales
from big_mart
group by Outlet_Type;

-- Q48. WRITE a query to show total Item_Outlet_Sales BY Outlet_Establishment_Year
select Outlet_Establishment_Year,sum(Item_Outlet_Sales) as Total_Item_Outlet_Sales
from big_mart
group by Outlet_Establishment_Year;

-- Q49. WRITE a query to show total Item_Outlet_Sales BY Item_Type
select Item_Type,sum(Item_Outlet_Sales) as Total_Item_Outlet_Sales
from big_mart
group by Item_Type;

-- Q50. WRITE a query to show total Item_Outlet_Sales BY Outlet_Location_Type
select Outlet_Location_Type,sum(Item_Outlet_Sales) as Total_Item_Outlet_Sales
from big_mart
group by Outlet_Location_Type;

-- Q51. WRITE a query to show total Item_Outlet_Sales BY Item_Fat_Content
select Item_Fat_Content,sum(Item_Outlet_Sales) as Total_Item_Outlet_Sales
from big_mart
group by Item_Fat_Content;

-- Q52. WRITE a query to show maximum Item_Visibility BY Item_Type
select Item_Type,max(Item_Visibility) as Maximum_Item_Visibility
from big_mart
group by Item_Type;

-- Q53. WRITE a query to show Minimum Item_Visibility BY Item_Type
select Item_Type,min(Item_Visibility) as Minimum_Item_Visibility
from big_mart
group by Item_Type;

-- Q54. WRITE a query to show total Item_Outlet_Sales BY Item_Type but ONLY WHERE Outlet_Location_Type IS Tier 1
select Item_Type,sum(Item_Outlet_Sales) as Total_Item_Outlet_Sales
from big_mart
where Outlet_Location_Type = "Tier 1"
group by Item_Type;

-- Q55. WRITE a query to show total Item_Outlet_Sales BY Item_Type WHERE Item_Fat_Content IS ONLY Low Fat & LF
select Item_Type,sum(Item_Outlet_Sales) as Total_Item_Outlet_Sales
from big_mart
where Item_Fat_Content in ('Low Fat','LF')
group by Item_Type;
