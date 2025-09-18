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

#### Comprehensive Insights into Crash Injuries and Contributing Factors: 1. Injury & Severity Analysis
<p align="justify">The injury analysis underscores the substantial burden that road crashes place on public health, emergency services, and broader society. While fatalities, at **2,649**, represent only about **1.8%** of all recorded crash outcomes, the total of **38,079 serious injuries (≈26%)** and **59,520 moderate injuries (≈41%)** highlights the much wider impact of crashes beyond deaths. These injuries often require hospitalisation, prolonged medical care, rehabilitation, and can significantly disrupt workforce participation, placing a major socioeconomic strain on families and the healthcare system. Cars and car derivatives dominate crash involvement, accounting for **2,184 fatalities (≈82% of all deaths)**, as well as the majority of serious and moderate injuries, reflecting both their high presence on roads and involvement in multi-vehicle collisions. Light trucks and motorcycles, though less frequent, contribute disproportionately to severe outcomes, with motorcycles showing a particularly high fatality rate per incident. Heavy vehicles, such as articulated and rigid trucks, are involved in fewer crashes but produce more severe outcomes when incidents occur, highlighting the heightened risks associated with mass and momentum.</p> <p align="justify">Road type and design significantly shape injury outcomes. Fatal crashes are highly concentrated on **2-way undivided roads**, which account for **over 64% of all fatalities**, due to the high risk of head-on or side-impact collisions in uncontrolled traffic environments. Intersections, particularly **T- and X-junctions**, are hotspots for serious and moderate injuries, with thousands of incidents concentrated around crossing and turning maneuvers. Conversely, roundabouts mitigate fatal outcomes due to lower impact speeds, though moderate injuries remain frequent. **Dual carriageways and controlled-access freeways**, despite higher speeds, record comparatively fewer crashes and injuries due to design features such as limited access points, grade separation, and improved traffic flow management. Overall, this analysis highlights the layered nature of crash risks, where vehicle type, road design, and traffic management combine to determine both crash frequency and severity.</p>

#### Temporal and Geospatial Insights into Crash Risk Patterns 2. Geospatial Analysis
<p align="justify">Crash risk is not uniformly distributed but heavily concentrated in urban centers and specific corridors. Urban LGAs, including **Canterbury-Bankstown, Blacktown, Central Coast, Sydney, and Parramatta**, experience the highest number of crashes, predominantly resulting in injuries rather than fatalities, due to high population density, vehicle volumes, and complex road networks. These areas have a large number of intersections, pedestrian crossings, and congested streets, which increases exposure to potential conflicts. In contrast, rural LGAs show fewer total crashes but disproportionately higher fatality rates, likely driven by higher travel speeds, more hazardous roads, and delayed emergency response times, which exacerbate the consequences of incidents when they occur.</p> <p align="justify">At the street level, corridors such as **Canterbury Road, Pacific Highway, and Western Road** are identified as high-crash areas. These routes experience heavy commuter and freight traffic combined with multiple access points, turning lanes, and high-speed sections, increasing the likelihood of both collisions and severe outcomes. Two-way undivided roads consistently emerge as the most dangerous, with the highest fatalities and serious injuries, especially when combined with roadside hazards such as trees, fences, and utility poles. Intersections, particularly T- and X-junctions, concentrate injury crashes due to crossing conflicts and turning movements. While roundabouts and dual carriageways reduce fatalities due to traffic-calming effects and lane separation, they still contribute to moderate injury clusters. These geospatial insights emphasize the need for context-specific interventions, such as targeted enforcement, localized infrastructure improvements, and safer intersection designs to reduce both injury and fatality risks.</p>

3. Environmental & Infrastructure Factors
<p align="justify">Environmental and infrastructure conditions play a pivotal role in crash likelihood and severity. While most crashes occur in fine weather due to higher exposure and travel volumes, adverse conditions, such as rain, fog, and darkness, significantly amplify risk. Wet road surfaces are associated with a marked increase in moderate and serious injuries, as vehicles lose traction and braking distances increase. Fog, though less frequent, produces disproportionately high fatalities due to reduced visibility, delayed driver response, and potential multi-vehicle pileups on high-speed roads. Crashes in poorly lit areas (“dark with no lighting”) are similarly dangerous, contributing significantly to the fatality count and emphasizing the importance of street lighting and visibility improvement measures.</p> <p align="justify">Roadside hazards further exacerbate crash outcomes. Fixed objects, including trees, fences, embankments, and utility poles, contribute significantly to fatalities and serious injuries, particularly on undivided roads where vehicles are more likely to leave the carriageway. Multi-vehicle collisions that occur in the presence of such hazards are often far more severe. Infrastructure interventions—such as expanded street lighting, anti-skid surfacing, roadside vegetation management, protective barriers, and wildlife warning systems—can reduce crash severity, particularly in rural or semi-urban environments. These insights demonstrate that while driver behavior is critical, the physical environment largely determines whether crashes are survivable or fatal, making infrastructure improvements a central element of road safety strategy.</p>

4. Vehicle & Behavioral Insights
<p align="justify">Vehicle involvement data shows that cars dominate crash statistics, while motorcycles, light trucks, and other high-risk vehicles contribute disproportionately to severe outcomes. Cars account for the majority of fatalities and injuries due to their volume on the road, but motorcycles and light trucks exhibit far higher injury severity per incident. Vulnerable road users—pedestrians and cyclists—experience disproportionately high fatality and serious injury rates. Pedestrian fatalities are concentrated among individuals crossing carriageways mid-block, running into traffic, or standing outside designated crossings, with vehicle contact being the primary cause rather than collisions with fixed objects. These findings highlight the urgent need for protective infrastructure, including dedicated lanes, safe crossings, and separation from vehicle traffic, as well as behavioral interventions such as pedestrian education programs.</p> <p align="justify">Behavioral analysis also shows that high-frequency, low-risk maneuvers like lane travel contribute mainly to minor and moderate injuries, whereas dangerous maneuvers—wrong-side driving, unsafe turning, U-turns, and mid-block pedestrian crossings—produce a disproportionate share of serious and fatal outcomes. Intersections amplify these risks, creating concentrated points for turning and crossing conflicts. Urban congestion and parked vehicles further increase exposure, highlighting the interaction between road design and human behavior. Mitigating these risks requires a combination of enforcement (speeding, dangerous maneuvers, impaired driving), engineering (safer intersections, clearer lane markings), and education to reduce high-risk behavior, particularly for vulnerable road users.</p>

5. Data Quality & Monitoring
<p align="justify">SQL analysis also revealed challenges in crash data completeness and quality. Missing or “unknown” values for critical variables—such as lighting conditions, weather, and precise street location—limit the reliability of hotspot identification and the attribution of risk factors. Without accurate environmental data, it is difficult to quantify the contribution of conditions like wet roads or poor visibility to crash severity. Similarly, incomplete location data restricts the ability to identify high-risk corridors and intersections, limiting evidence-based intervention planning.</p> <p align="justify">Enhancing crash monitoring and reporting requires both technological and procedural improvements. Field officers should be trained to capture accurate and comprehensive crash details, including lighting, weather, maneuvers, and GPS coordinates. Automated data collection—via roadside sensors, integrated weather monitoring, and GPS-enabled reporting—can supplement manual records and reduce errors. Integrating crash data with hospital records, insurance claims, and traffic flow datasets can provide a richer, more holistic view of crashes and outcomes. Regular audits and validation checks should also be implemented. Strengthened data quality and monitoring will improve analysis accuracy, enable targeted interventions, and support more effective, evidence-based road safety strategies.</p>


## Recommendations Report:

1. Injury & Severity Analysis

<p align="justify">To address the disproportionate burden of serious and moderate injuries, interventions should go beyond fatality prevention and focus on reducing overall injury severity. One strategy is to strengthen the adoption of safer vehicle technologies such as advanced driver-assistance systems (ADAS), which can help prevent collisions or mitigate their severity through automatic braking, lane departure warnings, and blind-spot monitoring. Public campaigns should also emphasize the long-term consequences of non-fatal crashes, shifting attention from the more visible but smaller fatality numbers to the hidden burden of long-term injury and rehabilitation. Insurance incentives or government subsidies for vehicles equipped with safety technologies could accelerate uptake and directly reduce serious injury counts.

<p align="justify">At the infrastructure level, targeted improvements to high-severity crash locations should be prioritized. Two-way undivided roads, which account for the majority of fatalities, require urgent safety upgrades, such as the installation of central barriers, shoulder widening, and speed limit adjustments. Intersections, especially T- and X-junctions, should be redesigned with safer geometries, improved sightlines, and traffic-calming features to reduce high-speed conflicts. Roundabouts, which already reduce fatalities compared to traditional intersections, should be expanded in areas with frequent crossing crashes. Combined, these interventions would not only reduce the most severe injury outcomes but also create safer environments that minimize the total burden on healthcare systems.

2. Geospatial Analysis

<p align="justify">Geospatial findings suggest that road safety interventions should be tailored to the differing risk profiles of urban and rural environments. In high-density urban LGAs such as Canterbury-Bankstown, Blacktown, and Parramatta, the focus should be on injury reduction strategies. These include enforcing lower urban speed limits, expanding pedestrian crossings, creating cycle lanes, and restricting vehicle access in zones with high pedestrian activity. Hotspot corridors such as Canterbury Road and Pacific Highway should be prioritized for real-time monitoring technologies, such as speed cameras, red-light cameras, and variable speed limit systems, which can reduce risky behavior in high-traffic areas. Local councils should be engaged to co-design interventions with community input, ensuring that solutions are adapted to neighborhood needs.

<p align="justify">In contrast, rural LGAs, while recording fewer crashes, demand fatality prevention measures due to higher-speed travel and delayed emergency response times. Investments should focus on upgrading undivided highways into divided roads with median barriers, installing rumble strips to alert fatigued drivers, and expanding emergency services coverage to reduce response times after severe crashes. Blackspot programs should also target rural roads with frequent roadside hazards, such as trees and poles, to implement clear zones or guardrails. By balancing urban-focused injury reduction with rural-focused fatality prevention, resources can be directed where they will achieve the greatest overall safety impact.

3. Environmental & Infrastructure Factors

<p align="justify">The influence of environmental factors highlights the need for resilient infrastructure that minimizes risks in adverse conditions. Expanding street lighting coverage across dark, unlit areas is one of the most cost-effective interventions, as improved visibility directly reduces crash severity. High-risk corridors should also be upgraded with anti-skid surfaces and improved drainage to minimize aquaplaning during rainfall. In fog-prone areas, intelligent transport systems (ITS) such as adaptive lighting, fog warning signage, and variable speed limits can help drivers adjust in real time. By combining traditional infrastructure upgrades with smart technologies, the risks associated with adverse weather can be substantially reduced.

<p align="justify">To mitigate the risks posed by roadside hazards, governments should prioritize the creation of forgiving roadside environments. This includes removing or relocating fixed obstacles such as trees and utility poles from high-speed corridors, or shielding them with guardrails and crash cushions. Wildlife hazard zones in rural areas could be addressed through fencing and wildlife crossing infrastructure to reduce collision risks. Systematic vegetation management and embankment reshaping can further reduce roadside dangers. These interventions are not only preventative but also transformative, turning inherently dangerous road environments into safer corridors where crashes are less likely to result in severe or fatal outcomes.

4. Vehicle & Behavioral Insights

<p align="justify">Given the dominance of cars in crash statistics and the vulnerability of motorcycles, pedestrians, and cyclists, a two-pronged approach is needed: protect vulnerable road users while improving driver behavior. Expanding protected infrastructure—such as cycle lanes, raised pedestrian crossings, and pedestrian-priority intersections—will significantly reduce exposure to vehicle contact. Campaigns should target pedestrian and cyclist behaviors, particularly unsafe road crossings and nighttime travel without visibility aids, supported by enforcement of pedestrian right-of-way laws. For motorcycles, greater emphasis on protective gear, licensing standards, and awareness campaigns targeting both riders and other drivers can reduce injury severity and collision likelihood.

<p align="justify">Behavioral interventions should focus on high-risk driver actions such as wrong-side driving, unsafe turning, and speeding. Enforcement technology, including point-to-point average speed cameras, lane enforcement systems, and intersection monitoring, should be expanded to discourage dangerous maneuvers. At the same time, road design modifications such as clearer lane markings, traffic calming measures, and intersection redesigns can reduce opportunities for risky behavior. Education programs targeting high-risk groups (e.g., young drivers, heavy vehicle operators) should be combined with targeted penalties for repeat offenders. This integrated approach balances deterrence, education, and engineering, making it more likely to achieve sustained behavioral change and improved safety outcomes.

5. Data Quality & Monitoring

<p align="justify">The analysis makes clear that data quality and completeness are fundamental to effective crash prevention. Governments should invest in standardized crash reporting protocols to ensure uniform data collection across all regions. Police and crash investigators should be equipped with digital reporting tools that capture environmental factors, vehicle maneuvers, lighting, and exact GPS coordinates with minimal manual input. Automated data feeds from roadside cameras, weather sensors, and vehicle telematics should be integrated into crash databases to enhance precision and reduce reliance on subjective assessments. Linking crash data with hospital admission records, insurance data, and traffic flow metrics would allow for more robust analysis of crash severity and outcomes.

<p align="justify">Regular data audits and feedback loops must also be established to identify patterns of missing or inconsistent data and ensure accountability in reporting. Public dashboards could be developed to increase transparency, allowing stakeholders and communities to access real-time crash trends and hold authorities accountable for safety outcomes. By improving the breadth, depth, and reliability of crash data, policymakers will be better positioned to allocate resources efficiently, design interventions with measurable impacts, and track progress over time. Data quality is therefore not only a technical challenge but a foundational requirement for achieving long-term, evidence-based improvements in road safety.

## Summary of Recommendations
Injury & Severity Analysis
Most crashes result in serious or moderate injuries, especially from cars, light trucks, and motorcycles. Vulnerable road users (pedestrians, cyclists) face disproportionately high fatality rates. Upgrades to undivided roads, safer intersection designs, and expanded roundabouts are critical to reducing severe outcomes.

Geospatial Analysis
Urban LGAs (e.g., Canterbury-Bankstown, Blacktown, Parramatta) record the highest injury volumes, requiring safer crossings, cycle lanes, and congestion management. Rural LGAs face fewer crashes but higher fatality rates, calling for median barriers, rumble strips, and improved emergency response. High-crash corridors such as Canterbury Road and Pacific Highway should be treated as priority safety zones.

Environmental & Infrastructure Factors
Poor lighting, wet surfaces, and roadside hazards significantly increase crash severity. Solutions include expanded street lighting, anti-skid surfacing, fog warning systems, and removal or shielding of roadside obstacles. Wildlife crossings and guardrails should be prioritized in rural areas.

Vehicle & Behavioral Insights
Cars dominate crash frequency, while motorcycles, pedestrians, and cyclists face higher risks per crash. Protective infrastructure (cycle lanes, raised crossings) and stricter enforcement on risky maneuvers (wrong-side driving, unsafe turns, speeding) are essential. Education programs and enforcement technologies such as speed and lane cameras will further reduce risky behaviors.

Data Quality & Monitoring
Gaps in crash data—especially lighting, weather, and maneuver details—limit precision. Standardized digital reporting, integration with hospital and traffic data, and automated feeds from roadside sensors should be implemented. Public dashboards can enhance transparency and accountability.

Overall, a multi-faceted approach combining safer infrastructure, stricter enforcement, improved vehicle technologies, vulnerable user protection, and stronger data systems will yield the greatest reduction in crash frequency and severity.

##  Power BI report and dashboard: 
## test
### 1. Injury & Severity Analysis

<p align="justify">
The injury analysis highlights the substantial burden of road crashes on public health and emergency services. While fatalities (total 11,225) represent a smaller fraction of outcomes compared to injuries, the total serious (151,786) and moderate injuries (276,656) illustrate the broad impact on healthcare systems and socio-economic stability. Cars and car derivatives dominate across all injury categories, responsible for 5,351 fatalities, 99,263 serious injuries, and 193,480 moderate injuries, reflecting both their prevalence on roads and involvement in multi-vehicle collisions. Light trucks and motorcycles, although fewer in number, contribute disproportionately to fatalities and severe injuries, emphasizing high-risk outcomes for these vehicles. Vulnerable road users, such as pedestrians (1,299 fatalities, 11,311 serious, 11,067 moderate) and pedal cyclists (231 fatalities, 5,991 serious, 6,719 moderate), exhibit high severity relative to their numbers, highlighting the need for targeted protective measures.
</p>

<p align="justify">
Heavy vehicles, including articulated trucks (610 fatalities, 2,853 serious, 4,074 moderate) and rigid trucks (607 fatalities, 3,282 serious, 5,609 moderate), have lower crash frequencies but significantly higher severity when involved. Buses (142 fatalities, 1,155 serious, 2,290 moderate) and other motor vehicles (97 fatalities, 2,019 serious, 3,416 moderate) contribute fewer incidents overall. Non-motorised vehicles (32 fatalities, 261 serious, 412 moderate) and unknown types (17 fatalities, 89 serious, 169 moderate) make up a small proportion of outcomes but still highlight the diversity of road users affected. These figures underscore the layered nature of injury risk: high-frequency vehicles like cars drive the majority of total injuries, while high-risk and vulnerable users are more likely to experience severe or fatal outcomes.
</p>

#### Vehicle Type vs. Injuries

<table>
  <thead>
    <tr>
      <th>Vehicle Type</th>
      <th>Fatalities</th>
      <th>Serious Injuries</th>
      <th>Moderate Injuries</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Car / Car Derivative</td><td>5351</td><td>99263</td><td>193480</td></tr>
    <tr><td>Light Truck</td><td>1695</td><td>21443</td><td>40231</td></tr>
    <tr><td>Pedestrian</td><td>1299</td><td>11311</td><td>11067</td></tr>
    <tr><td>Motorcycle</td><td>1235</td><td>20989</td><td>17041</td></tr>
    <tr><td>Articulated Truck</td><td>610</td><td>2853</td><td>4074</td></tr>
    <tr><td>Heavy Rigid Truck</td><td>607</td><td>3282</td><td>5609</td></tr>
    <tr><td>Pedal Cycle</td><td>231</td><td>5991</td><td>6719</td></tr>
    <tr><td>Bus</td><td>142</td><td>1155</td><td>2290</td></tr>
    <tr><td>Other Motor Vehicle</td><td>97</td><td>2019</td><td>3416</td></tr>
    <tr><td>Non-Motorised Vehicle</td><td>32</td><td>261</td><td>412</td></tr>
    <tr><td>Other or Unknown</td><td>17</td><td>89</td><td>169</td></tr>
  </tbody>
</table>


### 2. Geospatial & Road Type Analysis

<p align="justify">
The geospatial and road type analysis highlights the critical influence of road design on crash frequency and severity. Two-way undivided roads are the most hazardous, recording 62,376 crashes, 1,712 fatalities, 17,143 serious injuries, and 22,377 moderate injuries. T-junctions (39,951 crashes, 344 fatalities, 8,593 serious, 14,738 moderate) and X-intersections (25,150 crashes, 157 fatalities, 4,979 serious, 10,225 moderate) emerge as hotspots for injury crashes due to crossing and turning conflicts. Divided roads (18,815 crashes, 283 fatalities, 3,878 serious, 6,201 moderate) and dual freeways (6,982 crashes, 84 fatalities, 1,450 serious, 2,288 moderate) demonstrate that controlled-access designs reduce both crash frequency and severity. Roundabouts, while reducing fatal outcomes (43 fatalities), still contribute significantly to injuries (1,500 serious, 2,870 moderate), highlighting their mixed impact on road safety.
</p>

<p align="justify">
Less common configurations such as 1-way streets, multiple intersections, Y- and L-junctions, and single limited access roads have lower overall crash counts but may still produce notable injury outcomes per crash due to localized risk factors. For instance, L-junctions recorded 396 crashes, 1 fatality, 70 serious, and 148 moderate injuries, illustrating that even lower-frequency locations require safety interventions. Collectively, these data demonstrate that undivided roads and intersections dominate both crash occurrence and injury outcomes, emphasizing the need for targeted infrastructure improvements such as traffic separation, improved signage, safer turning lanes, and pedestrian protection measures to reduce both fatalities and serious injuries.
</p>

#### Road Type vs. Crashes & Injuries

<table>
  <thead>
    <tr>
      <th>Road Type</th>
      <th>Total Crashes</th>
      <th>Fatalities</th>
      <th>Serious Injuries</th>
      <th>Moderate Injuries</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>2-way undivided</td><td>62376</td><td>1712</td><td>17143</td><td>22377</td></tr>
    <tr><td>T-junction</td><td>39951</td><td>344</td><td>8593</td><td>14738</td></tr>
    <tr><td>Divided road</td><td>18815</td><td>283</td><td>3878</td><td>6201</td></tr>
    <tr><td>X-intersection</td><td>25150</td><td>157</td><td>4979</td><td>10225</td></tr>
    <tr><td>Dual freeway</td><td>6982</td><td>84</td><td>1450</td><td>2288</td></tr>
    <tr><td>Roundabout</td><td>8797</td><td>43</td><td>1500</td><td>2870</td></tr>
    <tr><td>Other</td><td>738</td><td>14</td><td>193</td><td>250</td></tr>
    <tr><td>1-way street</td><td>731</td><td>5</td><td>146</td><td>216</td></tr>
    <tr><td>Multiple intersection</td><td>204</td><td>3</td><td>47</td><td>73</td></tr>
    <tr><td>Y-junction</td><td>194</td><td>2</td><td>43</td><td>80</td></tr>
    <tr><td>Single limited access</td><td>155</td><td>1</td><td>36</td><td>49</td></tr>
    <tr><td>L-junction</td><td>396</td><td>1</td><td>70</td><td>148</td></tr>
    <tr><td>Unknown</td><td>10</td><td>0</td><td>1</td><td>5</td></tr>
  </tbody>
</table>


### 3. Environmental & Weather Analysis

<p align="justify">
Weather conditions significantly influence crash frequency and severity. Most crashes occur during fine weather due to higher traffic exposure, with 133,058 crashes resulting in 2,100 fatalities, 31,238 serious injuries, and 48,144 moderate injuries. However, adverse conditions such as rain, overcast skies, and fog disproportionately increase injury severity per crash. Raining conditions account for 18,054 crashes, 244 fatalities, 3,821 serious injuries, and 6,414 moderate injuries, highlighting the challenges of reduced traction and longer braking distances. Overcast conditions contributed 10,337 crashes with 236 fatalities, 2,279 serious, and 3,854 moderate injuries, while fog or mist, though less frequent at 1,002 crashes, had a high fatality-to-crash ratio with 33 deaths and 236 serious injuries. Snowing conditions, while rare (155 crashes), still resulted in 2 fatalities and 26 serious injuries, illustrating the severity impact of hazardous weather even at low frequency.
</p>

<p align="justify">
Unknown or poorly reported weather conditions also contribute to 1,615 crashes, 26 fatalities, 426 serious injuries, and 550 moderate injuries, highlighting gaps in data collection. These statistics underscore the need for infrastructure and driver interventions under adverse conditions, such as improved drainage, anti-skid surfacing, visibility-enhancing signage, and public awareness campaigns to reduce crash risk during inclement weather.
</p>

#### Weather vs. Crashes & Injuries

<table>
  <thead>
    <tr>
      <th>Weather</th>
      <th>Total Crashes</th>
      <th>Fatalities</th>
      <th>Serious Injuries</th>
      <th>Moderate Injuries</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Fine</td><td>133058</td><td>2100</td><td>31238</td><td>48144</td></tr>
    <tr><td>Raining</td><td>18054</td><td>244</td><td>3821</td><td>6414</td></tr>
    <tr><td>Overcast</td><td>10337</td><td>236</td><td>2279</td><td>3854</td></tr>
    <tr><td>Fog or mist</td><td>1002</td><td>33</td><td>236</td><td>407</td></tr>
    <tr><td>Unknown</td><td>1615</td><td>26</td><td>426</td><td>550</td></tr>
    <tr><td>Other</td><td>278</td><td>8</td><td>53</td><td>94</td></tr>
    <tr><td>Snowing</td><td>155</td><td>2</td><td>26</td><td>57</td></tr>
  </tbody>
</table>


### 4. Geospatial Analysis – High-Risk LGAs

<p align="justify">
The geospatial distribution of crashes highlights significant variation across urban areas. Canterbury-Bankstown records the highest crash volume among the top 10 LGAs, with 8,883 crashes resulting in 59 fatalities, 1,933 serious injuries, and 2,847 moderate injuries. Central Coast follows closely with 7,626 crashes, 98 fatalities, 1,816 serious injuries, and 2,656 moderate injuries. Blacktown and Sydney also report high crash counts, contributing notably to serious and moderate injuries. Parramatta and Cumberland LGAs display similar patterns, with total crashes ranging from 5,623 to 5,685 and fatalities between 42 and 47. Urban LGAs consistently show higher overall crash numbers but lower fatality rates compared to rural areas, reflecting dense traffic, frequent intersections, and active pedestrian zones.
</p>

<p align="justify">
These insights indicate the need for targeted road safety interventions in urban corridors, including infrastructure improvements, pedestrian protection, intersection redesign, and traffic flow management. LGAs with the highest injuries and fatalities should be prioritized for mitigation measures such as enhanced traffic enforcement, safer crossings, and public awareness campaigns to reduce crash risks and improve community safety.
</p>

#### Top 10 Urban LGAs – Crashes & Injuries

<table>
  <thead>
    <tr>
      <th>LGA</th>
      <th>Total Crashes</th>
      <th>Fatalities</th>
      <th>Serious Injuries</th>
      <th>Moderate Injuries</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Canterbury-Bankstown</td><td>8883</td><td>59</td><td>1933</td><td>2847</td></tr>
    <tr><td>Central Coast</td><td>7626</td><td>98</td><td>1816</td><td>2656</td></tr>
    <tr><td>Blacktown</td><td>7177</td><td>59</td><td>1353</td><td>2282</td></tr>
    <tr><td>Sydney</td><td>5750</td><td>44</td><td>1086</td><td>1960</td></tr>
    <tr><td>Parramatta</td><td>5685</td><td>47</td><td>1024</td><td>1692</td></tr>
    <tr><td>Cumberland</td><td>5623</td><td>42</td><td>1094</td><td>1793</td></tr>
    <tr><td>Liverpool</td><td>5272</td><td>41</td><td>1163</td><td>1763</td></tr>
    <tr><td>Fairfield</td><td>4784</td><td>45</td><td>988</td><td>1709</td></tr>
    <tr><td>Wollongong</td><td>4181</td><td>47</td><td>1052</td><td>1487</td></tr>
    <tr><td>Bayside</td><td>4116</td><td>33</td><td>813</td><td>1371</td></tr>
  </tbody>
</table>


### 5. Vehicle Maneuvers & Behavioral Insights

<p align="justify">
The analysis of crash maneuvers highlights how driver and pedestrian actions directly influence crash severity. Proceeding in lane is the most frequent maneuver, accounting for 433,197 crashes, including 6,875 fatalities, 100,437 serious injuries, and 168,014 moderate injuries. Despite its high frequency, this maneuver tends to produce fewer fatalities per incident compared to high-risk actions. Incorrect-side driving, while far less frequent with 15,951 crashes, results in 1,261 fatalities and 7,489 serious injuries, showing a disproportionate risk per crash. Pedestrian behaviors such as walking across the carriageway and running across account for significant fatalities (503 and 127 respectively) and serious injuries, indicating the vulnerability of non-motorized road users. Turning maneuvers also contribute heavily, with turning right (59,671 crashes) and turning left (16,081 crashes) generating a high number of serious and moderate injuries, highlighting intersection-related risks. Crashes involving parked and stationary vehicles remain substantial, with tens of thousands of incidents contributing hundreds of fatalities and thousands of injuries, emphasizing the hazards posed by static vehicles in traffic flow.
</p>

<p align="justify">
These insights underscore the need for targeted interventions to modify risky behaviors and improve maneuver safety. Strategies include enforcement of lane discipline, education on correct-side driving, safer intersection designs to reduce turning conflicts, and pedestrian infrastructure improvements to minimize mid-block crossing risks. Additionally, measures such as clear parking regulations, protected pull-out areas, and warning systems around stationary vehicles can help mitigate incidents related to non-moving vehicles. Understanding how specific maneuvers contribute to crash frequency and severity allows policymakers to prioritize interventions for the most dangerous behaviors, ultimately improving road safety for both vehicle occupants and vulnerable road users.
</p>

#### Crash Data by Maneuver

<table>
  <thead>
    <tr>
      <th>Maneuver</th>
      <th>Total Crashes</th>
      <th>Fatalities</th>
      <th>Serious Injuries</th>
      <th>Moderate Injuries</th>
    </tr>
  </thead>
  <tbody>
    <tr><td>Proceeding in lane</td><td>433197</td><td>6875</td><td>100437</td><td>168014</td></tr>
    <tr><td>Incorrect side</td><td>15951</td><td>1261</td><td>7489</td><td>9327</td></tr>
    <tr><td>Walk across carriageway</td><td>11784</td><td>503</td><td>5550</td><td>5258</td></tr>
    <tr><td>Turning right</td><td>59671</td><td>493</td><td>15011</td><td>25178</td></tr>
    <tr><td>Ped not on carriageway</td><td>2396</td><td>305</td><td>1476</td><td>1867</td></tr>
    <tr><td>Parked</td><td>49964</td><td>259</td><td>7685</td><td>12983</td></tr>
    <tr><td>Stationary</td><td>66745</td><td>246</td><td>8558</td><td>24776</td></tr>
    <tr><td>Run across carriageway</td><td>3587</td><td>127</td><td>1983</td><td>1544</td></tr>
    <tr><td>Pull out opposite</td><td>2878</td><td>108</td><td>985</td><td>1251</td></tr>
    <tr><td>Stand on carriageway</td><td>1660</td><td>107</td><td>727</td><td>850</td></tr>
    <tr><td>Turning left</td><td>16081</td><td>92</td><td>3227</td><td>5163</td></tr>
    <tr><td>Other forward</td><td>24599</td><td>81</td><td>1196</td><td>4551</td></tr>
    <tr><td>Other ped manoeuvre</td><td>956</td><td>80</td><td>381</td><td>402</td></tr>
    <tr><td>Forward from drive</td><td>8530</td><td>67</td><td>1710</td><td>2955</td></tr>
    <tr><td>Broken down</td><td>1203</td><td>65</td><td>354</td><td>489</td></tr>
  </tbody>
</table>
