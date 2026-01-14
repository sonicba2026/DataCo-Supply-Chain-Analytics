
# DataCo Supply Chain – DAX Measures Summary

This file summarizes key DAX measures used across four dashboards:
- Executive & Management
- Operations & Supply Chain
- Sales & Customer Insights
- Product & Inventory Performance

---

## 1. Core Sales & Profit Measures

**Total Sales**
```DAX
Total Sales =
SUM(dataco_clean[Sales])
```

**Total Profit**
```DAX
Total Profit =
SUM(dataco_clean[Benefit_per_order])
```

**Profit Margin %**
```DAX
Profit Margin % =
DIVIDE([Total Profit], [Total Sales], 0)
```

---

## 2. Time Intelligence

**Sales YTD**
```DAX
Sales YTD =
TOTALYTD(
    [Total Sales],
    dataco_clean[Order_Date]
)
```

**Profit YTD**
```DAX
Profit YTD =
TOTALYTD(
    [Total Profit],
    dataco_clean[Order_Date]
)
```

**Monthly Sales**
```DAX
Monthly Sales =
CALCULATE(
    [Total Sales],
    ALLEXCEPT(
        dataco_clean,
        dataco_clean[Year],
        dataco_clean[Month]
    )
)
```

---

## 3. Operations & Supply Chain KPIs

**Average Delivery Delay**
```DAX
Avg Delivery Delay =
AVERAGEX(
    dataco_clean,
    dataco_clean[Days_for_shipping_real]
    - dataco_clean[Days_for_shipment_scheduled]
)
```

**Late Orders**
```DAX
Late Orders =
CALCULATE(
    COUNTROWS(dataco_clean),
    dataco_clean[Late_Delivery_Risk] = TRUE()
)
```

**Late Delivery Rate %**
```DAX
Late Delivery Rate % =
DIVIDE(
    [Late Orders],
    COUNTROWS(dataco_clean),
    0
)
```

---

## 4. Customer Analytics

**Total Customers**
```DAX
Total Customers =
DISTINCTCOUNT(dataco_clean[Customer_Id])
```

**Repeat Customers**
```DAX
Repeat Customers =
CALCULATE(
    DISTINCTCOUNT(dataco_clean[Customer_Id]),
    dataco_clean[Repeated_Customer] = "Repeat"
)
```

**Repeat Customer Rate %**
```DAX
Repeat Customer Rate % =
DIVIDE(
    [Repeat Customers],
    [Total Customers],
    0
)
```

---

## 5. Product & Inventory Performance

**Total Orders**
```DAX
Total Orders =
COUNT(dataco_clean[Order_Id])
```

**Best Seller Quantity**
```DAX
Total Quantity Sold =
SUM(dataco_clean[Order_Item_Quantity])
```

**Average Product Profit**
```DAX
Avg Product Profit =
AVERAGE(dataco_clean[Benefit_per_order])
```

---

## 6. Filtering & Business Logic

**SLA Passed Orders**
```DAX
SLA Pass Orders =
CALCULATE(
    COUNTROWS(dataco_clean),
    dataco_clean[SLA_Status] = "Pass"
)
```

**Top N Regions by Sales**
```DAX
Top Regions Sales =
CALCULATE(
    [Total Sales],
    TOPN(
        10,
        VALUES(dataco_clean[Region]),
        [Total Sales],
        DESC
    )
)
```

---

## Notes
- All measures assume cleaned data from SQL Server.
- Date fields should be connected to a proper Date table for best practice.
- Measures are reusable across multiple dashboards.

