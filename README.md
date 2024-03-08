# Data Analytics Power BI Report
As the final project in the AI Core Data Analysis course, a Power BI project was completed to showcase the data analysis 
and business intelligence skills gained throughout the course. 

## Purpose of report
You have recently been approached by a medium-sized international retailer who is keen on elevating their business intelligence practices. With operations spanning across different regions, they've accumulated large amounts of sales from disparate sources over the years.
Recognizing the value of this data, they aim to transform it into actionable insights for better decision-making. Your goal is to use Microsoft Power BI to design a comprehensive Quarterly report. This will involve extracting and transforming data from various origins, designing a robust data model rooted in a star-based schema, and then constructing a multi-page report.
The report will present a high-level business summary tailored for C-suite executives, and also give insights into their highest value customers segmented by sales region, provide a detailed analysis of top-performing products categorised by type against their sales targets, and a visually appealing map visual that spotlights the performance metrics of their retail outlets across different territories.

## Milestone 1 & 2 - Setting Up and Importing Data into Power BI
The tables were imported and loaded from various sources with the data in the tables cleaned and organised using PowerQuery, with the following transformations: 

**Orders Table**: \
The Orders table contains information about each order, including the order and shipping dates, the customer, store and product IDs for associating with dimension tables, and the amount of each product ordered.
- Imported from an Azure SQL Database
- Deleted columns containing confidental information
- Split date columns into separate date and time columns
- Removed rows which contained null values

**Products Table**:\
The Products table contains information about each product sold by the company, including the product code, name, category, cost price, sale price, and weight.
- Loaded from a web-hosted csv file
- Duplicates of product code were removed

**Stores Table**:\
The Stores table contains information about each store, including the store code, store type, country, region, and address.
- Imported from Azure Blob Storage

**Customers Table**:\
The Customers table contains information about each customer, including personal details, contact details, and user details. 
- Loaded from a zip folder containing three csv files for each region in which the company operatres, each with the same column format, which were combined into one table
- A full name column was added using the column from example function

Additionally, all columns were transormed to include a consistent naming convention.

## Milestone 3 - Creating the data model
A data model was created for the Power BI project.

**Dates Table**:\
A continuous date table was created using DAX formulas to utilise Power BI time intelligence functionality.
- A date table was created from the earliest order date to the latest shipping date
- Additional columns including start of week, month, quarter and year, were added, in addition to the year, quarter, month name and number, and day of week
- A date hierachy was created in the order Start of Year, Start of Quarter, Start of Month, Start of Week, Date

The DAX formulas for the dates table were as follows:

Dates = CALENDAR(MIN(Orders[Order Date]), MAX(Orders[Shipping Date]))

StartOfYear = STARTOFYEAR(Dates[Date])

Start of Quarter = STARTOFQUARTER(Dates[Date])

Start Of Month = STARTOFMONTH(Dates[Date])

StartOfWeek = Dates[Date] - WEEKDAY(Dates[Date],2) + 1

Year = YEAR(Dates[Date])

Quarter = QUARTER(Dates[Date])

Month Name = FORMAT(Dates[Date],"MMMM")

Month Number = MONTH(Dates[Date])

Weekday = FORMAT(Dates[Date],"dddd")

**Measures Table**:\
A measures table was created to keep the data model organised and easy to navigate, and was populated with some initial measures.
- Created a measures table in Model View to enable Power Query editing
- Key initial measures were created using DAX formulas and time intelligence functions

The DAX formulas for the initial measures were as follows:

Total Orders = COUNT(Orders[Order Date])

Total Profit = SUMX(Orders, Orders[Product Quantity] * (RELATED(Products[Sale Price]) - RELATED(Products[Cost Price])))

Total Quantity = SUM(Orders[Product Quantity])

Total Customers = DISTINCTCOUNT(Orders[User ID])

Total Revenue = SUMX(Orders, Orders[Product Quantity] * RELATED(Products[Sale Price]))

Revenue YTD = CALCULATE([Total Revenue], DATESYTD(Dates[Date]))

Profit YTD = CALCULATE([Total Profit], DATESYTD(Dates[Date]))

**Geography Organisation**:\
The geographic cateogries in the Stores table were organised to edited to enable drill down features in Report Mode to be able to perform granular analysis.
- Created Switch DAX formaula to convert country acronyms to full names
- Corrected the data cateogry for countries, continents, and states/provinces
- Created a geography hierarchy in the order: World Region, Country, Country Region
- Created full geography column in the format of Country Region, Country using DAX formula

The DAX formula for editing geogrpahy columns were as follows:

Country = SWITCH ([Country Code], "GB", "United Kingdom", "US", "United States", "DE", "Germany", BLANK())

Geography = Stores[Country Region] & ", " & Stores[Country]

**Star Schema**:\
A star schema was created by building relationships between tables. 
- Created one-to-many relationships between tables and the fact table Orders
- Created an active relationship between Orders[Date] and Date[Date]

The following relationships were created:

Products[Product Code] to Orders[Product Code]
Stores[Store Code] to Orders[Store Code]
Customers[User UUID] to Orders[User ID]
Date[Date] to Orders[Order Date]
Date[Date] to Orders[Shipping Date]

![Star-model](https://github.com/chloforr/data-analytics-power-bi-report23/assets/141561058/479a98b4-f0b5-4ff4-b080-47e50f391dfc)


  
  


