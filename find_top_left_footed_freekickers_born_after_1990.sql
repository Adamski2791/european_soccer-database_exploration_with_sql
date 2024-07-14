SELECT player_name
FROM Player
JOIN Player_attributes ON Player.player_api_id = Player_attributes.player_api_id
WHERE overall_rating > 80 
AND preferred_foot = "left" 
AND free_kick_accuracy > 80 
AND birthday > '1990-01-01 00:00:00';
