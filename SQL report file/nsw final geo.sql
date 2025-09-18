-- temporal / geo analysis deep dive

-- Identify high-risk periods for crashes (by severity/type of crash/vehicle type).
SELECT 
    two_hour_intervals,
    SUM(no_killed) AS total_fatal,
    SUM(no_seriously_injured) AS total_serious,
    SUM(no_moderately_injured) AS total_moderate,
    SUM(no_minor_other_injured) AS total_minor,
    COUNT(crash_id) AS total_crashes
FROM dimcrash
GROUP BY two_hour_intervals
ORDER BY total_crashes DESC;

-- Crashes by Day of Week → to see if these peak times align with weekdays (commute) or weekends

SELECT 
    day_of_week_of_crash,
    SUM(no_killed) AS total_fatal,
    SUM(no_seriously_injured) AS total_serious,
    SUM(no_moderately_injured) AS total_moderate,
    SUM(no_minor_other_injured) AS total_minor,
    COUNT(*) AS total_crashes
FROM dimcrash
GROUP BY day_of_week_of_crash
ORDER BY 
    CASE day_of_week_of_crash
        WHEN 'monday' THEN 1
        WHEN 'tuesday' THEN 2
        WHEN 'wednesday' THEN 3
        WHEN 'thursday' THEN 4
        WHEN 'friday' THEN 5
        WHEN 'saturday' THEN 6
        WHEN 'sunday' THEN 7
        ELSE 8
    END;

/*
Weekday trends (Monday–Friday)
Total crashes increase gradually from Monday (21,953) to Friday (26,381).
Fatalities and serious injuries also increase toward the end of the workweek.

⚠️ Observation: Friday is the highest-risk day, likely due to heavier traffic and possibly riskier driver behavior near the weekend.
Weekend trends (Saturday–Sunday)
Saturday (24,211 crashes) and Sunday (20,269 crashes) show lower total crashes than weekdays, but:
Saturday has the highest fatalities (487) and serious injuries (5,875) relative to total crashes → crashes are more severe.
Sunday shows lower crash count but still high fatalities (396).

⚠️ Observation: Weekend crashes, while fewer, are higher severity, possibly due to leisure travel, speeding, or alcohol-related incidents.
Combining with Time-of-Day Patterns
Afternoon rush hours (14:00–18:00) combined with Friday and Saturday peaks may highlight critical windows for interventions.
Early mornings and late nights on weekends may contribute disproportionately to fatalities.   

Business Implications / Recommendations
Weekday interventions: Focus traffic enforcement on Friday afternoons for high-volume commuting risks.
Weekend safety campaigns: Target Saturday and Sunday mornings/afternoons for speeding, alcohol, and distracted driving prevention.
Public awareness: Inform citizens of higher-risk times and days to improve preventive behavior.
Policy planning: Consider temporary traffic calming measures on weekends in high-risk areas.
*/

SELECT 
    month_of_crash,
    SUM(no_killed) AS total_fatal,
    SUM(no_seriously_injured) AS total_serious,
    SUM(no_moderately_injured) AS total_moderate,
    SUM(no_minor_other_injured) AS total_minor,
    COUNT(crash_id) AS total_crashes
FROM dimcrash
GROUP BY month_of_crash
ORDER BY 
    CASE month_of_crash
        WHEN 'january' THEN 1
        WHEN 'february' THEN 2
        WHEN 'march' THEN 3
        WHEN 'april' THEN 4
        WHEN 'may' THEN 5
        WHEN 'june' THEN 6
        WHEN 'july' THEN 7
        WHEN 'august' THEN 8
        WHEN 'september' THEN 9
        WHEN 'october' THEN 10
        WHEN 'november' THEN 11
        WHEN 'december' THEN 12
    END;

/*
Observations from Month-wise Crash Data

Peak crash months:
May (15,216 total crashes) and March (14,767) are the months with the highest total crashes.
Lowest crash months: October (13,582) and September (13,205).

Fatal crashes:
Relatively steady across the year (~190–240), with March, April, September, December on the higher side.
This indicates fatalities don’t fluctuate as much as total crashes; severity remains fairly consistent.

Injury trends:
Moderate and minor injuries follow total crash trends closely.
Serious injuries peak in May (3,563), which coincides with total crash peak, highlighting a month of heightened risk.

Seasonal effect:
May and March are autumn and early autumn months in Australia — could reflect road/weather conditions, school/work activity, or holidays.
No extreme spikes in December/January (summer), indicating weather alone may not drive the crash peaks.
*/

SELECT 
    t.manoeuvre,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor,
    COUNT(c.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c 
    ON t.crash_id = c.crash_id
GROUP BY t.manoeuvre
ORDER BY total_crashes DESC;

/*
Insights from Manoeuvre Analysis

Most common manoeuvres contributing to crashes:
Proceeding in lane: 178,228 crashes (mostly moderate/minor injuries).
Stationary vehicles: 28,084 crashes (mainly minor injuries, likely rear-end or collisions at stop).
Turning right / turning left: 24,600 and 6,590 crashes respectively (higher serious injury proportion in turning left).
High-risk manoeuvres for fatalities:
Incorrect side driving: 528 fatalities in 6,519 crashes → extremely high fatality rate (~8%).
Walk across carriageway / run across carriageway / pedestrians not on carriageway: high fatalities relative to total crashes — pedestrian risk is high.
Turning movements (right/left) and u-turns: fatalities lower in absolute number but still critical to monitor.
Minor vs major injury patterns:
Proceeding in lane & stationary: most crashes but mostly moderate/minor injuries.
Pedestrian & incorrect side crashes: fewer total incidents but higher fatality proportion.
*/

SELECT 
    tu_type_group,
    manoeuvre,
    SUM(no_killed) AS total_fatal,
    SUM(no_seriously_injured) AS total_serious,
    SUM(no_moderately_injured) AS total_moderate,
    SUM(no_minor_other_injured) AS total_minor,
    COUNT(c.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
GROUP BY tu_type_group, manoeuvre
ORDER BY total_fatal DESC, total_crashes DESC
LIMIT 50;

/*
High-risk manoeuvre + vehicle type combinations for fatalities:
Car/car derivative – proceeding in lane: 1,425 fatalities, highest absolute number.
Car/car derivative – incorrect side: 342 fatalities, very high fatality rate relative to total crashes.
Pedestrian – walk across carriageway: 211 fatalities.
Motorcycle – proceeding in lane: 379 fatalities.
Light truck – incorrect side: 91 fatalities.

Manoeuvres with high minor/moderate injuries but fewer fatalities:
Car/car derivative – stationary or turning right/left: high total crashes (15k–20k) but fatalities are lower.
Indicates high frequency but lower lethality, suggesting enforcement or infrastructure focus to reduce congestion/collisions.

Pedestrian risk:
Walk across carriageway, run across carriageway, stand on carriageway → fatalities 50–211.
Pedestrians are highly vulnerable despite lower total crash counts.

Heavy vehicles:
Articulated trucks / heavy rigid trucks – proceeding in lane → fatalities lower than cars, but serious/moderate injuries notable.
Incorrect side manoeuvres in heavy vehicles are rare but extremely dangerous.
*/

SELECT 
    t.tu_type_group,
    t.manoeuvre,
    t.object_hit_1,
    t.object_hit_2,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor,
    COUNT(c.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
GROUP BY t.tu_type_group, t.manoeuvre, t.object_hit_1, t.object_hit_2
ORDER BY total_fatal DESC, total_crashes DESC
LIMIT 50;


--

SELECT 
    t.manoeuvre,
    t.object_hit_1,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    COUNT(c.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
WHERE t.tu_type_group = 'pedestrian'
GROUP BY t.manoeuvre, t.object_hit_1
ORDER BY total_fatal DESC;
/*
High-risk pedestrian manoeuvres:

walk across carriageway → 209 fatalities, 2,220 serious injuries, 4,767 crashes
ped not on carriageway → 95 fatalities, 535 serious injuries
run across carriageway → 49 fatalities, 839 serious injuries
stand on carriageway → 44 fatalities, 314 serious injuries
✅ Clearly, crossing the road unsafely or standing in traffic lanes is the most dangerous behaviour.

Impact of object collisions:
Most pedestrian fatalities occur with null object hit → indicates vehicle-to-pedestrian collisions, not fixed object collisions.
Fixed objects like fences, utility poles, barriers have very few fatalities but still contribute to minor/moderate injuries.
Other behaviours:
Activities like walk with traffic, work on vehicle, step off/onto median or in/on toy vehicle contribute smaller numbers but indicate specific vulnerable subgroups (e.g., children, workers, skateboarders).
*/

SELECT 
    c.type_of_location,
    c.street_type,
    t.manoeuvre,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    COUNT(c.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
WHERE t.tu_type_group = 'pedestrian'
GROUP BY c.type_of_location, c.street_type, t.manoeuvre
ORDER BY total_fatal DESC, total_serious DESC
LIMIT 50;

/*
Key Observations from Output 1

High-risk locations:
2-way undivided roads (rd/st) → dominate both fatalities and serious injuries:
ped not on carriageway → 34 fatalities, 132 serious injuries
walk across carriageway → 27 fatalities, 264 serious injuries
X-intersections and T-junctions also have high pedestrian risk for walk across carriageway.

Street types:
st (street) and rd (road) contribute the majority of pedestrian fatalities.
Highways (hwy) show fewer crashes but each crash can still be severe.
Manoeuvre risk per location:
Crossing mid-block (walk across carriageway) and standing on carriageway are the most dangerous.
ped not on carriageway also shows high fatality on 2-way undivided roads — indicates pedestrian activity outside designated crossings.

Other insights:
Roundabouts and dual freeways have lower absolute numbers, but serious incidents still occur.
Some unusual street types (dstr, cres, ave) also appear with fatal outcomes, showing pedestrians are vulnerable across all urban environments.
*/

SELECT 
    t.tu_role_in_first_impact,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor,
    COUNT(c.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
GROUP BY t.tu_role_in_first_impact
ORDER BY total_crashes DESC;
/*
Insights from the output:

Key traffic units are involved in the majority of crashes (164,499) and also account for the highest number of fatalities and injuries. This makes sense—they are usually the main vehicle in the crash.
Other traffic units are also significantly involved (116,973 crashes) and contribute notably to serious and moderate injuries.
Traffic units not in first impact have the lowest counts across all injury levels, which is expected—they are secondary or uninvolved vehicles.

Business implication:
Safety measures and crash prevention programs should prioritize key traffic units because they account for the bulk of severe crashes.
Focused driver awareness campaigns and stricter enforcement for key vehicles can reduce fatalities and injuries.
Secondary vehicles still need attention, especially in complex intersections or heavy traffic areas.
*/

SELECT 
    t.object_hit_1,
    t.object_hit_2,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor,
    COUNT(t.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
WHERE t.object_hit_1 IS NOT NULL
GROUP BY t.object_hit_1, t.object_hit_2
ORDER BY total_crashes DESC
LIMIT 20;

/*
Top hazardous objects:

tree/bush (7,342 crashes) is the most frequently hit object, with 354 fatalities and over 2,600 serious injuries.
utility pole and fence are also major contributors to injuries.
Safety barriers (s/barrier - guardrail) appear frequently, indicating crashes into protective infrastructure, but with relatively fewer fatalities.
Wildlife & environmental hazards:
kangaroo and straying stock account for 921 and 578 crashes respectively, which mostly result in minor or moderate injuries.
Combined object hits:
A small but notable number of crashes involve multiple hits, like tree/bush & tree/bush


*/
SELECT 
    t.manoeuvre,
    t.object_hit_1,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor,
    COUNT(t.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
WHERE t.object_hit_1 IN ('tree/bush', 'utility pole', 'fence')
GROUP BY t.manoeuvre, t.object_hit_1
ORDER BY total_crashes DESC;

/*
Most frequent high-risk combinations:
proceeding in lane hitting tree/bush → 8184 crashes (446 fatalities, 3021 serious injuries).
proceeding in lane hitting fence → 4507 crashes.
proceeding in lane hitting utility pole → 4159 crashes.

High fatality counts:
proceeding in lane crashes with trees and utility poles are the deadliest.
incorrect side manoeuvres also have high fatality per crash ratio (13 fatalities in 109 crashes hitting trees).

Turning & U-turns:
Fewer crashes than straight-line lane travel, but some U-turns and turning right/left show disproportionate serious/moderate injuries per crash.
Low-frequency manoeuvres:
walk across carriageway, ped not on carriageway, along footpath — these involve pedestrian/cyclist crashes, lower count but still fatal or serious injuries.
*/


SELECT 
    c.type_of_location,
    t.object_hit_1,
    SUM(c.no_killed) AS total_fatal,
    SUM(c.no_seriously_injured) AS total_serious,
    SUM(c.no_moderately_injured) AS total_moderate,
    SUM(c.no_minor_other_injured) AS total_minor,
    COUNT(t.crash_id) AS total_crashes
FROM dimtrafficunit t
JOIN dimcrash c ON t.crash_id = c.crash_id
WHERE t.object_hit_1 IN ('tree/bush', 'utility pole', 'fence')
GROUP BY c.type_of_location, t.object_hit_1
ORDER BY total_crashes DESC;
/*
High-risk locations
2-way undivided roads dominate crashes for all three top objects (tree/bush, fence, utility pole) with 6429, 3374, and 2459 crashes respectively.
T-junctions also have high crash counts, especially for fences and utility poles (~1130 and 1114 crashes).
Fatalities
Trees/bushes on 2-way undivided roads contribute to the highest fatalities (394), closely followed by fences (88) and utility poles (84).
T-junctions: fatalities are lower but still significant for utility poles (28) and trees/bushes (28).
Roundabouts & dual freeways
Fewer crashes, but injury counts remain significant, indicating that even low-frequency locations can have serious consequences.
E.g., tree/bush crashes on dual freeways: 12 fatal, 91 serious injuries in 219 crashes → higher fatality ratio per crash than some other locations.
Low-frequency locations
Single limited access, y-junctions, and 1-way streets have fewer total crashes but still contribute to fatalities and serious injuries.
Indicates that even uncommon road types need safety interventions.
*/







