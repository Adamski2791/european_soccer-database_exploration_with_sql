SELECT 
    Country.name AS country_name, 
    League.name AS league_name, 
    season,
    COUNT(distinct stage) AS number_of_stages,
    COUNT(distinct HT.team_long_name) AS number_of_teams,
    AVG(home_team_goal) AS avg_home_team_goals, 
    AVG(away_team_goal) AS avg_away_team_goals, 
    AVG(home_team_goal-away_team_goal) AS avg_goal_dif, 
    AVG(home_team_goal+away_team_goal) AS avg_goals, 
    SUM(home_team_goal+away_team_goal) AS total_goals                                       

FROM Match

JOIN Country ON Country.id = Match.country_id
JOIN League ON League.id = Match.league_id
LEFT JOIN Team AS HT ON HT.team_api_id = Match.home_team_api_id
LEFT JOIN Team AS AT ON AT.team_api_id = Match.away_team_api_id
                                
WHERE season IN('2015/2016')

GROUP BY Country.name, League.name, season
HAVING count(distinct stage) > 10
ORDER BY total_goals DESC, avg_home_team_goals DESC, avg_away_team_goals DESC;
