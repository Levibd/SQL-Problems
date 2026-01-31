WITH total_vencimentos AS (
    SELECT
        ev.matr,
        SUM(v.valor) AS total
    FROM
        emp_venc ev
        INNER JOIN vencimento v ON ev.cod_venc = v.cod_venc
    GROUP BY
        ev.matr
),
total_descontos AS (
    SELECT
        ed.matr,
        SUM(d.valor) AS total
    FROM
        emp_desc ed
        INNER JOIN desconto d ON ed.cod_desc = d.cod_desc
    GROUP BY
        ed.matr
),
salario_liquido AS (
    SELECT
        emp.lotacao_div,
        (COALESCE(tv.total, 0) - COALESCE(td.total, 0)) AS liquido
    FROM
        empregado emp
        LEFT JOIN total_vencimentos tv ON emp.matr = tv.matr
        LEFT JOIN total_descontos td ON emp.matr = td.matr
)

SELECT
    dep.nome AS departamento,
    div.nome AS divisao,
    ROUND(COALESCE(AVG(sal.liquido), 0), 2) AS media,
    ROUND(COALESCE(MAX(sal.liquido), 0), 2) AS maior
FROM
    departamento dep
    INNER JOIN divisao div ON dep.cod_dep = div.cod_dep
    LEFT JOIN salario_liquido sal ON div.cod_divisao = sal.lotacao_div
GROUP BY
    dep.nome, div.nome
ORDER BY
    media DESC;
