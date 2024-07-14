SELECT 
    country.name AS country_name,
    league.name AS league_name

FROM League
LEFT JOIN Country
ON country.id = league.country_id
ORDER BY country.name
