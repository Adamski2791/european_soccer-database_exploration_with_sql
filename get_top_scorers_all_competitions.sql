SELECT team.team_long_name, SUM(m.home_team_goal + m.away_team_goal) AS total_goals
FROM match AS m
JOIN team ON (m.home_team_api_id = team.team_api_id OR m.away_team_api_id = team.team_api_id)
GROUP BY team.team_long_name
ORDER BY total_goals DESC;
