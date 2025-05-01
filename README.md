# The full project details will be updated tomorrow


# Project_NSW-road-crash-analysis

## Table of Contents:
- [Project Background](#project-background)
- [Project Objectives](#project-objectives)
- [Data source](#data-source)
- [Dataset structure](#dataset-structure)
- [Executive summary](#executive-summary)
- [Insights deep dive](#insights-deep-dive)
- [Recommendations](#recommendations)


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
Data obtained from the NSW Government [(Transport Open Data portal)](https://opendata.transport.nsw.gov.au/dataset/nsw-crash-data)

## Dataset structure:
<p align="justify">
The dataset used in this project is organised into a relational database schema designed to capture detailed information about road crashes and the associated traffic units involved in each incident.  </p> <br>
- DESCRIPTION ABOUT THIS DATASET. <br> <br>

<img width="344" alt="erd diagram" src="https://github.com/user-attachments/assets/b2ce363e-61f2-4415-bfa6-7eb6cdf77c71" /> 


## Executive summary: 
<p align="justify"> Fatal injuries gradually reduced from 2017 to 2022 but reached pre-pandemic values quickly in 2023.
Serious injuries had the same impact but did not reach a high value, but they are still higher than the pandemic time frame. 
Moderate and minor injuries showed a decline, but a short growth in 2023 was seen. 
The Number of road collisions has reduced gradually from 2016 to 2021 however, it rises steadily from 2021 to 2023. <br>
  - MOST COMMON VEHICLE
  - MOST COMMON ROAD TYPE </p>
 <br>
  <img width="896" alt="1 crashes overview line chart" src="https://github.com/user-attachments/assets/f846b220-b056-4103-bc31-ca642a1deea0" />
  <br>
- quantitative value
- business metric
- historical trend and story

## Insights deep dive:
<ol>
<li>Overall road collision analysis:</li>
<ul> 
 <!-- <img width="725" height="180" alt="2 year of crash and types of injuries basic" src="https://github.com/user-attachments/assets/2bf47dca-fc0b-4b81-b7c3-3db8efcdc6bc" /> -->

  <li> <p align="justify">
A higher average number of crashes per day occurred on weekends during several late-night and midday intervals, particularly between 12:00 PM–2:00 PM and midnight–2:00 AM.
Weekday crashes dominated during morning commute hours (6:00 AM–10:00 AM) and late afternoon (4:00 PM–6:00 PM), aligning with typical workday traffic patterns.
Overall, more 2-hour intervals showed a weekend trend in crash density, though weekdays were consistently high during peak traffic times.
These trends highlight potential risk periods for targeted road safety interventions depending on the day of the week and time of day.</li>

<li> <p align="justify"> Based on the crash data, Fridays recorded the highest number of crashes, followed closely by Thursdays and Wednesdays, indicating that the latter part of the workweek sees the most incidents. Saturdays also had a high number of crashes, surpassing most weekdays except Friday, suggesting increased weekend activity. Tuesdays and Mondays had slightly lower counts, while Sundays consistently saw the fewest crashes, potentially due to reduced travel and work-related traffic. This pattern highlights a clear spike in crashes toward the end of the workweek and into the weekend. 

<!-- <img width="250" height="200" alt="3 day wise crashes" src="https://github.com/user-attachments/assets/027c44b3-a1de-4971-a0cb-bcb6880b4439" /> -->

</p></li>

<li> <p align="justify"> The crash data from 2016 to 2023 reveals that Greater Sydney has the highest crash count (69,281) due to its large population and numerous local areas. The Far West & Remote region follows with 45,019 crashes, driven by its expansive geography and sparsely populated areas. North Coast & Hunter reports 30,819 crashes, reflecting a combination of urban centres and popular tourist destinations. The South Coast & ACT Region and Central West & Tablelands have fewer crashes, at 10,666 and 8,646. Respectively, due to their lower population densities and fewer regions. These patterns emphasise how population size and geographic spread influence crash totals across different areas. </p></li> 
<!-- <img width="168" alt="4 region wise crashes" src="https://github.com/user-attachments/assets/23c5c975-9c76-4fbf-a93c-4ca2c1c72603" /> -->

<li><p align="justify"> From 2016 to 2023, 64.91% of crashes occurred in daylight, followed by 25.23% in darkness, highlighting the need for improved visibility and nighttime safety measures. Dusk and dawn account for 9.60%, indicating higher risk during transitional lighting. Unknown lighting conditions make up only 0.25%, suggesting room for better data accuracy. Overall, the focus should be on human factors, visibility improvements, and data quality.</p>
<!-- <img width="209" alt="5 weather wise crashes" src="https://github.com/user-attachments/assets/877bd032-45fc-4009-ae5d-98529d7a654c" /> -->

</li>
<li> <p align="justify">
From 2016 to 2023, 31.47% of crashes resulted in Non-casualty (towaway), with 51,750 incidents, indicating that a significant portion of crashes do not cause injuries but lead to vehicle damage. Moderate injuries accounted for 27.76% with 45,639 cases, while Serious injuries contributed 20.71% with 34,060 incidents. Minor/Other injuries made up 18.57% of crashes, totalling 30,530, and Fatal crashes were the least frequent at 1.49%, with 2,452 incidents. These figures highlight the need for targeted safety measures, especially for moderate and serious injuries. </p>

<!-- <img width="245" alt="6 injury distribution" src="https://github.com/user-attachments/assets/c8f8a4cb-dc5c-486c-947a-0a786e95683f" /> -->
</li>

<li> <p align="justify">The highest number of crashes occurred during these peak hours, with 16:00 - 17:59 (24,513 crashes) and 14:00 - 15:59 (22,901 crashes) leading, aligning with evening rush hour and post-work congestion. Other notable periods include 12:00 - 13:59 (18,687 crashes) and 08:00 - 09:59 (17,629 crashes), corresponding to midday and morning peak times. Evening intervals like 18:00 - 19:59 (16,445 crashes) and 20:00 - 21:59 (11,054 crashes) also see a significant number of crashes, likely due to reduced visibility. Early morning and late-night periods show fewer crashes, with the Unknown category reporting just 11 incidents<br> </p>
<!-- <img width="148" alt="7 2 hour interval" src="https://github.com/user-attachments/assets/5aa99fc0-97c6-4803-a8ac-5c4f71274335" /> -->

</li>

</ul> 

<li>Region wise analysis:</li>



<li>Location wise analysis:</li> </ol>


## Recommendations:



## Flow
over view of accidents
