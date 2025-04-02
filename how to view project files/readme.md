### Step 1:
Download the ZIP files containing the CSV files.

### Step 2:
Extract the ZIP files and load the CSV data into MySQL Workbench (or your preferred database software). Below is an example of the SQL code you can use for importing the data:

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

### Step 3:
Download the PBIX files and open them in Power BI Desktop to view the reports.

**Note:** Replace `'path_to_your_downloaded_file'` with the actual file path where your CSV file is stored.
