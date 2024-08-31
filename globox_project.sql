/*
Question #1: 
The first step of the analysis was writing queries to extract data to use in Google Spreadsheets for the test statistics. Can a user show up more than once in the activity table? Yes or no, and why?
-- Answer: 
Yes, there are repeated user IDs because a user can make purchases on multiple days. 
The number of unique user IDs is: 2094
Meanwhile, the total number of user IDs (including duplicates) is: 2233
*/

-- Query 1 to check the data:
SELECT COUNT(DISTINCT uid) AS unique_user_id
FROM activity;

-- Query 2 to check the data: 
SELECT COUNT(uid) AS total_user_id
FROM activity;

-- Query 3 to check for repeated user IDs:
SELECT uid, COUNT(uid) AS occurrence
FROM activity
GROUP BY uid
HAVING COUNT(uid) > 1;

/*
Question #2: 
What type of join should we use to join the users table to the activity table?
-- Answer: 
LEFT JOIN, because it ensures that all records from the "users" table will be included in the result set, regardless of whether there is a matching record in the "activity" table.
*/

-- Query:
SELECT *
FROM users u
LEFT JOIN activity a
ON u.id = a.uid;

/*
Question #3:
What SQL function can we use to fill in NULL values?
-- Answer: 
It depends on the context of the data. I need to understand why there are NULL values and what they represent. I also need to check how much impact the NULL values have on the data.
The COALESCE() function can be used.
*/

-- Query to filter and replace NULL values:
SELECT
    u.id,
    COALESCE(u.country, 'Unspecified') AS country,
    COALESCE(u.gender, 'Unspecified') AS gender,
    g.group,
    g.join_dt,
    a.dt,
    COALESCE(g.device, 'Unspecified') AS device,
    COALESCE(a.spent, '0') AS spent
FROM users u
LEFT JOIN groups g ON u.id = g.uid
LEFT JOIN activity a ON u.id = a.uid
WHERE u.id IS NOT NULL AND a.dt IS NOT NULL;

/*
Question #4: 
What are the start and end dates of the experiment?
-- Answer: 
Start date: 2023-01-25; End date: 2023-02-06
*/

-- Query:
SELECT
    MIN(join_dt) AS start_date,
    MAX(join_dt) AS end_date
FROM groups;

/*
Question #5: 
How many total users were in the experiment?
-- Answer: 48,943
*/

-- Query:
SELECT COUNT(uid) AS total_users
FROM groups;

/*
Question #6: 
How many users were in the control and treatment groups?
-- Answer a: Number of users in the control group: 24,343
-- Answer b: Number of users in the treatment group: 24,600
*/

-- Query for control group:
SELECT COUNT(uid) AS control_group_users
FROM groups
WHERE group = 'A';

-- Query for treatment group:
SELECT COUNT(uid) AS treatment_group_users
FROM groups
WHERE group = 'B';

/*
Question #7: 
What was the conversion rate of all users?
-- Answer: 
The conversion rate is: 4.28%
*/

-- Query:
WITH user_conversion AS (
    SELECT
        DISTINCT g.uid AS user_id,
        CASE WHEN a.spent > 0 THEN 1 ELSE 0 END AS converted
    FROM users u
    LEFT JOIN groups g ON u.id = g.uid
    LEFT JOIN activity a ON u.id = a.uid
    WHERE u.id IS NOT NULL
)
SELECT ROUND(SUM(converted) * 100.0 / COUNT(*), 2) AS conversion_rate
FROM user_conversion;

/*
Question #8: 
What is the user conversion rate for the control and treatment groups?
-- Answer: 
Control: 3.92%; Treatment: 4.63%
*/

-- Query:
WITH conversion_data AS (
    SELECT
        g.group,
        COUNT(DISTINCT a.uid) AS activity_count,
        COUNT(DISTINCT u.id) AS user_count
    FROM groups g
    LEFT JOIN users u ON u.id = g.uid
    LEFT JOIN activity a ON u.id = a.uid
    GROUP BY g.group
)
SELECT
    group,
    ROUND(CAST(activity_count AS DECIMAL(10, 2)) / CAST(user_count AS DECIMAL(10, 2)) * 100, 2) AS conversion_rate
FROM conversion_data;

/*
Question #9: 
What is the average amount spent per user for the control and treatment groups, including users who did not convert?
-- Answer: 
Control Group: $3.375, Treatment Group: $3.391
*/

-- Query:
WITH user_activity AS (
    SELECT
        u.id AS user_id,
        g.group,
        COALESCE(a.spent, 0) AS spent_usd
    FROM users u
    LEFT JOIN groups g ON u.id = g.uid
    LEFT JOIN activity a ON u.id = a.uid
)
SELECT
    ua.group,
    CAST(SUM(ua.spent_usd) / COUNT(DISTINCT ua.user_id) AS DECIMAL(10, 3)) AS avg_spent_usd
FROM user_activity ua
GROUP BY ua.group;

/*
Question #10: 
Why does it matter to include users who did not convert when calculating the average amount spent per user?
-- Answer: 
To assess the impact on total revenue, we must consider all users, not just those who converted. This approach provides a more accurate representation of the test's impact on revenue.
*/

/*
Question #11: 
How to write a SQL query that returns: the user ID, the user’s country, the user’s gender, the user’s device type, the user’s test group, whether or not they converted (spent > $0), and how much they spent in total ($0+).
*/

-- Query:
SELECT
    u.id AS user_id,
    COALESCE(u.country, 'Unspecified') AS country,
    CASE
        WHEN u.gender IS NULL OR u.gender = 'O' THEN 'Unspecified'
        ELSE u.gender
    END AS gender,
    COALESCE(g.device, 'Unspecified') AS device_type,
    COALESCE(g.group, 'Unspecified') AS test_group,
    CASE
        WHEN COALESCE(a.spent, 0) > 0 THEN 1
        ELSE 0
    END AS converted,
    COALESCE(SUM(COALESCE(a.spent, 0)), 0) AS total_spent_usd
FROM users u
LEFT JOIN groups g ON u.id = g.uid
LEFT JOIN activity a ON u.id = a.uid
GROUP BY user_id, country, gender, device_type, test_group;

/*
Question #12: 
How to check for novelty effects. Users might behave differently when the treatment is new, which is called a novelty effect. Write a SQL query to inspect the difference in key metrics between the groups over time.
*/

-- Query:
SELECT
    g.join_dt AS date_registered,
    a.dt AS date_converted,
    g.group AS user_group,
    CASE
        WHEN COALESCE(a.spent, 0) > 0 THEN 1
        ELSE 0
    END AS converted,
    AVG(CASE WHEN g.group = 'A' THEN COALESCE(a.spent, 0) ELSE 0 END) AS avg_spent_control,
    AVG(CASE WHEN g.group = 'B' THEN COALESCE(a.spent, 0) ELSE 0 END) AS avg_spent_treatment
FROM groups g
LEFT JOIN activity a ON g.uid = a.uid
GROUP BY g.join_dt, a.dt, g.group
ORDER BY a.dt;
