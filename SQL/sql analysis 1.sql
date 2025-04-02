/* 
Project: NSW road collision analysis for 2015 - 2023

Aim of the project: The aim of this project is to analyze historical road crash and injury data to identify factors such as speed limits, weather conditions, and location type 
that influence road crashes. To detect anomalies, such as specific conditions or locations where crash rates are disproportionately high, to identify potential safety risks. 
Generating reports based on the ingishts to recommend strategies for minimizing future road crashes.
*/

-- Database creation and data loading into server
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

SET GLOBAL LOCAL_INFILE=ON;

LOAD DATA LOCAL INFILE 'C:/D-drive/portfolio project nsw/nsw_road_crash_data_2015-2023_traffic_unit.csv' INTO TABLE traffic_crashes
-- Other file path - 'C:/D-drive/portfolio project nsw/nsw_road_crash_data_2015-2023.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

ALTER TABLE nsw
ADD COLUMN region VARCHAR(255);

-- Adding a new column called region for easy grouping of locations
UPDATE nsw
SET region = CASE
    WHEN lga IN ('Bathurst Regional', 'Blue Mountains', 'Cabonne', 'Cowra', 'Dubbo Regional', 'Forbes', 'Goulburn Mulwaree', 'Lithgow', 'Mid-Western Regional', 'Orange', 'Parkes', 'Upper Lachlan') THEN 'Central West & Tablelands'
    WHEN lga IN ('Albury', 'Armidale Regional', 'Balranald', 'Bellingen', 'Berrigan', 'Bland', 'Blayney', 'Bogan', 'Bourke', 'Brewarrina', 'Broken Hill', 'Canada Bay', 'Carrathool', 'Central Darling', 'Cobar', 'Coolamon', 'Coonamble', 'Cootamundra-Gundagai', 'Dungog', 'Edward River', 
    'Federation', 'Gilgandra', 'Glen Innes Severn', 'Greater Hume', 'Griffith', 'Gunnedah', 'Gwydir', 'Hawkesbury', 'Hay', 'Hilltops', 'Hunters Hill', 'Inverell', 'Junee', 'Kempsey', 'Kyogle', 'Lachlan', 'Leeton', 'Liverpool', 'Liverpool Plains', 'Lockhart', 'Lord Howe Island', 'Moree Plains', 'Murray River', 'Murrumbidgee', 
    'Muswellbrook', 'Nambucca Valley', 'Narrabri', 'Narrandera', 'Narromine', 'Oberon', 'Penrith', 'Randwick', 'Richmond Valley', 'Singleton', 'Snowy Monaro Regional', 'Snowy Valleys', 'Sutherland', 'Tamworth Regional', 'Temora', 'Tenterfield', 'The Hills', 'Unincorporated', 'Upper Hunter', 'Uralla', 'Wagga Wagga', 'Walcha', 
    'Walgett', 'Warren', 'Warrumbungle', 'Weddin', 'Wentworth', 'Wingecarribee', 'Wollondilly', 'Woollahra', 'Yass Valley') THEN 'Far West & Remote'
    WHEN lga IN ('Bayside', 'Blacktown', 'Burwood', 'Camden', 'Campbelltown', 'Canterbury-Bankstown', 'Cumberland', 'Fairfield', 'Georges River', 'Hornsby', 'Inner West', 'Ku-ring-gai', 'Lane Cove', 'Mosman', 'North Sydney', 'Northern Beaches', 'Parramatta', 'Ryde', 'Strathfield', 'Sydney', 'Waverley', 'Willoughby') THEN 'Greater Sydney'
    WHEN lga IN ('Ballina', 'Byron', 'Central Coast', 'Cessnock', 'Clarence Valley', 'Coffs Harbour', 'Lake Macquarie', 'Lismore', 'Maitland', 'Mid-Coast', 'Newcastle', 'Port Macquarie-Hastings', 'Port Stephens', 'Tweed') THEN 'North Coast & Hunter'
    WHEN lga IN ('Bega Valley', 'Eurobodalla', 'Kiama', 'Queanbeyan-Palerang Regional', 'Shellharbour', 'Shoalhaven', 'Wollongong') THEN 'South Coast & ACT Region'
    ELSE 'Unknown'
END;

-- Confirm data load and inspect top 500 rows
SELECT COUNT(*) from nsw2016_2023;
SELECT * FROM nsw2016_2023 limit 500;
SELECT COUNT(*) from traffic_crashes;
SELECT * FROM traffic_crashes limit 500;

-- Data Exploration  
-- ------------- 1. Annual and Year -over-year trend analysis -------------
WITH YearlyCrashes AS (
    SELECT 
        Year_of_crash, 
        COUNT(*) AS Total_crashes
    FROM NSW2016_2023
    WHERE Year_of_crash > 2015  -- Exclude 2015 
    GROUP BY Year_of_crash
)
SELECT 
    Year_of_crash, 
    total_crashes,
    LAG(total_crashes) OVER (ORDER BY Year_of_crash) AS Prev_year_crashes,
    ROUND(
        100.0 * (total_crashes - LAG(total_crashes) OVER (ORDER BY Year_of_crash)) 
        / NULLIF(LAG(total_crashes) OVER (ORDER BY Year_of_crash), 0), 2
    ) AS YoY_Change_Percentage
FROM YearlyCrashes;

-- ------------- 2. Busiest hours and weekday vs weekend analysis -------------
-- Using icons for better readability to distinguish between the words - weekday and weekend
SELECT 
    Two_hour_intervals,
    ROUND(SUM(CASE WHEN Day_of_week_of_crash IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END) / 2.0, 2) AS Weekend_Crashes_Per_Day,
    ROUND(SUM(CASE WHEN Day_of_week_of_crash NOT IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END) / 5.0, 2) AS Weekday_Crashes_Per_Day,
    CASE 
        WHEN (SUM(CASE WHEN Day_of_week_of_crash IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END) / 2.0) > 
             (SUM(CASE WHEN Day_of_week_of_crash NOT IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END) / 5.0) 
        THEN '🚨 Weekend Higher (Per Day)'
        WHEN (SUM(CASE WHEN Day_of_week_of_crash IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END) / 2.0) < 
             (SUM(CASE WHEN Day_of_week_of_crash NOT IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END) / 5.0) 
        THEN '📅 Weekday Higher (Per Day)'
        ELSE 'Equal'
    END AS Crash_Trend
FROM NSW2016_2023
WHERE Year_of_crash BETWEEN 2016 AND 2020  -- Year range
GROUP BY Two_hour_intervals
ORDER BY Two_hour_intervals;

-- ------------- 3. Days with highest number of crashes -------------
SELECT Day_of_week_of_crash, COUNT(*) AS Crash_count
FROM NSW2016_2023
WHERE Year_of_crash BETWEEN 2016 AND 2019  -- Year range
GROUP BY Day_of_week_of_crash
ORDER BY crash_count DESC;

-- ------------- 4. Crash count by geographic area category -------------
SELECT Urbanisation, COUNT(*) AS Crash_count
FROM NSW2016_2023
WHERE Year_of_crash BETWEEN 2016 AND 2023 -- Year range
GROUP BY Urbanisation
ORDER BY crash_count DESC;


-- ------------- 5. Nature lighting wise crash count -------------
SELECT Natural_lighting, COUNT(*) AS Crash_count
FROM NSW2016_2023
WHERE year_of_crash BETWEEN 2015 AND 2023 -- year filter
GROUP BY Natural_lighting
ORDER BY Crash_count DESC;

-- ------------- 6. Degree of crash distribution -------------
SELECT Degree_of_crash_detailed, COUNT(*) AS crash_count
FROM NSW2016_2023
WHERE year_of_crash BETWEEN 2015 AND 2023 -- year filter
GROUP BY Degree_of_crash_detailed
ORDER BY crash_count DESC;

-- ------------- 7. Crash distribution by road type -------------
SELECT Road_surface, COUNT(*) AS Crash_count
FROM NSW2016_2023
WHERE year_of_crash BETWEEN 2015 AND 2023 -- year filter 
GROUP BY Road_surface;

-- ------------- 8. Crash by traffic control -------------
SELECT Other_traffic_control, COUNT(*) AS crash_count
FROM NSW2016_2023
GROUP BY Other_traffic_control
ORDER BY crash_count DESC;

-- ------------- 9. s -------------
SELECT Type_of_location, Degree_of_crash_detailed, COUNT(*) AS crash_count
FROM NSW2016_2023
WHERE (year_of_crash BETWEEN 2015 AND 2023) AND (Type_of_location != 'Unknown') -- year filter and exclude unkown from locaiton type 
GROUP BY Type_of_location, Degree_of_crash_detailed
ORDER BY type_of_location;

-- ------------- 10. Top 10 streets with injury and location statistics -------------
SELECT 
    Street_of_crash, 
    School_zone_location, 
    Type_of_location, 
    COUNT(*) AS Crash_count,
    SUM(No_killed) AS Total_killed,
    SUM(No_seriously_injured) AS Total_seriously_injured,
    SUM(No_moderately_injured) AS Total_moderately_injured,
    SUM(No_minor_other_injured) AS Total_minor_injured
FROM NSW2016_2023
WHERE School_zone_location = 'Yes' -- school zone can be yes or no or removed completely
  AND Year_of_crash BETWEEN 2016 AND 2023  -- Year range
GROUP BY Street_of_crash, School_zone_location, Type_of_location
ORDER BY crash_count DESC 
LIMIT 10;

-- ------------- 11. road alignment, weather, type of road, injury number and percentage distribution of crashes -------------
SELECT 
    Type_of_location,
    COUNT(*) AS Total_crash_count,
    SUM(No_killed) AS Total_killed,
    SUM(No_seriously_injured) AS Total_seriously_injured,
    SUM(No_moderately_injured) AS Total_moderately_injured,
    SUM(No_minor_other_injured) AS Total_minor_injured,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM NSW2016_2023 WHERE Year_of_crash BETWEEN 2016 AND 2019), 2) AS Crash_percentage
FROM NSW2016_2023
WHERE Weather IS NOT NULL
  AND Road_surface IS NOT NULL
  AND Type_of_location IS NOT NULL
  AND Year_of_crash BETWEEN 2016 AND 2019  -- Year range
GROUP BY Type_of_location
ORDER BY crash_percentage DESC;

-- ------------- 12. weather wise crash count -------------
SELECT 
    Weather, 
    COUNT(*) AS Crash_count,
    SUM(No_killed) AS Total_killed,
    SUM(No_seriously_injured) AS Total_seriously_injured,
    SUM(No_moderately_injured) AS Total_moderately_injured,
    SUM(No_minor_other_injured) AS Total_minor_injured,
-- ROUND((SUM(No_killed) + SUM(No_seriously_injured) + SUM(No_moderately_injured) + SUM(No_minor_other_injured)) * 100.0 / COUNT(*), 2) AS Injury_percentage,
   ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM NSW2016_2023 WHERE Year_of_crash BETWEEN 2016 AND 2023)), 2) AS Crash_weather_distribution
FROM NSW2016_2023
WHERE Year_of_crash BETWEEN 2016 AND 2023
GROUP BY Weather
ORDER BY Crash_count DESC;

-- ------------- 13. top 10 manure types and crash share percentage -------------
SELECT 
    tc.Manoeuvre, 
    COUNT(*) AS Crash_count,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) 
                               FROM traffic_crashes tc2
                               JOIN NSW2016_2023 n2 ON tc2.Crash_ID = n2.Crash_ID
                               WHERE n2.Year_of_crash BETWEEN 2016 AND 2017)), 2) AS Manoeure_crash_share_percentage,
    SUM(n.No_killed) AS Total_killed,
    SUM(n.No_seriously_injured) AS Total_seriously_injured,
    SUM(n.No_moderately_injured) AS Total_moderately_injured,
    SUM(n.No_minor_other_injured) AS Total_minor_injured
FROM traffic_crashes tc
JOIN NSW2016_2023 n ON tc.Crash_ID = n.Crash_ID
WHERE n.Year_of_crash BETWEEN 2016 AND 2017
GROUP BY tc.Manoeuvre
ORDER BY crash_count DESC;

-- ------------- 14. Crash and injury stats for vehicle involved -------------
WITH Total AS (
    SELECT 
        tc.TU_Type_Group, 
        COUNT(DISTINCT tc.Crash_ID) AS total_crashes_in_group  -- Total crashes in each TU_Type_Group
    FROM traffic_crashes tc
    JOIN NSW2016_2023 nc ON tc.Crash_ID = nc.Crash_ID
    WHERE nc.Year_of_crash BETWEEN 2015 AND 2023
    GROUP BY tc.TU_Type_Group
)
SELECT 
    tc.TU_Type_Group, 
    COUNT(DISTINCT tc.Crash_ID) AS Unique_Crashes,  -- Count of unique crashes for this type
    SUM(nc.No_seriously_injured + nc.No_moderately_injured + nc.No_minor_other_injured) AS Total_Injuries,
    ROUND(SUM(nc.No_seriously_injured) * 100.0 / NULLIF(SUM(nc.No_seriously_injured + nc.No_moderately_injured + nc.No_minor_other_injured), 0), 2) AS Serious_Injuries_Percentage,
    ROUND(SUM(nc.No_moderately_injured) * 100.0 / NULLIF(SUM(nc.No_seriously_injured + nc.No_moderately_injured + nc.No_minor_other_injured), 0), 2) AS Moderate_Injuries_Percentage,
    ROUND(SUM(nc.No_minor_other_injured) * 100.0 / NULLIF(SUM(nc.No_seriously_injured + nc.No_moderately_injured + nc.No_minor_other_injured), 0), 2) AS Minor_Injuries_Percentage
FROM traffic_crashes tc
JOIN NSW2016_2023 nc ON tc.Crash_ID = nc.Crash_ID
JOIN Total t ON tc.TU_Type_Group = t.TU_Type_Group  -- Join to get the total crashes per TU_Type_Group
WHERE nc.Year_of_crash BETWEEN 2015 AND 2023
GROUP BY tc.TU_Type_Group
ORDER BY Unique_Crashes DESC;

-- ------------- 15. number of traffic units involved and crash and injury statistics -------------
SELECT 
    No_of_traffic_units_involved, 
    COUNT(*) AS crash_count, 
    SUM(No_killed) AS total_killed,
    SUM(No_seriously_injured) AS total_seriously_injured,
    SUM(No_moderately_injured) AS total_moderately_injured,
    SUM(No_minor_other_injured) AS total_minor_injured,
    SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured) AS total_injuries,
    ROUND((SUM(No_killed) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS percentage_killed,
    ROUND((SUM(No_seriously_injured) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS percentage_seriously_injured,
    ROUND((SUM(No_moderately_injured) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS percentage_moderately_injured,
    ROUND((SUM(No_minor_other_injured) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS percentage_minor_injured,
    (SELECT Weather 
     FROM NSW2016_2023 
     WHERE No_of_traffic_units_involved = t.No_of_traffic_units_involved 
     AND Year_of_crash BETWEEN 2019 AND 2023 -- year filter
     GROUP BY Weather 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS most_common_weather,
    (SELECT Speed_limit 
     FROM NSW2016_2023 
     WHERE No_of_traffic_units_involved = t.No_of_traffic_units_involved 
     AND Year_of_crash BETWEEN 2019 AND 2023 -- year filter
     GROUP BY Speed_limit 
     ORDER BY COUNT(*) DESC 
     LIMIT 1) AS most_common_speed_limit
FROM NSW2016_2023 t
WHERE Year_of_crash BETWEEN 2019 AND 2023  -- Year filter
GROUP BY No_of_traffic_units_involved
ORDER BY total_injuries DESC;

-- ------------- 16. Speed limit wise crash and injury statistics -------------
SELECT 
    Speed_limit, 
    COUNT(*) AS crash_count,
    SUM(No_killed) AS total_killed,
    SUM(No_seriously_injured) AS total_seriously_injured,
    SUM(No_moderately_injured) AS total_moderately_injured,
    SUM(No_minor_other_injured) AS total_minor_injured,
    SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured) AS total_injuries,
    ROUND((SUM(No_killed) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS killed_percentage,
    ROUND((SUM(No_seriously_injured) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS seriously_injured_percentage,
    ROUND((SUM(No_moderately_injured) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS moderately_injured_percentage,
    ROUND((SUM(No_minor_other_injured) * 100.0 / NULLIF(SUM(No_killed + No_seriously_injured + No_moderately_injured + No_minor_other_injured), 0)), 2) AS minor_injured_percentage
FROM NSW2016_2023
WHERE Year_of_crash BETWEEN 2020 AND 2023  -- Year filter 
GROUP BY Speed_limit
ORDER BY total_injuries DESC;

