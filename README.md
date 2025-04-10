# Project_NSW-road-crash-analysis

## Table of Contents:
- [Project Background](#project-background)
- [Project Objectives](#project-objectives)
- [Data structure](#data-structure)


##  Project Background: 
<p align="justify"> 
Road accidents are the primary cause of injuries and fatalities globally. Road accidents claim millions of lives each year and leave countless more injured. With several info programmes, laws, and public awareness efforts designed to lower the number of road trauma victims, road safety is a top concern in Australia. Road collisions remain a major problem despite these efforts, particularly in heavily urbanised and inhabited regions. About 8.2 million people live in New South Wales (NSW), the most populated state in Australia. It makes up to 33% of the nation's total population as of 2023. Ensuring safe travel has been a top concern for legislators, law enforcement, and urban planners because of the continuous expansion of the population, development of infrastructure, and growing need for transportation. Road accidents involving both seasoned and inexperienced drivers continue to occur despite attempts. Data monitoring and analysis help in understanding the factors contributing to road accidents. This project uses a publicly released dataset by NSW to identify important patterns and insights that might help lower accident rates and increase road safety. The dataset includes information on crash details, geographic location, weather conditions, time and day of crash, vehicle type, road surface and many other influencing factors for the years primarily ranging from 2016 to 2023. </p>


## Project Objectives:
<p align="justify"> The project's main goal is to conduct a thorough analysis of road collision incidents in New South Wales between 2016 and 2023 to produce useful information that can lower accident rates and enhance road safety. The frequency, location, and severity of collisions, as well as environmental factors including weather, illumination, road surface, and urban vs rural settings, will all be examined in this research. Finding collision hotspots in certain communities, streets, or junctions where accidents happen frequently and determining if characteristics like road design, alignment, or inadequate street lighting contribute to these trends are important components of this research. At the end, a comprehensive picture of the causes that lead to traffic accidents in New South Wales is presented by integrating geographic, environmental, behavioural, and infrastructure aspects will be presented. Finally, data-supported suggestions will be provided which can be used by safety professionals, traffic authorities, and policymakers to make NSW roads safer for all users.
</p> 

## Data structure:
<p align="justify">
The dataset used in this project is organized into a relational database schema designed to capture detailed information about road crashes and the associated traffic units involved in each incident. It primarily consists of two interconnected tables: </p>
<ol>
  <li><p align="justify">
    nsw2016_2023 Table: <br>
  This table has data about each crash, where each row has a unique crash ID, which is the primary key for the table. Other data columns include:
    <ul>
<li>Temporal Information: Reporting year, year and month of crash, day of the week, and two-hour time intervals.</li>
<li>Geographic Location: Latitude, longitude, town, LGA, route number, identifying features (e.g., landmarks), and road types.</li>
<li>Environmental Factors: Weather, street lighting, natural lighting, road surface condition, urbanization, and conurbation level.</li>
<li>Crash Characteristics: Degree of crash severity, type and location of hazards, traffic control signals, road alignment, and school zone activity.</li>
<li>Casualties: Number of people killed, seriously injured, moderately injured, or sustaining minor injuries.</li>
<li>Classification and Codes: RUM code and description (Road User Movement), DCA code and description (crash visualised with a diagram), type of impact, and road classification.</li></ul><br>
<li>
    traffic_crashes Table: <br>   
  This table has details about each traffic unit involved, its type, movement details, and is linked to the nsw2016_2023 table by the column crash_id. Other columns include:
    <ul>
<li>Traffic Unit Characteristics: Type group (e.g., car, bus, bicycle), role in the crash (e.g., at fault, involved), maneuver before crash (e.g., turning, overtaking), and direction of travel.</li>
<li>Control and Impact Data: Whether the vehicle was under driver control at the time, and objects hit during the crash.</li> </p>

<br> 
<img width="344" alt="erd diagram" src="https://github.com/user-attachments/assets/b2ce363e-61f2-4415-bfa6-7eb6cdf77c71" /> 


## Executive summary
- quantitative value
- business metric
- historical trend and story
<br>

## Insights deep dive
<br>

## Recommendations
<br>
