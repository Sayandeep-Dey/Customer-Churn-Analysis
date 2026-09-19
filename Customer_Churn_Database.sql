select * from customer_churn

-- 1.Total Customers
select count(*) as Total_Customers 
from customer_churn

-- 2.Total Churn Customers
select count(*) as total_churn_customers from customer_churn
where "Churn"='Yes'

-- 3.Chrun Rate 
select 
round(
sum(case when "Churn"='Yes' then 1 else 0 end)*100/count(*),2)
as Churn_Rate from customer_churn

--4.Average Monthly Charges
select avg("Monthly_Charges") from customer_churn

--5.Average Tenure 
select avg("Tenure_Months") from customer_churn

--6. Churn by Contract Type
select "Contract_Type",count(*) as customers
from customer_churn
group by "Contract_Type"
order by customers desc;

--7.Churn by Internet Service
select "Internet_Service",count(*) as customers
from customer_churn
group by "Internet_Service"
order by customers desc;

--8.Churn by state
select "State", count(*) as customers
from customer_churn
group by "State"
order by customers desc;

--8.Payment Method Wise Customers
select "Payment_Method" , count(*) as customers
from customer_churn
group by "Payment_Method" 
order by 2 desc;

--9.Payment Method Wise Customers(Monthly)
select "Payment_Method" , count("Monthly_Charges") as customers
from customer_churn
group by "Payment_Method" 
order by 2 desc;

--10.Subscription Type Wise Customer
select "Subscription_Type", count(*) as customers
from customer_churn
group by "Subscription_Type"
order by 2 desc;

--11.Highest Revenue State
select "State" , sum("Total_Charges") as State_charges
from customer_churn
group by "State"
order by 2 desc

--12.Average Charges by Contract
select  "Contract_Type", avg ("Monthly_Charges") as Average_Monthly_Charges
from customer_churn
group by  "Contract_Type"
order by 2 desc;

--13.Senior Citizens Churn
Select "Senior_Citizen" , count(*) as Churn 
from customer_churn
where "Churn"='Yes'
group by "Senior_Citizen" ;

--14.Top !0 High Value Customers
select "Customer_Name" ,"Customer_Value" as Customer_Value
from customer_churn
order by 2 desc;

--15.Customers Without Tech Support
select * from customer_churn
where "Tech_Support"='No'
