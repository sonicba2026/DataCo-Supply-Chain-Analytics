--ALTER TABLE dbo.dataco_clean
--ADD Order_Date DATE;

--UPDATE dbo.dataco_clean
--SET Order_Date = CAST(order_date_DateOrders AS DATE);

--alter table dbo.dataco_clean
--drop column order_date_DateOrders

--WITH cte AS (
--  SELECT *,
--         ROW_NUMBER() OVER (
--           PARTITION BY
--             Order_Id,
--             Customer_Id,
--             Product_Card_Id,
--             Order_Date
--           ORDER BY Order_Id
--         ) AS rn
--  FROM dbo.dataco_clean
--)
--DELETE FROM cte
--WHERE rn > 1;

--ALTER TABLE dbo.dataco_clean
--ADD Shipping_Date DATE;

--UPDATE dbo.dataco_clean
--SET Shipping_Date = CAST(Shipping_date_DateOrders AS DATE);

--alter table dbo.dataco_clean
--drop column Shipping_date_DateOrders

--alter table dbo.dataco_clean
--drop column Customer_Email

--alter table dbo.dataco_clean
--drop column Customer_Password

--alter table dbo.dataco_clean
--drop column Order_Zipcode

--alter table dbo.dataco_clean
--drop column Product_Description

--alter table dbo.dataco_clean
--drop column Product_Image

--select distinct Product_Status
--from dbo.dataco_clean

--alter table dbo.dataco_clean
--drop column Product_status

--UPDATE dbo.dataco_clean
--SET Benefit_per_Order = 0
--WHERE Benefit_per_Order IS NULL;

--UPDATE dbo.dataco_clean
--SET Customer_City = 'Unknown'
--WHERE Customer_City IS NULL;

--select distinct Delivery_Status
--from dbo.dataco_clean

--UPDATE dbo.dataco_clean
--SET Delivery_Status ='Late'
--WHERE Delivery_Status LIKE '%late%'
--SET Delivery_Status = 'Good'
--WHERE Delivery_Status LIKE '%on%'
--SET Delivery_Status = 'Canceled'
--WHERE Delivery_Status LIKE '%Canceled%'
--SET Delivery_Status = 'Advance'
--WHERE Delivery_Status LIKE '%Advance%'

--ALTER TABLE dbo.dataco_clean ADD SLA_Status VARCHAR(10);

--UPDATE dbo.dataco_clean
--SET SLA_Status =
--  CASE
--    WHEN Days_for_shipping_real<=days_for_shipment_scheduled then'Pass'
--    ELSE 'Fail'
--  END;

--ALTER TABLE dbo.dataco_clean ADD Profit_Bucket VARCHAR(20);

--UPDATE dbo.dataco_clean
--SET Profit_Bucket =
--  CASE
--    WHEN Benefit_per_Order < 0 THEN 'Loss'
--	when Benefit_per_order =0 then 'Even'
--    WHEN Benefit_per_Order < 50 THEN 'Low Profit'
--    ELSE 'High Profit'
--  END;

--select distinct customer_state
--from dbo.dataco_clean

--select *
--from dataco_clean
--where Benefit_per_order < 0
