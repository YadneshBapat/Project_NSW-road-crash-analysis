-- Injury deep dive analysis

-- Basic Injury Distribution
SELECT 
    SUM(no_killed) AS total_fatal,
    SUM(no_seriously_injured) AS total_serious,
    SUM(no_moderately_injured) AS total_moderate,
    SUM(no_minor_other_injured) AS total_minor
FROM dimcrash;

/*
Fatal crashes: 2,649 — relatively low compared to other injury types.
Serious injuries: 38,079 — significant, likely a priority for road safety interventions.
Moderate injuries: 59,520 — the largest category, shows frequent non-fatal but impactful crashes.
Minor injuries: 41,987 — also substantial, indicating widespread minor crashes.
*/


-- Injury Distribution by Vehicle Type
SELECT 
    t.tu_type_group,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor
FROM dimtrafficunit t
JOIN dimcrash c
    ON t.crash_id = c.crash_id
GROUP BY t.tu_type_group
ORDER BY total_fatal DESC;

/*
Insights from Injury by Vehicle Type

Car/car derivative:
Highest contributor across all injury types, particularly moderate (79,879) and minor (64,286) injuries.
Fatalities also highest at 2,184.
These are clearly the most frequent vehicles involved in crashes.

Light trucks:
Significant in moderate (16,447) and minor (10,857) injuries.
Lower fatalities (726) compared to cars but still relevant for safety programs.

Pedestrians:
Surprisingly high fatalities (514), emphasizing vulnerable road users.
Serious injuries also high relative to total numbers.

Motorcycles:
High fatalities (492) given their proportion.
Moderate and minor injuries also significant, highlighting motorcycle safety issues.

Heavy vehicles (articulated & heavy rigid trucks):
Fatalities (252 + 237 = 489) are concentrated in fewer crashes, but the risk per crash is higher.
Moderate/minor injuries are proportionally lower.

Bicycles and non-motorised vehicles:
Lower counts but still critical in urban areas for vulnerable user safety.

High-risk vehicle focus: Cars, light trucks, motorcycles, and heavy trucks should be the priority for targeted safety programs.
Pedestrian & cyclist safety: Implementing better crossings, speed limits, and awareness campaigns is crucial.
Resource allocation: Road safety enforcement, accident prevention, and education should focus where injury counts and fatalities are highest.
*/

-- Are certain vehicle types more likely to cause serious or fatal injuries when paired with specific crash types?
SELECT 
    t.tu_type_group,
    c.degree_of_crash,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor
FROM dimtrafficunit t
JOIN dimcrash c
    ON t.crash_id = c.crash_id
GROUP BY t.tu_type_group, c.degree_of_crash
ORDER BY total_fatal DESC, total_serious DESC;

/*
Insights from Vehicle Type vs. Crash Severity

Fatal crashes:
Car/car derivative dominates fatalities (2,184), but also has notable serious (1,156) and moderate injuries (1,440).
Light trucks, motorcycles, pedestrians also have high fatal counts, indicating high-risk categories.
Heavy vehicles (articulated & heavy rigid trucks) show fewer crashes but high injury severity per crash.

Injury-only crashes:
Cars and light trucks contribute massively to serious and moderate injuries.
Motorcycles are disproportionately involved in serious/moderate injuries relative to total units.
Pedestrians and pedal cycles also show a significant share of serious injuries, highlighting vulnerable road users.

Non-casualty (towaway):
All vehicle types have zero fatalities or injuries, as expected. These crashes are property damage only, and can be deprioritized for injury-reduction programs

Business Implications

Targeted interventions by vehicle type:
Cars & light trucks: Focus on driver behavior, lane discipline, speeding, and distraction reduction.
Motorcycles: Mandatory protective gear compliance and training programs.
Pedestrians & cyclists: Infrastructure improvements (crossings, bike lanes) and public awareness.
Heavy vehicles: Road design & speed management, plus stricter safety enforcement.
Crash severity focus:
Fatal crashes are relatively fewer but have high societal and economic impact — policies and interventions should prioritize these first.
Injury-only crashes are numerous and indicate areas where minor interventions can reduce serious incidents.
*/

select * from dimcrash limit 10;

-- Where are the most dangerous places for fatal and serious injuries?
SELECT 
    c.type_of_location,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor
FROM dimcrash c
GROUP BY c.type_of_location
ORDER BY total_fatal DESC, total_serious DESC;

/*
1. Fatal Crashes by Location
2-way undivided roads dominate with 1,712 fatalities – more than 64% of all fatal crashes.
Intersections are also dangerous:
T-junctions (344) and X-intersections (157) together make up ~19% of fatal crashes.
High-speed corridors: dual freeways (84) and divided roads (283) still show a considerable number of fatalities, indicating speed and impact severity.
Roundabouts (43) and other junction types (Y, L, multiple intersections) show very low fatal numbers – suggesting they mitigate deadly outcomes compared to open roads.
📌 Story insight: Most fatal crashes occur on 2-way undivided rural or suburban roads where head-on and side-impact collisions are more likely. Intersections (T/X) are the next riskiest locations.

2. Serious & Moderate Injuries
T-junctions (8,593 serious; 14,738 moderate) and X-intersections (4,979 serious; 10,225 moderate) stand out as injury hotspots, even if fatalities are lower than open roads.
2-way undivided roads (17,143 serious; 22,377 moderate) again lead due to exposure and traffic volume.
Roundabouts (1,500 serious; 2,870 moderate): while they don’t eliminate crashes, they reduce fatality risk but still contribute to injuries.
📌 Story insight: Intersections concentrate injury crashes due to crossing and turning movements, while open roads concentrate fatalities due to speed.

3. Minor Injuries
Highest on 2-way undivided roads (11,968) and T-junctions (11,599).
X-intersections (8,178) and roundabouts (2,361) follow.
Dual freeways (1,971) show fewer minor injuries relative to exposure – possibly because crashes there are more severe when they happen.
📌 Story insight: Minor injuries mirror traffic flow intensity – busy urban intersections and undivided roads generate the bulk of lower-severity outcomes.

4. Overall Narrative
Fatal crashes cluster on 2-way undivided high-speed roads.
Injury crashes (serious & moderate) cluster at T- and X-junctions.
Roundabouts reduce fatality risk but still produce many injury crashes.
Freeways, despite high speed, show lower injury volumes compared to arterial roads and intersections, possibly due to controlled access.
*/


