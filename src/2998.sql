WITH AccumulatedOperations AS (
    SELECT 
        c.id,
        c.name, 
        c.investment, 
        o.month,
        SUM(o.profit) OVER (PARTITION BY c.id ORDER BY o.month) AS total_accumulated
    FROM 
        clients c
    INNER JOIN 
        operations o ON c.id = o.client_id
)

SELECT 
    name, 
    investment, 
    month AS month_of_payback, 
    (total_accumulated - investment) AS return
FROM 
    AccumulatedOperations
WHERE 
    total_accumulated >= investment 
    AND 
    month = (
        SELECT MIN(month) 
        FROM AccumulatedOperations AS sub 
        WHERE sub.id = AccumulatedOperations.id 
          AND sub.total_accumulated >= sub.investment
    )
ORDER BY 
    return DESC;
