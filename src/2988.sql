SELECT 
    t.name,
    COUNT(results.team) AS matches,
    SUM(results.victories) AS victories,
    SUM(results.defeats) AS defeats,
    SUM(results.draws) AS draws,
    SUM(results.score) AS score
FROM teams t
JOIN (
    
    SELECT 
        team_1 AS team,
        CASE WHEN team_1_goals > team_2_goals THEN 1 ELSE 0 END AS victories,
        CASE WHEN team_1_goals < team_2_goals THEN 1 ELSE 0 END AS defeats,
        CASE WHEN team_1_goals = team_2_goals THEN 1 ELSE 0 END AS draws,
        CASE 
            WHEN team_1_goals > team_2_goals THEN 3 
            WHEN team_1_goals = team_2_goals THEN 1 
            ELSE 0 
        END AS score
    FROM matches

    UNION ALL

    
    SELECT 
        team_2 AS team,
        CASE WHEN team_2_goals > team_1_goals THEN 1 ELSE 0 END AS victories,
        CASE WHEN team_2_goals < team_1_goals THEN 1 ELSE 0 END AS defeats,
        CASE WHEN team_2_goals = team_1_goals THEN 1 ELSE 0 END AS draws,
        CASE 
            WHEN team_2_goals > team_1_goals THEN 3 
            WHEN team_2_goals = team_1_goals THEN 1 
            ELSE 0 
        END AS score
    FROM matches
) AS results ON t.id = results.team
GROUP BY t.name
ORDER BY score DESC;
