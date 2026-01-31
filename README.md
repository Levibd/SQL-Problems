# 🗃️ Desafio SQL - Acelera ZG

> Repositório destinado à resolução de desafios de banco de dados (PostgreSQL) da plataforma **Beecrowd**, como parte das atividades do programa de aceleração da ZG.

![Status](http://img.shields.io/static/v1?label=STATUS&message=CONCLUIDO&color=GREEN&style=for-the-badge)
![Database](http://img.shields.io/static/v1?label=DATABASE&message=POSTGRESQL&color=BLUE&style=for-the-badge)

## 🎯 Objetivo
Demonstrar proficiência em consultas SQL, evoluindo de seleções simples até o uso de recursos avançados como **Window Functions**, **CTEs (Common Table Expressions)** e **Subqueries** complexas para análise de dados e relatórios gerenciais.


## 🧠 O que eu aprendi
Durante a execução deste desafio, pude consolidar e aprender novas técnicas para resolver problemas reais de banco de dados:

* **Manipulação de Nulos:** Aprendi a usar `COALESCE` para tratar valores nulos em relatórios financeiros, garantindo que médias e somas não quebrem (Problema 2989).
* **Window Functions:** Conheci o conceito de particionamento e ordenação dentro de janelas (`OVER PARTITION BY`) para criar somas acumuladas (Running Totals) sem precisar de loops externos (Problema 2998).
* **Otimização de Joins:** Entendi na prática o problema do "Produto Cartesiano" ao tentar somar dados de tabelas diferentes (Vencimentos e Descontos) na mesma query. A solução foi isolar as somas em **CTEs** ou **Subqueries** antes de unir os resultados.
* **Filtragem de Exclusão:** Diferentes formas de encontrar registros que *não* possuem correspondência em outra tabela (Anti-Joins).

## 📸 Evidências
Os comprovantes de "Accepted" da plataforma Beecrowd estão armazenados na pasta `screenshots` deste repositório.

## 🛠️ Tecnologias
* **SGBD:** PostgreSQL
* **Plataforma de Treino:** Beecrowd
* **Versionamento:** Git & GitHub

---
**Autor:** Levi
*Desenvolvido durante a trilha do Acelera ZG.*
