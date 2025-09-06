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

#### Comprehensive Insights into Crash Injuries and Contributing Factors:
<p align="justify"> The injury analysis highlights that while fatalities are relatively low in absolute terms (2,649), serious and moderate injuries constitute a substantial portion of crash outcomes, with 38,079 serious and 59,520 moderate injuries recorded, indicating a significant burden on public health and emergency response systems. Cars and car derivatives emerge as the dominant contributors across all injury types, responsible for the majority of fatalities (2,184), serious injuries, and moderate injuries, reflecting their prevalence on the roads and their role in multi-vehicle collisions. Light trucks and motorcycles, though fewer in number, are associated with disproportionately high fatalities and severe injuries per incident, while heavy vehicles—articulated and rigid trucks—exhibit lower crash frequency but elevated injury severity, indicating that collisions involving these vehicles are particularly dangerous. Vulnerable road users, particularly pedestrians and cyclists, display a strikingly high fatality and serious injury rate relative to their numbers, underscoring the critical need for protective infrastructure and traffic management measures. When examining crash types, fatal outcomes cluster on 2-way undivided roads, which account for over 64% of all fatalities, suggesting that head-on and side-impact collisions in less controlled, high-speed environments are the primary drivers of deadly crashes. Intersections, specifically T- and X-junctions, are significant hotspots for serious and moderate injuries, with thousands of incidents concentrated in these locations due to crossing and turning movements, whereas roundabouts appear to mitigate fatal outcomes but still account for moderate injury volumes. Dual carriageways and freeways, despite high speeds, produce relatively fewer injury crashes, likely because of controlled access, grade separation, and traffic management measures that reduce conflict points. Overall, the insights reveal a complex interplay between vehicle type, road design, and crash severity: high-frequency vehicles like cars drive the majority of total injuries, while high-risk vehicles and vulnerable users are more likely to be involved in severe or fatal outcomes. Road context is equally critical, as undivided roads elevate fatality risk, intersections concentrate injury crashes, and controlled-access highways reduce injury frequency, highlighting the importance of spatial and design factors in determining both the likelihood and severity of crash outcomes. </p>

#### Temporal and Geospatial Insights into Crash Risk Patterns
<p align="justify">The temporal and geospatial analysis reveals clear patterns in crash frequency, severity, and contributing factors. Time-of-day trends indicate that the highest-risk periods are the afternoon and early evening (14:00–18:00), with total crashes and serious injuries peaking during these windows, coinciding with weekday commute periods, particularly Fridays, which exhibit both the highest crash counts and elevated serious and fatal injuries. Weekends show fewer total crashes but a disproportionately high share of severe outcomes, especially on Saturdays, suggesting leisure travel, speeding, and alcohol-related behaviors as contributing factors. Month-wise trends highlight that March and May have the highest total crash counts, including peaks in serious injuries, suggesting seasonal or calendar-linked factors such as school/work schedules or holiday travel, whereas fatalities remain relatively steady across months. Manoeuvre-level insights indicate that proceeding in lane dominates overall crashes, contributing mostly moderate and minor injuries, while high-risk maneuvers such as incorrect-side driving, pedestrian mid-block crossings, and turning movements produce disproportionately high fatalities and serious injuries. Pedestrians are particularly vulnerable when walking across the carriageway, running across, standing on roads, or being outside designated crossings, with the majority of fatalities occurring via vehicle contact rather than collisions with fixed objects. Vehicle-type interactions reveal that cars and car derivatives are the most frequent contributors to high-volume crashes, whereas motorcycles, light trucks, and pedestrians exhibit high fatality or serious injury rates relative to frequency. Geospatial patterns show that 2-way undivided roads are the most hazardous locations, consistently recording the highest fatalities and serious injuries, particularly when combined with high-risk objects such as trees, fences, and utility poles. T- and X-intersections further concentrate injury crashes due to crossing and turning movements, while roundabouts and dual carriageways reduce fatality risk but still produce substantial injury counts. Object-level analysis reinforces the critical role of roadside infrastructure and environmental hazards, with vehicle collisions with trees, fences, and utility poles contributing significantly to fatalities and serious injuries, especially on undivided roads and T-junctions. Collectively, these insights illustrate that temporal factors (time of day, day of week, month), vehicle maneuvering, pedestrian behavior, vehicle type, and road design synergistically shape crash risk and severity, emphasizing the multifactorial nature of road safety challenges. </p>

####
<p align="justify">  </p>

## Recommendations:

##  Power BI report and dashboard: 
