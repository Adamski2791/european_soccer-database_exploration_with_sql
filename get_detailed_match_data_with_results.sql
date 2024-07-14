WITH TABLE_1 AS(
SELECT 
    Match.id,
    Country.name AS country_name, 
    League.name AS league_name, 
    season, 
    stage, 
    date,
    HT.team_long_name AS  home_team,
    AT.team_long_name AS away_team,
    home_team_goal, 
    away_team_goal,
    
    CASE
        WHEN home_team_goal > away_team_goal THEN "Win"
        WHEN home_team_goal < away_team_goal THEN "Loss"
        ELSE "Tie"
    END AS home_team_result, 
    
    CASE
        WHEN away_team_goal > home_team_goal THEN "Win"
        WHEN away_team_goal < home_Team_goal THEN "Loss"
        ELSE " Tie"
    END AS away_team_result
    
FROM Match
JOIN Country on Country.id = Match.country_id
JOIN League on League.id = Match.league_id
LEFT JOIN Team AS HT on HT.team_api_id = Match.home_team_api_id
LEFT JOIN Team AS AT on AT.team_api_id = Match.away_team_api_id
)

SELECT *
FROM TABLE_1;
