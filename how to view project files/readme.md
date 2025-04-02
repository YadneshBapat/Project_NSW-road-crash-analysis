### Step 1:
Download the ZIP files containing the CSV files.

### Step 2:
Create database and data tables by using the code below.
```sql
CREATE DATABASE nsw_crash_db;

USE nsw_crash_db;

CREATE TABLE NSW2016_2023 (
    Crash_ID INT PRIMARY KEY,
    Degree_of_crash VARCHAR(50),
    Degree_of_crash_detailed VARCHAR(100),
    Reporting_year INT,
    Year_of_crash INT,
    Month_of_crash VARCHAR(20),
    Day_of_week_of_crash VARCHAR(15),
    Two_hour_intervals VARCHAR(20),
    Street_of_crash VARCHAR(100),
    Street_type VARCHAR(10),
    Distance INT,
    Direction VARCHAR(50),
    Identifying_feature VARCHAR(50),
    Identifying_feature_type VARCHAR(20),
    Town VARCHAR(25),
    Route_no INT,
    School_zone_location VARCHAR(20),
    School_zone_active VARCHAR(25),
    Type_of_location VARCHAR(50),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    LGA VARCHAR(100),
    Urbanisation VARCHAR(50),
    Conurbation_1 VARCHAR(50),
    Alignment VARCHAR(100),
    Primary_permanent_feature VARCHAR(255),
    Primary_temporary_feature VARCHAR(255),
    Primary_hazardous_feature VARCHAR(255),
    Street_lighting VARCHAR(50),
    Road_surface VARCHAR(50),
    Surface_condition VARCHAR(50),
    Weather VARCHAR(50),
    Natural_lighting VARCHAR(50),
    Signals_operation VARCHAR(50),
    Other_traffic_control VARCHAR(100),
    Speed_limit INT,
    Road_classification_admin VARCHAR(100),
    RUM_code INT,
    RUM_description VARCHAR(100),
    DCA_code INT,
    DCA_description VARCHAR(100),
    DCA_supplement VARCHAR(100),
    First_impact_type VARCHAR(100),
    Key_TU_type VARCHAR(100),
    Other_TU_type VARCHAR(100),
    No_of_traffic_units_involved INT,
    No_killed INT,
    No_seriously_injured INT,
    No_moderately_injured INT,
    No_minor_other_injured INT
);

CREATE TABLE traffic_crashes (
    Crash_ID INT,
    Traffic_Unit_ID INT,
    TU_Controlled_Flag CHAR(15),
    TU_Role_In_First_Impact VARCHAR(50),
    TU_Type_Group VARCHAR(50),
    Street_of_Travel VARCHAR(50),
    Direction_of_Travel VARCHAR(10),
    Manoeuvre VARCHAR(50),
    Object_Hit_1 VARCHAR(50),
    Object_Hit_2 VARCHAR(50)
);
```

### Step 3:
Extract the ZIP file and load the CSV data into MySQL Workbench (or your preferred database software). Below is an example of the SQL code you can use for importing the data:
For csv exported from the zip - nsw_road_crash_data_2019-2023_crash:
```sql
SET GLOBAL LOCAL_INFILE=ON;

LOAD DATA LOCAL INFILE 'path_to_your_downloaded_file' 
INTO TABLE NSW2016_2023
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
```

For csv exported from the zip - nsw_road_crash_data_2019-2023_traffic_unit:
```sql
SET GLOBAL LOCAL_INFILE=ON;

LOAD DATA LOCAL INFILE 'path_to_your_downloaded_file' 
INTO TABLE traffic_crashes
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
``` 
Ensure that you have inserted all 8 csv files.

### Step 4:
Download the PBIX files and open them in Power BI Desktop to view the reports.


**Note:** Replace `'path_to_your_downloaded_file'` with the actual file path where your CSV file is stored.
