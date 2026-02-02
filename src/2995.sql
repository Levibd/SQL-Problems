SELECT 
    temperature, 
    COUNT(id) AS number_of_records
FROM 
    records
GROUP BY 
    mark, temperature
ORDER BY 
    mark;
