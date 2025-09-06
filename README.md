# The full project details will be updated soon.

## Table of Contents:
- [Project Background](#project-background)
- [Project Objectives](#project-objectives)
- [Data source](#data-source)
- [Dataset structure](#dataset-structure)
- [Executive summary](#executive-summary)
- [Insights deep dive](#insights-deep-dive)
- [Recommendations](#recommendations)
- [Power BI report and dashboard](#power-bi-report-and-dashboard)


##  Project Background: 
<p align="justify"> 
Road accidents are the primary cause of injuries and fatalities globally. Road accidents claim millions of lives each year and leave countless more injured. About 8.2 million people live in New South Wales (NSW), the most populated state in Australia. It makes up to 33% of the nation's total population as of 2023. Ensuring safe travel has been a top concern for legislators, law enforcement, and urban planners because of the continuous expansion of the population and development of infrastructure. This project uses a publicly released dataset by NSW to identify important patterns and insights that might help lower accident rates and increase road safety. </p>

#### Insights and recommendations are provided on the following areas:
<li>Overview of road collisions</li>
<li>Recommendations for every region</li>
<li>Crash location wise recommendations </li>

## Project Objectives:
<p align="justify"> The project's main goal is to conduct a thorough analysis of road collision incidents in New South Wales between 2016 and 2023 to produce useful information that can lower accident rates and enhance road safety. The frequency, location, and severity of collisions, as well as environmental factors including weather, illumination, road surface, and urban vs rural settings, will all be examined in this research. Finding collision hotspots in certain communities, streets, or junctions where accidents happen frequently and determining if characteristics like road design, alignment, or inadequate street lighting contribute to these trends are important components of this research. At the end, a comprehensive picture of the causes that lead to traffic accidents in New South Wales is presented by integrating geographic, environmental, behavioural, and infrastructure aspects will be presented. Finally, data-supported suggestions will be provided which can be used by safety professionals, traffic authorities, and policymakers to make NSW roads safer for all users.
</p> 

## Data source:
Data obtained from the NSW Government [(Transport Open Data portal)](https://opendata.transport.nsw.gov.au/dataset/nsw-crash-data) <br>
clean URL -> `https://opendata.transport.nsw.gov.au/dataset/nsw-crash-data`

## Dataset structure:
<p align="justify">
The dataset used in this project is organised into a relational database schema designed to capture detailed information about road crashes and the associated traffic units involved in each incident.  </p> <br>
- DESCRIPTION ABOUT THIS DATASET. <br> <br>

<img width="344" alt="erd diagram" src="https://github.com/user-attachments/assets/b2ce363e-61f2-4415-bfa6-7eb6cdf77c71" /> 


## Executive summary: 
<p align="justify"> Fatal injuries gradually reduced from 2017 to 2022 but reached pre-pandemic values quickly in 2023.
Serious injuries had the same impact but did not reach a high value, but they are still higher than the pandemic time frame. 
Moderate and minor injuries showed a decline, but a short growth in 2023 was seen. 
The Number of road collisions has reduced gradually from 2016 to 2021 however, it rises steadily from 2021 to 2023. <br><br>
  - MOST COMMON VEHICLE<br>
  - MOST COMMON ROAD TYPE </p>
 <br>
  <img width="675" alt="injury stat" src="https://github.com/user-attachments/assets/30a853ee-eb0f-4c5b-9086-a90bbc6f5272" />

  <br>
- quantitative value
- business metric
- historical trend and story

## Project Overview:
<ul>
<li> <p align="justify"> Crash Hotspots and Geographic Distribution: Crashes are highly concentrated in urban LGAs such as Canterbury-Bankstown, Central Coast, Blacktown, Sydney, and Parramatta, with some high-crash streets like Pacific St, Canterbury Rd, Western Rd, and Hume Hwy contributing disproportionately to total incidents. Rural LGAs, while having fewer total crashes, show a higher proportion of fatal crashes relative to total incidents, suggesting greater severity per crash outside metropolitan areas. Peak crash locations are generally consistent with major arterial roads and high-traffic corridors.</li>

<li> <p align="justify"> oad and Environmental Factors: Most crashes occur on sealed, dry roads in fine weather, reflecting normal traffic conditions, though wet, icy, or unsealed surfaces show a higher severity per incident. Reduced visibility due to darkness, dusk, or dawn is associated with more serious injuries and fatalities. Crashes are common where street lighting is absent, off, or unknown, and intersections without signals are higher-risk zones. Roadside hazards, including trees, utility poles, fences, and embankments, contribute significantly to crash severity, highlighting environmental risk factors.</li>

<li> <p align="justify"> Regional Crash Patterns: Urban areas dominate in total crashes and injury counts, largely due to higher traffic volumes and congestion, whereas rural areas have a relatively higher fatality rate per crash. Across years, crash counts show slight fluctuations: minor and moderate injuries form the bulk of incidents, serious injuries fluctuate, and fatal crashes remain low but persistent. Peak crash periods correspond to commuting hours (06:00–09:59 and 14:00–17:59) and lunch-time peaks (12:00–13:59), with weekend patterns reflecting leisure travel.</li>

<li> <p align="justify"> Crash Severity and Injury Outcomes: Approximately 70% of crashes result in some form of injury (minor, moderate, or serious), while fatal crashes are around 1–2% of total incidents. Non-casualty (towaway) crashes dominate urban areas, with fatalities disproportionately higher in rural regions. Weather and lighting conditions influence severity: adverse weather and poor lighting increase the likelihood of serious or fatal outcomes, even if total crash frequency is lower.</li>

<li> <p align="justify"> Vehicle Involvement and Impact Roles: Cars dominate the vehicles involved in crashes (~70%), followed by light trucks and motorcycles, while vulnerable road users such as pedestrians and cyclists make up a smaller but high-risk segment. Key traffic units—vehicles involved in the first impact—represent over half of units involved, while secondary or peripheral units contribute to chain-reaction crashes. Most crashes occur on the street of travel, with north-south corridors showing slightly higher volumes, highlighting directional traffic risk patterns.</li>
</ul>

<p align="justify"><b> Recommendations at this stage:</b> <br> Urban LGAs and high-crash streets should focus on traffic management, safer intersections, congestion mitigation, and road design improvements to reduce injury and property-damage crashes, while rural areas require targeted interventions to lower fatal crashes through speed enforcement, enhanced signage, and improved road lighting. Road safety can be further enhanced by upgrading street lighting, maintaining and improving road surfaces, and managing roadside hazards such as trees, utility poles, fences, and embankments. Public campaigns should emphasize safe driving during adverse weather, wet or icy roads, and low-light conditions, with integration of weather-based traffic warnings and promotion of proper headlight use. Safety measures should target high-risk maneuvers, key traffic units, and vulnerable road users like pedestrians and cyclists, particularly at intersections and high-traffic streets. Peak crash periods, including morning and afternoon commutes, should be prioritized for enforcement, traffic monitoring, and emergency response readiness. Finally, improving data quality for critical fields such as street names, lighting conditions, vehicle roles, and crash locations is essential to accurately identify hotspots, evaluate interventions, and support evidence-based planning. </p></li>


## Insights deep dive:
## Recommendations:

##  Power BI report and dashboard: 
