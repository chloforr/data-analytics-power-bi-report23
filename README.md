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
- Weight column converted to decimal format, removed units, and converted all to kg by using column from example and DAX function: Weight In Kg = IF(Products[Weight] > 100, Products[Weight]/1000,Products[Weight])

**Stores Table**:\
The Stores table contains information about each store, including the store code, store type, country, region, and address.
- Imported from Azure Blob Storage

**Customers Table**:\
The Customers table contains information about each customer, including personal details, contact details, and user details. 
- Loaded from a zip folder containing three csv files for each region in which the company operatres, each with the same column format, which were combined into one table
- A full name column was added using the column from example function

Additionally, all columns were transormed to include a consistent naming convention.

