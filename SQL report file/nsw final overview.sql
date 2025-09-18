
-- RENAME TABLE traffic_crashes TO dimtrafficunit;
ALTER TABLE dimcrash RENAME COLUMN degree_of_crash_detailed TO degree_of_crash__detailed;


-- Row counts
SELECT
  (SELECT COUNT(*) FROM dimcrash) AS dimcrash_rows,
  (SELECT COUNT(*) FROM dimtrafficunit) AS dimtrafficunit_rows;

-- Distinct crash_ids referenced by traffic unit but missing in dimcrash
SELECT DISTINCT t.crash_id
FROM dimtrafficunit t
LEFT JOIN dimcrash d ON t.crash_id = d.crash_id
WHERE d.crash_id IS NULL
LIMIT 50;

-- check for null or bad data rows 
select * from dimcrash where crash_id is null;

-- Value-distribution for severity & months
SELECT degree_of_crash, COUNT(*) FROM dimcrash GROUP BY degree_of_crash ORDER BY COUNT(*) DESC;
SELECT month_of_crash, COUNT(*) FROM dimcrash GROUP BY month_of_crash ORDER BY COUNT(*) DESC;

-- basic eda
SELECT degree_of_crash__detailed, COUNT(*) AS crashes
FROM dimcrash
GROUP BY degree_of_crash__detailed
ORDER BY crashes DESC;

SELECT degree_of_crash, COUNT(*) AS crashes
FROM dimcrash
GROUP BY degree_of_crash
ORDER BY crashes DESC;

/* About 70% of crashes lead to some kind of injury (moderate, serious, or minor).
The fatality rate is ~1.5% of all crashes, which is in line with typical road safety data.
Non-casualty towaway crashes (property damage only) are the largest single category. */

SELECT 
    year_of_crash,
    degree_of_crash__detailed,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY year_of_crash, degree_of_crash__detailed
ORDER BY year_of_crash, crashes DESC;

/* Observations: Crash Trends by Year
-- Overall growth / decline
2016–2017: slight increase in total crashes.
2018–2021: gradual decline in crashes.
2022–2023: non-casualty crashes fluctuate, serious injuries rise slightly in 2023.
Severity patterns
Fatal crashes remain relatively stable (≈260–356 per year) → low, but persistent.
Serious injury crashes fluctuate but are a significant share (~3,000–5,000 per year).
Moderate and minor injuries make up the bulk of injury crashes.
Non-casualty (towaway) is generally the largest single category, as expected.

-- Proportion trends
Despite some fluctuations in total crash counts, the share of fatal crashes is low (~1%).
Serious injuries are ~20–25% of crashes.
Minor/moderate injuries + serious = ~70% of crashes. */

SELECT
    day_of_week_of_crash,
    two_hour_intervals,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY day_of_week_of_crash, two_hour_intervals
ORDER BY day_of_week_of_crash, two_hour_intervals;

-- Observations: Day & Time Patterns
-- Peak crash windows
-- Afternoon to early evening (14:00 – 17:59) consistently has the highest crash counts across all weekdays.
-- Morning rush (06:00 – 09:59) is also busy, especially on Monday, Tuesday, and Thursday.
-- Weekend trends
-- Saturday & Sunday show more even distribution, with slightly later peaks (~10:00–17:59), suggesting leisure/travel activity rather than commuting.
-- Low-risk periods
-- Overnight crashes (00:00 – 05:59) are the lowest, except for small spikes on weekends (likely late-night social or alcohol-related crashes).
SELECT
    two_hour_intervals,
    degree_of_crash__detailed,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY two_hour_intervals, degree_of_crash__detailed
ORDER BY two_hour_intervals, crashes DESC;


-- observations: Severity vs Time-of-Day
-- Peak crash periods for serious/fatal injuries
-- 14:00 – 17:59: highest number of serious injuries (~4,758–4,871) and fatal crashes (~285–315).
-- Morning rush 06:00 – 09:59: moderate peak for serious injuries (~2,783–3,664) and fatal crashes (~184–191).
-- Non-casualty (towaway)
-- Peaks in the same windows as injury crashes (commuting/afternoon periods), indicating more frequent minor collisions or property damage 
-- during high traffic.
-- Overnight low-risk
-- 00:01 – 05:59: fewer crashes overall, but a non-negligible number of fatalities (~115–120).
-- Insight:
-- Enforcement and road safety measures should focus on afternoon peak (14:00–18:00) and morning commute (06:00–10:00), as 
-- these times have the highest volume of injury and fatal crashes.

SELECT 
    lga,
    COUNT(*) AS total_crashes,
    SUM(CASE WHEN degree_of_crash__detailed = 'fatal' THEN 1 ELSE 0 END) AS fatal_crashes,
    SUM(CASE WHEN degree_of_crash__detailed IN ('serious injury','moderate injury','minor/other injury') THEN 1 ELSE 0 END) AS injury_crashes
FROM dimcrash
GROUP BY lga
ORDER BY total_crashes DESC;

-- Observations: Crash Distribution by LGA
/*
High-crash LGAs (total crashes >5,000)
Canterbury-Bankstown (8,883), Central Coast (7,626), Blacktown (7,177), Sydney (5,750), Parramatta (5,685).
These LGAs are densely populated urban areas, consistent with higher traffic volume and congestion.
Fatal vs injury patterns
Fatal crashes are relatively low compared to total crashes. For example, Central Coast has 91 fatalities out of 7,626 total crashes (~1.2%).
Urban areas like Canterbury-Bankstown, Blacktown, Sydney show high injury counts (~3,500–6,200), meaning traffic enforcement and hospital resources are critical there.
Rural LGAs
Fatality counts are sometimes disproportionately high relative to total crashes (e.g., Mid-Coast: 63 fatal crashes out of 2,375 total, ~2.6%), suggesting higher risk per crash in rural areas — likely due to higher speeds and less traffic control.
Recommendations at this stage
Focus urban LGAs on reducing injury and property-damage crashes via traffic management, intersections, and congestion mitigation.
Focus rural LGAs on reducing fatal crashes via speed enforcement, road lighting, signage, and crash prevention education.
*/

SELECT
    lga,
    street_of_crash,
    COUNT(*) AS total_crashes,
    SUM(CASE WHEN degree_of_crash__detailed = 'fatal' THEN 1 ELSE 0 END) AS fatal_crashes,
    SUM(CASE WHEN degree_of_crash__detailed IN ('serious injury','moderate injury','minor/other injury') THEN 1 ELSE 0 END) AS injury_crashes
FROM dimcrash
WHERE lga IN ('canterbury-bankstown','central coast','blacktown','sydney','parramatta')
GROUP BY lga, street_of_crash
ORDER BY total_crashes DESC
LIMIT 20;

/*
Observations 
High-crash streets
Central Coast: Pacific (882), Central Coast (878), Newcastle (825)
Canterbury-Bankstown: Canterbury (853), Hume (760)
Parramatta: Western (623), Cumberland (515)
These streets are clearly the main contributors to total crashes in their LGAs.
Fatal vs injury patterns
Fatal crashes are relatively low on high-crash streets (e.g., Pacific St: 11 fatal crashes out of 882).
Injury crashes dominate, which aligns with the trend we saw at the LGA level — high traffic density leads mostly to injuries rather than fatalities.
Urban vs rural context
All streets above are in urban or metro LGAs, so the focus should be on injury prevention and traffic management.
Fatality risk is proportionally higher in rural LGAs, which we can explore next.
*/

SELECT
    lga,
    street_of_crash,
    two_hour_intervals,
    COUNT(*) AS total_crashes,
    SUM(CASE WHEN degree_of_crash__detailed = 'fatal' THEN 1 ELSE 0 END) AS fatal_crashes,
    SUM(CASE WHEN degree_of_crash__detailed IN ('serious injury','moderate injury','minor/other injury') THEN 1 ELSE 0 END) AS injury_crashes
FROM dimcrash
WHERE lga IN ('canterbury-bankstown','central coast','blacktown','sydney','parramatta')
GROUP BY lga, street_of_crash, two_hour_intervals
ORDER BY total_crashes DESC
LIMIT 50;

/*
16:00 – 17:59 is clearly the busiest crash window, showing up repeatedly across LGAs and streets.
Secondary peaks are 14:00 – 15:59 and 12:00 – 13:59, followed by morning peaks 08:00 – 09:59 and 06:00 – 07:59.
Interpretation: These coincide with afternoon/evening commute times, lunch hours, and morning commutes — classic traffic congestion periods.

High-crash Streets
Canterbury-Bankstown: Canterbury, Hume, South Western
Central Coast: Pacific, Central Coast, Newcastle
Parramatta: Western, Cumberland, Victoria
Blacktown: Western, M7 Westlink, Great Western

Fatal crashes remain low even during peak times (usually 0–3 per two-hour interval).
Injury crashes dominate, e.g., Canterbury St (16:00–17:59): 100 injuries, 0 fatalities.
This aligns with prior trends: urban areas see high injury volumes but relatively fewer fatalities.

Morning peaks (06:00–09:59) are mostly moderate crashes with fewer totals than evening.
Evening peaks (14:00–19:59) show highest total crashes, likely due to traffic density + fatigue + school/work dismissal patterns.
*/
SELECT day_of_week_of_crash,
       SUM(CASE WHEN degree_of_crash__detailed='fatal' THEN 1 ELSE 0 END) AS fatal_crashes,
       SUM(CASE WHEN degree_of_crash__detailed IN ('moderate injury','serious injury','minor/other injury') THEN 1 ELSE 0 END) AS injury_crashes,
       COUNT(*) AS total_crashes
FROM dimcrash
GROUP BY day_of_week_of_crash
ORDER BY total_crashes DESC;

--get insights for above

-- 
SELECT
    lga,
    street_of_crash,
    road_surface,
    surface_condition,
    weather,
    natural_lighting,
    street_lighting,
    signals_operation,
    COUNT(*) AS total_crashes,
    SUM(CASE WHEN degree_of_crash__detailed = 'fatal' THEN 1 ELSE 0 END) AS fatal_crashes,
    SUM(CASE WHEN degree_of_crash__detailed IN ('serious injury','moderate injury','minor/other injury') THEN 1 ELSE 0 END) AS injury_crashes
FROM dimcrash
WHERE lga IN ('canterbury-bankstown','central coast','blacktown','sydney','parramatta')
  AND street_of_crash IN ('pacific','canterbury','central coast','hume','western')
GROUP BY lga, street_of_crash, road_surface, surface_condition, weather, natural_lighting, street_lighting, signals_operation
ORDER BY total_crashes DESC
LIMIT 50;
/*
Initial Observations
Road Surface & Condition
Almost all crashes occur on sealed roads (paved surfaces).
Majority of crashes happen under dry surface conditions; wet/rainy conditions are less common but still contribute to some crashes.
Weather
Most crashes occur in fine weather, with fewer under rain.
Bad weather does not seem to be the main driver for crashes on these major streets.
Lighting
A largeproportion of crashes occur in daylight, followed by darkness (night).
Some crashes occur at dusk.
Street lighting is often unknown/not stated or off, which may indicate areas with poor documentation or unlit streets contributing to risk.
Signals
Most crashes occur at locations with no traffic signals (“nil”), but some occur where signals are present.
Suggests intersections without signals may be higher-risk zones.
Crash Severity
Fatal crashes are low relative to total crashes.
Most crashes are injury or non-fatal, consistent with previous data.
*/
SELECT
    weather,
    degree_of_crash__detailed,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY weather, degree_of_crash__detailed
ORDER BY crashes DESC;

/*
Observations from the data:
Majority of crashes occur in fine weather:
Non-casualty (towaway) and moderate injuries dominate (40k+ and 37k+).
Fatal crashes in fine weather are also highest (1938).
Raining conditions increase severity proportionally:
Non-casualty crashes: 6733
Moderate injuries: 4923
Serious injuries: 3341
Fatal: 230
Overcast conditions:
Non-casualty and moderate injuries still significant.
Fatal crashes lower than fine weather, but serious injuries remain high.
Fog, mist, and snow:
Fewer overall crashes (hundreds), but proportionally a higher ratio of serious and fatal crashes relative to total crashes.
Fatalities: fog/mist = 31, snowing = 2.
Unknown or “other” weather conditions:
Minimal contribution but still present in the dataset.

Observations:
Fine weather dominates crashes, but most are non-casualty or moderate injuries.
Raining and overcast conditions significantly increase the proportion of serious injuries and fatalities relative to the number of crashes.
Fog/mist and snowing have fewer crashes but show higher severity per crash.
Unknown and other weather conditions contribute very little.
Insights:
Poor weather (rain, fog, snow) clearly increases crash severity even if the frequency is lower than fine weather.
Most crashes occur in fine weather simply because most travel happens in those conditions.
Recommendations:
Public safety campaigns targeting adverse weather driving (wet, fog, snow).
Road safety interventions such as reflective signage, anti-skid surfaces, and speed limits during poor weather.
Integration of weather-based traffic warnings in navigation apps and local advisories.
*/
SELECT
    natural_lighting,
    degree_of_crash__detailed,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY natural_lighting, degree_of_crash__detailed
ORDER BY crashes DESC;
/*
Observations from the data:
Daylight dominates crashes:
Most crashes occur during daylight, which is expected due to higher traffic volume.
Moderate injury: 30,604
Non-casualty: 30,138
Serious injury: 22,874
Fatal: 1,469
Darkness:
Total crashes lower than daylight but still substantial.
Non-casualty: 16,130
Moderate injury: 10,792
Serious injury: 8,272
Fatal: 784
Indicates higher risk per vehicle during night hours.
Dusk and dawn:
Crashes fewer than daylight or darkness but proportionally more serious injuries relative to total crashes.
Dusk fatal crashes: 103
Dawn fatal crashes: 96
Unknown lighting:
Minimal impact but still recorded; mostly minor injuries or non-casualty.




Observations:
Majority of crashes occur during daylight, mostly non-casualty and moderate injury.
Crashes during darkness show higher injury/fatality ratios than daylight.
Dusk and dawn have fewer crashes overall, but injuries remain significant.
Unknown lighting conditions are minimal.
Insights:
Reduced natural lighting (darkness, dawn, dusk) increases crash severity.
Visibility plays a key role in crash outcomes.
Recommendations:
Improve street lighting in high-traffic areas, especially intersections.
Encourage use of headlights during dawn, dusk, and poor visibility conditions.

Public campaigns on night driving safety.*/
SELECT
    street_lighting,
    degree_of_crash__detailed,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY street_lighting, degree_of_crash__detailed
ORDER BY crashes DESC;
/*
Unknown / Not Stated
Highest number of crashes recorded in this category, mostly non-casualty and minor injuries:
Non-casualty: 33,929
Minor/other: 17,495
Moderate injury: 10,763
Serious injury: 1,962
Fatal: 14
Likely due to incomplete data reporting.
Off lighting (street lights off)
Moderate and serious injuries are higher when street lights are off:
Moderate: 13,636
Serious: 11,977
Minor: 5,339
Non-casualty: 4,938
Fatal: 574
Indicates higher severity risk when street lighting is off.
Nil lighting (no street lights present)
Serious and moderate injuries still significant:
Serious: 13,469
Moderate: 13,240
Non-casualty: 5,153
Minor: 4,623
Fatal: 1,488

Suggests that areas without street lighting are prone to more severe crashes.
On lighting (street lights on)
Crashes still occur but severity is lower than in off/nil conditions:
Moderate: 8,025
Non-casualty: 7,742
Serious: 6,660
Minor: 3,096
Fatal: 376
Observations:
Crashes on roads with unknown/not stated lighting dominate, followed by off (no lighting), then nil (no artificial lights).
Roads with active lighting (on) show reduced non-casualty crashes but still significant moderate and serious injuries.
Fatal crashes are higher in areas without lighting.

Insights:
Proper street lighting is strongly correlated with reduced crash frequency and severity.
Absence of lighting or unknown lighting status increases the risk of injuries and fatalities.
Recommendations:
Prioritize installing or upgrading street lighting in high-risk areas.
Audit areas with “unknown / not stated” lighting and update infrastructure records.
Combine lighting upgrades with traffic calming measures in high-incident zones.
*/


SELECT
    road_surface,
    surface_condition,
    degree_of_crash__detailed,
    COUNT(*) AS crashes
FROM dimcrash
GROUP BY road_surface, surface_condition, degree_of_crash__detailed
ORDER BY crashes DESC;
/*
Observations from the data:
Sealed & Dry Roads
Highest number of crashes overall, but mostly non-casualty and moderate injuries:
Non-casualty: 40,780
Moderate: 37,123
Serious: 27,888
Minor/other: 25,899
Fatal: 1,987
Likely reflects that most traffic occurs on sealed, dry roads.
Sealed & Wet Roads
Crashes reduce in number but still significant:
Non-casualty: 9,709
Moderate: 7,079
Serious: 4,761
Minor/other: 4,058
Fatal: 348
Suggests wet conditions increase the risk per vehicle-km traveled, even though overall numbers are lower than dry roads.

Unsealed & dry Roads
Crashes are lower in frequency but severity is relatively high for serious injuries:
Serious: 1,026
Moderate: 1,011
Non-casualty: 764
Minor/other: 394
Fatal: 87
Snow/Ice & Unknown Conditions
Very few crashes, but fatalities and serious injuries can still occur, e.g.,
Sealed snow/ice: 1 fatal, 33 serious injuries
Unsealed snow/ice: 5–4 crashes across categories, mostly minor



Observations:
Sealed & dry roads have the most crashes, mainly non-casualty and moderate injuries (reflecting traffic volume).
Sealed & wet roads have fewer crashes but a higher relative severity (injuries/fatalities).
Unsealed roads have fewer crashes but more serious injuries per crash.
Snow or ice surfaces have minimal crashes but still risk serious injury or fatality.
Insights:
Wet or unsealed roads are disproportionately hazardous compared to dry sealed roads.
Road surface quality and condition directly influence crash severity.

Recommendations:
Prioritize road surface maintenance on unsealed and wet-prone areas.
Apply anti-skid treatments, especially for wet roads or high-speed areas.
Include weather/road condition warnings in traffic management systems.
Implement driver awareness campaigns for slippery conditions.
*/

SELECT
    tu_type_group,
    COUNT(*) AS total_units
FROM dimtrafficunit
GROUP BY tu_type_group
ORDER BY total_units DESC;
/*
.Cars dominate crashes:
Car/car derivative accounts for ~71% of total traffic units involved in crashes (214,099 out of ~300,000).
Light trucks and motorcycles are the next most common, but much lower at ~14% and ~6% respectively.
Vulnerable road users:
Pedestrians (~9,350) and pedal cycles (~6,130) make up a smaller proportion (~5%), but these represent high-risk groups due to vulnerability in crashes.
Heavy vehicles:
Heavy rigid trucks, articulated trucks, and buses together constitute ~4.7% of traffic units.
While less frequent, collisions involving these vehicles may result in more severe outcomes.
Negligible/Unknown categories:
Non-motorised vehicles (~563) and other or unknown (~562) have very low representation, suggesting minimal impact on aggregate crash statistics.


Recommendations
Targeted safety campaigns:
Focus on cars and light trucks, as these dominate crashes. Include defensive driving programs and awareness for high-risk behaviors.
Protect vulnerable users:
Implement pedestrian and cyclist safety measures, especially at intersections and high-traffic areas.
Heavy vehicle monitoring:
Enforce stricter regulations and training for trucks and buses, as crashes with these vehicles may have higher severity even if less frequent.
Data quality checks:
Investigate the ‘other or unknown’ and non-motorised categories to ensure accurate crash reporting.
*/


SELECT
    tu_role_in_first_impact,
    COUNT(*) AS total_units
FROM dimtrafficunit
GROUP BY tu_role_in_first_impact
ORDER BY total_units DESC;
/*
Insights – Role of Traffic Units in Crashes
Key traffic units dominate crashes:
Key traffic unit = 164,499 (~55% of total units)
These are the vehicles directly involved in the first impact, so they are the primary contributors to crash events.
Secondary or peripheral vehicles:
Other traffic unit = 116,973 (~39%)
These vehicles are involved but not the main impact initiator. They may be contributing to secondary collisions or following too closely.
Minor role vehicles:
Traffic unit not in 1st impact = 27,175 (~9%)
These are vehicles in the vicinity but not directly involved in the initial collision.

Recommendations
Focus interventions on key traffic units:
Since over half of the units are “key,” driver behavior, vehicle condition, and adherence to traffic rules for these units should be the primary target.
Investigate secondary crash patterns:
“Other traffic units” may indicate chain-reaction crashes. Mapping locations and timing could reveal hotspot areas for multi-vehicle incidents.
Monitor high-risk areas for peripheral involvement:
Even “not in 1st impact” vehicles can be at risk. Safety measures like better signage, lane discipline, and road design may reduce their involvement.
*/

SELECT
    street_of_travel,
    COUNT(*) AS total_units
FROM dimtrafficunit
GROUP BY street_of_travel
ORDER BY total_units DESC
LIMIT 50;
/*
Street of crash dominates:
Street of crash = 262,748 (~85% of total units)
This indicates that the majority of traffic units were on the main crash street when involved in the collision. This is expected and confirms that most crashes happen on actual roadways rather than off-road or unknown areas.
“In ID feature” units:
45,240 (~14%)
Likely represents units on internal roads, parking lots, driveways, or minor lanes. These are still relevant but form a smaller subset of crashes.
Unknown locations:
659 (<1%)
Data quality issue: a small fraction of entries lacks proper street information.

Recommendations
Focus safety interventions on main streets:
Since most crashes happen on “street of crash,” prioritize traffic calming measures, improved signage, speed control, and lane management on these streets.
Investigate minor roads (“in id feature”):
Though smaller in number, these may involve different patterns (e.g., turning crashes, parking lot incidents). Special attention may reduce minor but recurring crashes.
Improve data quality:
Address the <1% of “unknown” street entries. Accurate location data is essential for effective road safety planning and hotspot analysis.
*/

SELECT object_hit_1, object_hit_2, 
COUNT(*) AS total_units
FROM dimtrafficunit
WHERE object_hit_1 IS NOT NULL
GROUP BY object_hit_1, object_hit_2
ORDER BY total_units DESC
LIMIT 20;
/*
Insights:
Most common objects hit (object_hit_1)
Trees/bushes top the list with 7,342 incidents, followed by utility poles (4,369) and fences (4,324).
Fixed roadside infrastructure such as guardrails (2,763) and embankments (2,564) also contribute significantly to crashes.
Secondary impacts (object_hit_2)
The majority of object_hit_2 values are NULL, meaning most crashes involve only a single object.
Some multiple-object collisions exist, e.g., tree/bush with tree/bush (967) and fence with tree/bush (472), showing a small but notable proportion of chain collisions or secondary impacts.
Nature of hazards
High frequency of natural obstacles (trees, embankments) indicates crashes occur along roadsides with vegetation or uneven terrain.
Utility poles and fences being common suggest urban and suburban roads with roadside infrastructure are also hotspots.
Stray animals (kangaroo: 921) and falling objects (557) highlight wildlife and environmental risk factors, particularly in rural or semi-rural areas.

Recommendations:
Roadside hazard management
Trim or remove high-risk trees/bushes near roadways, especially along high-speed roads.
Improve roadside barriers (guardrails, fences) and their placement to reduce secondary collisions.
Infrastructure planning
Reassess placement of utility poles and other fixed objects near high-traffic areas. Consider protective barriers or relocation.
Wildlife and environmental interventions
Install wildlife crossings, fencing, and warning signs in rural zones where kangaroo or straying stock collisions are frequent.
Regular maintenance to prevent objects like debris or falling branches from entering roadways.
Driver awareness and road safety campaigns
Educate drivers about roadside hazards, especially in areas prone to trees, embankments, and animals.
Encourage speed reduction in high-risk zones to mitigate impact severity.
*/

SELECT
    direction_of_travel,
    COUNT(*) AS total_units
FROM dimtrafficunit
GROUP BY direction_of_travel
ORDER BY total_units DESC;

/*
nsights:
Predominant travel directions
North-bound (82,260) and South-bound (79,980) vehicles account for the majority of traffic units involved in crashes.
East (71,881) and West (69,912) are slightly lower but still significant.
Unknown directions
4,614 records have unknown travel direction, which might indicate missing or inconsistent data.
Implications
North-south corridors appear to carry heavier traffic or have higher crash risk, possibly due to major highways, arterial roads, or peak directional flows.
Direction of travel may correlate with road type, congestion, and crash type (e.g., frontal vs side collisions).

Recommendations:
Targeted safety interventions
Focus north-south corridors for road safety audits, signage, and hazard mitigation measures.
Analyze high-crash segments by direction to identify factors like intersections, curves, or roadside objects.
Traffic flow and monitoring
Implement traffic monitoring (speed cameras, sensors) in high-volume north-south routes to detect risky driving behaviors.
Data quality improvement
Investigate and correct the 4,614 unknown direction records to enhance analysis accuracy.
*/

SELECT tu_controlled_flag, COUNT(*) AS total_units
FROM dimtrafficunit
GROUP BY tu_controlled_flag;
/*
Insight – Controlled Flag (tu_controlled_flag)
Controlled units (y): 288,248 (~93%)
Uncontrolled units (n): 20,399 (~7%)
Interpretation:
Most traffic units involved in crashes were controlled, meaning they were actively being driven or maneuvered.
The small proportion of uncontrolled units could represent parked vehicles, runaway vehicles, or objects moved by external forces, which might be worth deeper investigation if analyzing crash causes.
Recommendation:
Focus safety interventions primarily on controlled vehicles (driver behavior, traffic rules, and maneuvers).
Investigate the uncontrolled units separately to see if patterns emerge (e.g., crashes in parking areas, hit-and-run, mechanical failures).
*/

SELECT manoeuvre, COUNT(*) AS total_units
FROM dimtrafficunit
GROUP BY manoeuvre
ORDER BY total_units DESC
LIMIT 20;
/*
Insight – Traffic Unit Manoeuvre
Proceeding in lane: 178,228 (~62%) – The vast majority of units were simply moving along the lane.
Stationary: 28,084 (~10%) – Vehicles that were stopped, which could indicate intersection crashes or rear-end collisions.
Turning right/left: 24,600 (right) + 6,590 (left) – ~11% combined; turning maneuvers are a significant crash risk.
Parked / Parked other: 20,231 + 1,101 – stationary objects still contribute to collisions.
Other noteworthy risky manoeuvres:
Incorrect side: 6,519 – Wrong-side driving is a high-risk behavior.
U-turns / veering / pulling out / crossing carriageway: Smaller counts but high severity potential.
Interpretation:
Most crashes involve normal lane movement, but turns, U-turns, and wrong-side driving are disproportionately risky.
Pedestrian-related manoeuvres (walk across carriageway, ped not on carriageway) are less frequent but critical for safety interventions.

Recommendations:
Intersection and turning safety: Install better signals, lane markings, and driver awareness campaigns.
Stationary vehicle zones: Improve visibility and signage around parked/stopped vehicles.
Target high-risk manoeuvres: Enforcement and education for incorrect side driving, U-turns, and pedestrian crossings.
Pedestrian safety: Highlight crossing zones and implement traffic calming near high pedestrian traffic.
*/
