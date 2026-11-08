



-- CREATE SCHEMA IF NOT EXISTS marketing;
CREATE TABLE IF NOT EXISTS marketing.campaigns (
	 Campaign_ID VARCHAR(20), -- chua dat PRIMARY KEY: du lieu tho con trung
	 Campaign_Type VARCHAR(50),
	 Brand VARCHAR(20),
	 Target_Audience VARCHAR(100),
	 Duration INT,
	 Channel_Used VARCHAR(200),
	 Impressions INT,
	 Clicks INT,
	 Leads INT,
	 Conversions INT,
	 Revenue INT,
	 Acquisition_Cost DECIMAL(10, 2),
	 ROI DECIMAL(10, 4),
	 Region VARCHAR(30),
	 Engagement_Score DECIMAL(5, 2),
	 Customer_Segment VARCHAR(100),
	 Campaign_Date DATE
	 );

ALTER TABLE marketing.campaigns 
ALTER COLUMN revenue TYPE DECIMAL(15, 2);

UPDATE marketing.campaigns  SET Brand = 'Nykaa'
WHERE Campaign_ID LIKE 'NY-%' AND Brand IS NULL;
UPDATE marketing.campaigns  SET Brand = 'Purplle'
WHERE Campaign_ID LIKE 'PU-%' AND Brand IS NULL;
UPDATE marketing.campaigns  SET Brand = 'Tira Beauty'
WHERE Campaign_ID LIKE 'TI-%' AND Brand IS NULL;

---EDA

SELECT DISTINCT Campaign_Type FROM marketing.campaigns;
SELECT DISTINCT Brand FROM marketing.campaigns;
SELECT DISTINCT Customer_Segment FROM marketing.campaigns;
SELECT DISTINCT Target_Audience FROM marketing.campaigns;
SELECT DISTINCT Region FROM marketing.campaigns;

select 
	sum(case when Impressions is null then 1 else 0 end)
	AS null_impressionsk,
	sum (case when Clicks is null then 1 else 0 end)
	AS null_clicks,
	sum(case when Revenue is null then 1 else 0 end)
	AS null_revenue,
	sum(case when Acquisition_Cost is null then 1 else 0 end)
	as null_acq
from marketing.campaigns


select * from marketing.campaigns

select Campaign_ID, count(*) 
from marketing.campaigns
group by Campaign_ID
having count(*) > 1
order by count(*) DESC
Limit 10 


select (Impressions) as Total_Impressions,
count(Clicks) as Total_Clicks,
count(Leads) as Total_Leads,
count(Conversions) as Total_Conversions
from marketing.campaigns

-------------------------------------

--Vefity EDA
SELECT COUNT(*) AS total_rows FROM marketing.campaigns;


SELECT
SUM(CASE WHEN Impressions IS NULL THEN 1 ELSE 0 END)
AS null_imp,
SUM(CASE WHEN Revenue IS NULL THEN 1 ELSE 0 END)
AS null_rev
FROM marketing.campaigns


SELECT COUNT(*) FROM (
SELECT Campaign_ID FROM marketing.campaigns
GROUP BY Campaign_ID HAVING COUNT(*) > 1) t


SELECT SUM(CASE WHEN Clicks > Impressions
THEN 1 ELSE 0 END) AS errors FROM marketing.campaigns;

SELECT SUM(CASE WHEN Impressions < 0 OR Revenue < 0
THEN 1 ELSE 0 END) AS negatives FROM marketing.campaigns;


ALTER TABLE marketing.campaigns ADD PRIMARY KEY (Campaign_ID);
-------------------------------------------------------




--Thong ke mo ta
select Brand,
count (*) as total_campaigns,
round(avg(Duration), 1) as avg_duration,
round (avg(Impressions),0) as avg_impress,
round(avg(Clicks),0) as avg_clicks,
round(avg(Conversions),0) as avg_conversions,
round(sum(Revenue)) as total_revenue,
round(avg(ROI),2) as avg_ROI
from marketing.campaigns
group by Brand
order by round(sum(Revenue)) DESC, round(avg(ROI),2) DESC

-------------------------------

-- Tinh CTR, Lead_rate, Conversion_rete, CPA, ROI 
--Tinh KPI tung campaign 
select campaign_id,campaign_type, brand, target_audience,
Impressions, Clicks, Leads, Conversions, 
round(Clicks::numeric / nullif(Impressions, 0),4) as CTR, 
round(Leads::numeric/ nullif(Clicks, 0),4) as Lead_rate,
round(Conversions::numeric / nullif(Leads,0), 4) as Conversions_rate, 
Revenue, acquisition_cost as CPA, 
round(Conversions * acquisition_cost, 2) as Total_spend,
round((Revenue - (Conversions * acquisition_cost)) / nullif(Conversions * acquisition_cost, 0), 4) as cal_ROI, 
ROI as original_ROI
from marketing.campaigns


--KPI tong hop theo tung brand
select brand, 
round(sum(Clicks)::numeric / nullif(sum(Impressions), 0), 4) as CTR_Brand,
round(sum(Leads)::numeric / nullif(sum(Clicks) , 0) ,4) as Lead_rate_brand,
round(sum(Conversions)::numeric / nullif(sum(Leads), 0) , 4) as Conversions_rate_brand,
round(sum(revenue) , 4) as Revenue, 
SUM(Acquisition_Cost * Conversions) AS total_spend,
round(sum(Conversions * acquisition_cost) / sum(Conversions) , 2) as CPA_Overall, 
round(sum(Revenue - (Conversions * acquisition_cost)) / nullif(sum(Conversions * acquisition_cost) , 0) , 4) as cal_ROI
from marketing.campaigns
group by brand
order by cal_ROI DESC

--KPI tong hop theo tung campaigns 
select Campaign_type, 
count(*) as total_campaign,
round(sum(Clicks)::numeric / nullif(sum(Impressions), 0), 4) as CTR_Brand,
round(sum(Leads)::numeric / nullif(sum(Clicks) , 0) ,4) as Lead_rate_brand,
round(sum(Conversions)::numeric / nullif(sum(Leads), 0) , 4) as Conversions_rate_brand,
round(sum(revenue) , 4) as Revenue, 
SUM(Acquisition_Cost * Conversions) AS total_spend,
round(sum(Conversions * acquisition_cost) / sum(Conversions) , 2) as CPA_Overall, 
round(sum(Revenue - (Conversions * acquisition_cost)) / nullif(sum(Conversions * acquisition_cost) , 0) , 4) as cal_ROI
from marketing.campaigns
group by Campaign_type
order by cal_ROI DESC

-- Tinh KPI cheo Brand va campaigns
select Brand, Campaign_type, 
count(*) as total_campaign,
-- round(sum(Clicks)::numeric / nullif(sum(Impressions), 0), 4) as CTR_Brand,
-- round(sum(Leads)::numeric / nullif(sum(Clicks) , 0) ,4) as Lead_rate_brand,
-- round(sum(Conversions)::numeric / nullif(sum(Leads), 0) , 4) as Conversions_rate_brand,
round(sum(revenue) , 4) as Revenue, 
SUM(Acquisition_Cost * Conversions) AS total_spend,
round(sum(Conversions * acquisition_cost) / sum(Conversions) , 2) as CPA_Overall, 
round(sum(Revenue - (Conversions * acquisition_cost)) / nullif(sum(Conversions * acquisition_cost) , 0) , 4) as cal_ROI
from marketing.campaigns
group by Brand, Campaign_type
order by Brand, cal_ROI DESC

-- KPi theo Customer Segment
select customer_segment,
count(*) as total_customer_segment,
round(sum(Clicks)::numeric / nullif(sum(Impressions), 0), 4) as CTR_Brand,
round(sum(Leads)::numeric / nullif(sum(Clicks) , 0) ,4) as Lead_rate_brand,
round(sum(Conversions)::numeric / nullif(sum(Leads), 0) , 4) as Conversions_rate_brand,
round(sum(revenue) , 4) as Revenue, 
SUM(Acquisition_Cost * Conversions) AS total_spend,
round(sum(Conversions * acquisition_cost) / sum(Conversions) , 2) as CPA_Overall, 
round(sum(Revenue - (Conversions * acquisition_cost)) / nullif(sum(Conversions * acquisition_cost) , 0) , 4) as cal_ROI
from marketing.campaigns
group by customer_segment
order by cal_ROI DESC

-- Tim kenh marketing hieu qua 
select channel_used, 
count(*) as total_channel_used,
round(sum(Clicks)::numeric / nullif(sum(Impressions), 0), 4) as CTR_Brand,
round(sum(Leads)::numeric / nullif(sum(Clicks) , 0) ,4) as Lead_rate_brand,
round(sum(Conversions)::numeric / nullif(sum(Leads), 0) , 4) as Conversions_rate_brand,
round(sum(revenue) , 4) as Revenue, 
SUM(Acquisition_Cost * Conversions) AS total_spend,
round(sum(Conversions * acquisition_cost) / sum(Conversions) , 2) as CPA_Overall, 
round(sum(Revenue - (Conversions * acquisition_cost)) / nullif(sum(Conversions * acquisition_cost) , 0) , 4) as cal_ROI
from marketing.campaigns
group by channel_used
order by cal_ROI DESC

select * from marketing.campaigns 

-- doanh thu co giam khong 

select to_char(campaigns.campaign_date, 'YYYY') as year ,brand,
round(sum(revenue), 4) as Total_Revenue,
round(sum(Acquisition_Cost * Conversions), 4) as Total_spend
from marketing.campaigns
group by year, brand
order by Total_Revenue DESC

select * from marketing.campaigns
where brand like 'Tira%'




