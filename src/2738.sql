SELECT 
    name, 
    ROUND((s.math*2 + s.specific*3 + s.project_plan*5)/10,2) avg
FROM candidate c 
INNER JOIN score s
ON c.id = s.candidate_id
ORDER BY avg DESC

2609 - SELECT 
    c.name,
SUM(p.amount)
FROM products p
INNER JOIN categories c
ON p.id_categories = c.id
GROUP BY c.name
