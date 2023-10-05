-- Creating Table 'Daily_Activity'
CREATE TABLE Daily_Activity (
    Id VARCHAR(50),
    ActivityDate DATE,
    TotalSteps INT,
    TotalDistance DOUBLE PRECISION,
    TrackerDistance DOUBLE PRECISION,
    LoggedActivitiesDistance DOUBLE PRECISION,
    VeryActiveDistance DOUBLE PRECISION,
    ModeratelyActiveDistance DOUBLE PRECISION,
    LightActiveDistance DOUBLE PRECISION,
    SedentaryActiveDistance DOUBLE PRECISION,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT,
	Day VARCHAR(50)
);

-- Creating Table 'Sleep'
CREATE TABLE Sleep (
    Id VARCHAR(50),
    SleepDay DATE,
    TotalSleepRecords INT,
    TotalMinutesAsleep DOUBLE PRECISION,
    TotalTimeInBed DOUBLE PRECISION,
    LoggedActivitiesDistance DOUBLE PRECISION,
    VeryActiveDistance DOUBLE PRECISION,
    ModeratelyActiveDistance DOUBLE PRECISION,
    LightActiveDistance DOUBLE PRECISION,
    SedentaryActiveDistance DOUBLE PRECISION,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT,
	Day VARCHAR(50)
);

CREATE TABLE MET (
	Id VARCHAR(50),
    ActivityDate DATE,
    METs INT
);


SELECT * FROM Daily_Activity;
SELECT * FROM Sleep;
SELECT * FROM MET;

-- Checking users insigths
SELECT 
    COUNT(NumberTimesUse) AS Users,
    ROUND((COUNT(NumberTimesUse) / 33) * 100, 2) AS PrecentageOfUsers,
    NumberTimesUse
FROM
    (SELECT 
        Id, COUNT(Id) AS NumberTimesUse
    FROM
        Daily_Activity
    GROUP BY Id) AS UsersImplication
GROUP BY NumberTimesUse
ORDER BY NumberTimesUse DESC;

-- Checking usage range
SELECT 
    TrackerUsage, COUNT(TrackerUsage) AS Users
FROM
    (SELECT 
        Id,
            COUNT(Id) AS NumberTimesUse,
            CASE
                WHEN COUNT(Id) BETWEEN 25 AND 31 THEN 'Active User'
                WHEN COUNT(Id) BETWEEN 15 AND 24 THEN 'Moderate User'
                WHEN COUNT(Id) BETWEEN 0 AND 14 THEN 'Light User'
            END TrackerUsage
    FROM
        Daily_Activity
    GROUP BY Id) AS Ranges
GROUP BY TrackerUsage
ORDER BY Users;

-- Calculate Average
SELECT 
    AVG(TotalSteps) AS AVG_TotalSteps
FROM
    Daily_Activity;

-- Calculate total distance average 
SELECT 
    AVG(TotalDistance) AS AVG_TotalDistance
FROM
    Daily_Activity;

-- Calculate No. of People with Steps>10000 and <1000 (Recommended)
SELECT 
    CompleteStepsRecommendation,
    COUNT(CompleteStepsRecommendation) AS UsersNumber
FROM
    (SELECT 
        Id,
            AVG(TotalSteps) AS AvgTotalSteps,
            CASE
                WHEN AVG(TotalSteps) >= 10000 THEN '10000 or more'
                WHEN AVG(TotalSteps) < 10000 THEN 'less than 10000'
            END CompleteStepsRecommendation
    FROM
        Daily_Activity
    GROUP BY Id) AS Steps
GROUP BY CompleteStepsRecommendation;

-- Calculate (Tracker Active during Sleep)
SELECT 
    ROUND((SleepUsers / 33.0) * 100, 2) AS PercentageSleepUsers,
    ROUND((NonSleepUsers / 33.0) * 100, 2) AS PercentageNonSleepUsers
FROM
    (SELECT 
        COUNT(DISTINCT Id) AS SleepUsers,
            33 - COUNT(DISTINCT ID) AS NonSleepUsers
    FROM
        Sleep) AS SleepUse;
	
-- Sleep Quality	
SELECT 
    SleepQuality,
    ROUND((COUNT(*) / 24.0) * 100, 2) AS PercentageSleepQuality
FROM (
    SELECT 
        Id,
        CASE
            WHEN AVG(TotalMinutesAsleep) < 360 THEN 'Poor Sleep'
            WHEN AVG(TotalMinutesAsleep) >= 360 AND AVG(TotalMinutesAsleep) < 480 THEN 'Good Sleep'
            WHEN AVG(TotalMinutesAsleep) >= 480 THEN 'Excellent Sleep'
        END AS SleepQuality
    FROM
        Sleep
    GROUP BY Id
) AS SleepRange
GROUP BY SleepQuality
ORDER BY SleepQuality;

-- Average Calories
SELECT 
    AVG(Calories) AS AVG_Calories
FROM
    Daily_Activity;


-- Calculate (Average - Sedentary Hours Per Day)
SELECT 
    AVG(SedentaryMinutes) / 60 AS AVG_SedentaryHours
FROM
    Daily_Activity;

-- Calculate (Average - Lightly Active Hours Per Day)
SELECT 
    AVG(LightlyActiveMinutes) / 60 AS AVG_LightlyActiveHours
FROM
    Daily_Activity;

-- Calculate (Average - Fairly Active Minutes Per Day)
SELECT 
    AVG(FairlyActiveMinutes) AS AVG_FairlyActiveMinutes
FROM
    Daily_Activity;

-- Calculate (Average - Very Active Minutes Per Day)
SELECT 
    AVG(VeryActiveMinutes) AS AVG_VeryActiveMinutes
FROM
    Daily_Activity;


-- Correlation
SELECT 
    a.Id,
    AVG(a.TotalSteps) AS AvgTotalSteps,
    AVG(a.VeryActiveMinutes) AS AvgVeryActiveMinutes,
    AVG(a.FairlyActiveMinutes) AS AvgFairlyActiveMinutes,
    AVG(a.LightlyActiveMinutes) AS AvgLightlyActiveMinutes,
    AVG(a.SedentaryMinutes) AS AvgSedentaryMinutes,
    AVG(a.Calories) AS AvgCalories,
    AVG(s.TotalMinutesAsleep) AS AvgTotalMinutesAsleep
FROM
    Daily_Activity AS a
        INNER JOIN
    Sleep AS s ON a.Id = s.Id
GROUP BY a.Id
ORDER BY AvgCalories DESC;

-- Comparison (Activities & Calories)
Select Id,
SUM(TotalSteps) as total_steps,
SUM(VeryActiveMinutes) as total_very_active_mins,
Sum(FairlyActiveMinutes) as total_fairly_active_mins,
SUM(LightlyActiveMinutes) as total_lightly_active_mins,
SUM(Calories) as total_calories
From Daily_Activity
Group By Id

-- Comparison (Sleep & Calories)
Select temp1.Id, SUM(TotalMinutesAsleep) as total_sleep_min,
SUM(TotalTimeInBed) as total_time_inbed_min,
SUM(Calories) as calories
From Daily_Activity as temp1
Inner Join Sleep as temp2
ON temp1.Id = temp2.Id and temp1.ActivityDate = temp2.SleepDay
Group By temp1.Id

-- Average MET per day per use and Comparison with the calories burned
Select Distinct temp1.Id, temp1.ActivityDate, sum(temp1.METs) as sum_mets, temp2.Calories
From MET as temp1
inner join Daily_Activity as temp2
on temp1.Id = temp2.Id and temp1.ActivityDate = temp2.ActivityDate
Group By temp1.Id, temp1.ActivityDate, temp2.Calories
Order by ActivityDate
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY
