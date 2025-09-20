# NSW Road Crash Analysis (2016-2023)

![Project Banner](https://github.com/user-attachments/assets/f0e17fa9-30c1-41c5-b7a9-6d03c04b8318)

## Table of Contents
- [Project Background](#project-background)
- [Project Objectives](#project-objectives)
- [Data Source](#data-source)
- [Dataset Structure](#dataset-structure)
- [Executive Summary](#executive-summary)
- [Project Overview](#project-overview)
- [Insights](#insights)
- [Recommendations Report](#recommendations-report)
- [Power BI Report and Dashboard](#power-bi-report-and-dashboard)

## Project Background
Road accidents are the primary cause of injuries and fatalities globally, claiming millions of lives each year and leaving countless more injured. About 8.2 million people live in New South Wales (NSW), the most populated state in Australia, making up 33% of the nation's total population as of 2023. Ensuring safe travel has been a top concern for legislators, law enforcement, and urban planners due to population growth and infrastructure expansion.  

This project uses publicly released NSW crash data to identify patterns and insights that may help reduce accident rates and improve road safety.

Insights and recommendations are provided on the following areas:
- Overview of road collisions
- Recommendations for every region
- Crash location-wise recommendations

## Project Objectives
The main goal of this project is to analyze road collision incidents in New South Wales between 2016 and 2023 to produce actionable insights for reducing accidents and improving road safety.  

Key objectives include:
- Examine the frequency, location, and severity of collisions
- Analyze environmental factors such as weather, illumination, road surface, and urban vs rural settings
- Identify collision hotspots in communities, streets, and junctions
- Determine how road design, alignment, or lighting contributes to collisions
- Provide data-driven recommendations for policymakers, safety professionals, and traffic authorities

## Data Source
Data obtained from the NSW Government [Transport Open Data Portal](https://opendata.transport.nsw.gov.au/dataset/nsw-crash-data)  
Clean URL: `https://opendata.transport.nsw.gov.au/dataset/nsw-crash-data`

## Dataset Structure
The dataset is organized into a relational database capturing detailed information about road crashes and associated traffic units.

![ERD Diagram](https://github.com/user-attachments/assets/b2ce363e-61f2-4415-bfa6-7eb6cdf77c71)

## Executive Summary
Fatal injuries gradually reduced from 2017 to 2022 but returned to pre-pandemic levels in 2023.  
Serious injuries showed similar trends, while moderate and minor injuries declined overall but increased slightly in 2023.  
Road collisions reduced from 2016 to 2021 but steadily rose again through 2023.

Key highlights:
- Quantitative values and historical trends
- Patterns in fatalities, serious injuries, and moderate/minor injuries
- Insights into common vehicles and crash locations

## Project Overview
- **Crash Hotspots and Geographic Distribution**: Crashes are concentrated in urban LGAs like Canterbury-Bankstown, Central Coast, Blacktown, Sydney, and Parramatta. Rural LGAs have fewer crashes but higher fatality proportions. Peak crash locations align with major arterial roads.  

- **Road and Environmental Factors**: Most crashes occur on sealed, dry roads in fine weather, but wet, icy, or unsealed surfaces increase severity. Poor lighting and absence of traffic signals are associated with higher injury levels. Roadside hazards like trees, poles, fences, and embankments significantly contribute to crash severity.  

- **Regional Crash Patterns**: Urban areas dominate in total crashes and injuries, while rural areas show higher fatality rates per crash. Peak crash periods align with commuting hours (06:00–09:59 and 14:00–17:59) and lunchtime (12:00–13:59). Weekend crashes correspond to leisure travel patterns.  

- **Crash Severity and Injury Outcomes**: Around 70% of crashes result in injury, while fatal crashes account for 1–2%. Weather, lighting, and road conditions significantly influence crash severity.  

- **Vehicle Involvement and Impact Roles**: Cars are the most involved, followed by light trucks and motorcycles. Vulnerable road users such as pedestrians and cyclists face higher risks. Most crashes occur on the street of travel, with north-south corridors showing higher volumes.

Recommendations at this stage:
- Focus on urban LGAs and high-crash streets for traffic management, safer intersections, and congestion mitigation
- Target rural areas with interventions to reduce fatal crashes, including speed enforcement and improved lighting
- Upgrade infrastructure such as street lighting, road surfaces, and roadside hazards
- Public campaigns for safe driving in adverse weather and low-light conditions
- Improve data quality for accurate hotspot identification

## Insights
### 1. Crash Injuries and Contributing Factors
- Fatalities are about 1.8% of all crashes
- Serious injuries account for 26% and moderate injuries 41%
- Cars dominate crash involvement, motorcycles and light trucks have higher severity per incident
- Road type and design influence injury outcomes, with two-way undivided roads being high-risk
- Intersections, particularly T- and X-junctions, concentrate serious and moderate injuries

### 2. Temporal and Geospatial Insights
- Urban LGAs have the highest number of crashes, mostly injuries
- Rural LGAs have fewer crashes but higher fatalities
- High-crash corridors include Canterbury Road, Pacific Highway, and Western Road
- Two-way undivided roads are consistently most dangerous
- Intersections contribute to concentrated injury clusters

### 3. Environmental and Infrastructure Factors
- Most crashes occur in fine weather, but adverse conditions increase severity
- Wet roads, fog, and darkness significantly increase risk
- Roadside hazards (trees, poles, fences) amplify fatalities
- Infrastructure improvements such as lighting, anti-skid surfaces, and roadside hazard management reduce risk

### 4. Vehicle and Behavioral Insights
- Cars dominate crash statistics, but motorcycles, pedestrians, and cyclists have high injury severity
- Dangerous maneuvers (wrong-side driving, unsafe turning) contribute disproportionately to serious/fatal outcomes
- Safe infrastructure (cycle lanes, pedestrian crossings) and behavioral campaigns reduce risk

### 5. Data Quality and Monitoring
- Missing or unknown values limit hotspot identification and risk attribution
- Improved reporting, automated data collection, and integration with other datasets enhance analysis
- Regular audits and validation checks improve crash monitoring and support evidence-based interventions

## Recommendations Report
1. **Injury & Severity Analysis**
   - Promote safer vehicle technologies (ADAS) and public awareness
   - Upgrade two-way undivided roads and intersections
   - Expand roundabouts in high-crossing areas

2. **Geospatial Analysis**
   - Tailor interventions for urban (injury reduction) and rural (fatality prevention) areas
   - Implement monitoring systems in high-crash corridors
   - Improve emergency response in rural LGAs

3. **Environmental & Infrastructure Factors**
   - Expand street lighting and anti-skid surfaces
   - Install intelligent transport systems (ITS) in fog-prone areas
   - Remove or shield roadside hazards

4. **Vehicle & Behavioral Insights**
   - Protect vulnerable road users with infrastructure improvements
   - Target high-risk maneuvers through enforcement and education
   - Encourage safe driving behaviors for motorcycles, pedestrians, and cyclists

5. **Data Quality & Monitoring**
   - Standardize crash reporting and improve data capture
   - Integrate automated feeds and external datasets
   - Regular audits, public dashboards, and feedback loops

## Power BI Report and Dashboard
PBIX file available [here](PBIX-Report-files)

## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-FFFFFF?style=for-the-badge&logo=ko-fi&logoColor=black)](https://yadneshbapat.github.io/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/)


