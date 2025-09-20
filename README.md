# Overview for report - NSW Road Crash Analysis (2016-2023)

![Project Banner](https://github.com/user-attachments/assets/f0e17fa9-30c1-41c5-b7a9-6d03c04b8318)

## View full report [here](Report)

## Table of Contents
- [Project Background](#project-background)
- [Project Objectives](#project-objectives)
- [Data Source](#data-source)
- [Dataset Structure](#dataset-structure)
- [Executive Summary](#executive-summary)
- [Project Overview](#project-overview)
- [Insights](#insights)
- [Recommendations](#recommendations)
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
<img src="https://github.com/user-attachments/assets/b2ce363e-61f2-4415-bfa6-7eb6cdf77c71" alt="ERD Diagram" width="400"/>

## Executive Summary
<p align='justify'>Road crashes impose a substantial public health and socioeconomic burden, with fatalities (~1.8%) overshadowed by serious (~26%) and moderate (~41%) injuries, highlighting the widespread impact beyond deaths. Cars dominate crash involvement, while motorcycles, pedestrians, cyclists, and light trucks experience disproportionately severe outcomes. Key risk factors include two-way undivided roads, intersections (T- and X-junctions), high-risk corridors, adverse weather, poor lighting, and roadside hazards, with urban areas exhibiting high crash frequency and rural areas higher fatality rates. High-risk maneuvers such as unsafe turning, wrong-side driving, and mid-block pedestrian crossings amplify severity. Strategic interventions require an integrated approach: upgrading infrastructure (central barriers, roundabouts, lighting, anti-skid surfacing, and roadside hazard mitigation), protecting vulnerable road users through dedicated lanes and crossings, promoting vehicle safety technologies, targeting dangerous behaviors through enforcement and education, and enhancing crash data quality via standardized reporting and automated monitoring. Evidence-driven, context-specific interventions across urban and rural environments are essential to reducing injury severity, preventing fatalities, and alleviating the broader societal burden of road crashes.</p>

## Project Overview
- **Crash Hotspots and Geographic Distribution**: Crashes are concentrated in urban LGAs like Canterbury-Bankstown, Central Coast, Blacktown, Sydney, and Parramatta. Rural LGAs have fewer crashes but higher fatality proportions. Peak crash locations align with major arterial roads.  

- **Road and Environmental Factors**: Most crashes occur on sealed, dry roads in fine weather, but wet, icy, or unsealed surfaces increase severity. Poor lighting and absence of traffic signals are associated with higher injury levels. Roadside hazards like trees, poles, fences, and embankments significantly contribute to crash severity.  

- **Regional Crash Patterns**: Urban areas dominate in total crashes and injuries, while rural areas show higher fatality rates per crash. Peak crash periods align with commuting hours (06:00–09:59 and 14:00–17:59) and lunchtime (12:00–13:59). Weekend crashes correspond to leisure travel patterns.  

- **Crash Severity and Injury Outcomes**: Around 70% of crashes result in injury, while fatal crashes account for 1–2%. Weather, lighting, and road conditions significantly influence crash severity.  

- **Vehicle Involvement and Impact Roles**: Cars are the most involved, followed by light trucks and motorcycles. Vulnerable road users such as pedestrians and cyclists face higher risks. Most crashes occur on the street of travel, with north-south corridors showing higher volumes.

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

## Recommendations
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
  
# Project Overview

## Crash Hotspots and Geographic Distribution
<p align="justify">Crashes are concentrated in urban LGAs such as Canterbury-Bankstown, Central Coast, Blacktown, Sydney, and Parramatta, while rural LGAs experience fewer crashes but higher fatality rates. Peak crash locations align with major arterial roads and high-traffic corridors.</p>

## Road and Environmental Factors
<p align="justify">Most crashes occur on sealed, dry roads during fine weather, but wet, icy, or unsealed surfaces increase severity. Poor lighting, absence of traffic signals, and roadside hazards - trees, poles, fences, and embankments - contribute significantly to serious and fatal outcomes.</p>

## Regional Crash Patterns
<p align="justify">Urban areas dominate in total crashes and injuries, whereas rural areas show higher fatalities per incident. Peak crash periods occur during commuting hours (06:00-09:59, 14:00-17:59) and lunchtime (12:00-13:59), with weekend crashes aligning with leisure travel patterns.</p>

## Crash Severity and Injury Outcomes
<p align="justify">Approximately 70% of crashes result in injury, while fatalities account for 1-2%. Weather, lighting, and road conditions strongly influence crash severity.</p>

## Vehicle Involvement and Behavioral Insights
<p align="justify">Cars are the most involved vehicles, followed by light trucks and motorcycles. Vulnerable road users - pedestrians and cyclists - face disproportionately high risk. High-risk maneuvers such as wrong-side driving and unsafe turning contribute significantly to severe outcomes, while safe infrastructure and targeted behavioral campaigns mitigate risks.</p>

## Key Insights
<ol>
  <li><p align="justify"><strong>Injury and Contributing Factors:</strong> Fatalities are ~1.8% of crashes; serious injuries 26%; moderate injuries 41%. Two-way undivided roads and intersections (T- and X-junctions) are high-risk.</p></li>
  <li><p align="justify"><strong>Temporal and Geospatial Patterns:</strong> Urban LGAs have high crash frequency; rural LGAs have higher fatalities. High-risk corridors include Canterbury Road, Pacific Highway, and Western Road.</p></li>
  <li><p align="justify"><strong>Environmental and Infrastructure Factors:</strong> Adverse weather, darkness, and roadside hazards amplify severity. Infrastructure improvements - lighting, anti-skid surfaces, hazard mitigation - reduce risk.</p></li>
  <li><p align="justify"><strong>Vehicle and Behavioral Insights:</strong> Vulnerable users experience high injury severity. Risky maneuvers drive serious/fatal outcomes; protected lanes, crossings, and education reduce exposure.</p></li>
  <li><p align="justify"><strong>Data Quality and Monitoring:</strong> Incomplete or unknown values limit analysis. Standardized reporting, automated data capture, and integration with hospital/traffic datasets enhance monitoring and evidence-based interventions.</p></li>
</ol>

## Recommendations
<ol>
  <li><p align="justify"><strong>Injury and Severity:</strong> Promote advanced vehicle safety technologies (ADAS), upgrade high-risk roads and intersections, expand roundabouts.</p></li>
  <li><p align="justify"><strong>Geospatial Interventions:</strong> Urban - injury reduction strategies; Rural - fatality prevention, emergency response improvements, hotspot monitoring.</p></li>
  <li><p align="justify"><strong>Environmental and Infrastructure:</strong> Expand lighting, anti-skid surfaces, ITS in fog-prone areas, remove/shield roadside hazards.</p></li>
  <li><p align="justify"><strong>Vehicle and Behavioral:</strong> Protect vulnerable users with infrastructure, enforce high-risk maneuvers, promote safe driving behaviors.</p></li>
  <li><p align="justify"><strong>Data Quality and Monitoring:</strong> Standardize reporting, integrate automated and external datasets, conduct regular audits, and maintain public dashboards.</p></li>
</ol>


## Power BI Report and Dashboard
PBIX file available [here](PBIX-Report-files)

## View full report [here](Report)

## My socials
[![portfolio](https://img.shields.io/badge/my_portfolio-FFFFFF?style=for-the-badge&logo=ko-fi&logoColor=black)](https://yadneshbapat.github.io/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/)


