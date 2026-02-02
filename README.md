# 🗃️ Desafio SQL - Acelera ZG

> Repositório destinado à resolução de desafios de banco de dados (PostgreSQL) da plataforma **Beecrowd**, como parte das atividades do programa de aceleração da ZG.

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Beecrowd](https://img.shields.io/badge/Beecrowd-Solved-green?style=for-the-badge)

## 🎯 Objetivo
Demonstrar proficiência em consultas SQL, evoluindo de seleções simples até o uso de recursos avançados como **Window Functions**, **CTEs (Common Table Expressions)** e **Subqueries complexas** para análise de dados e relatórios gerenciais.

---

## 🏆 Desafios Destacados

### 1. Divisões com Maiores Médias Salariais (Beecrowd 2989)
**O Desafio:** Calcular a média salarial (Salário Líquido) de cada divisão e listar apenas a divisão com a maior média dentro de cada departamento, ordenando o resultado.
**A Solução:**
* Uso de **CTEs** para isolar o cálculo de vencimentos e descontos.
* Implementação da lógica `(Soma Vencimentos - Soma Descontos)` para chegar ao salário líquido real.
* Aplicação de **Window Functions** (`ROW_NUMBER()` ou `MAX() OVER`) para rankear as divisões dentro de seus departamentos (`PARTITION BY`).

### 2. Relatório Detalhado de Pagamentos
**O Desafio:** Listar todos os empregados exibindo Salário Bruto, Total de Descontos e Salário Líquido, ordenados por departamento, divisão e valor líquido.
**A Solução:**
* Resolução do problema de **Produto Cartesiano** (linhas duplicadas): Em vez de fazer JOIN direto entre `empregado`, `vencimento` e `desconto`, utilizei **Subqueries no JOIN** para pré-agregar os valores.
* Uso extensivo de `COALESCE` para garantir que funcionários sem descontos ou vencimentos apareçam no relatório com valor `0.00` em vez de `NULL`.

---

## 🧠 O que eu aprendi

Durante a execução deste desafio, consolidei técnicas essenciais para resolver problemas de *Reporting* e *Analytics* no banco de dados:

* **Manipulação de Nulos e Precisão:** Domínio do `COALESCE` para blindar cálculos matemáticos e `ROUND` para formatação financeira precisa.
* **Window Functions:** Aprendi a criar rankings e particionamentos (`OVER PARTITION BY`) para resolver problemas de "Top N" por categoria sem complexidade excessiva.
* **Otimização de Joins (Anti-Duplicação):** Entendi na prática como evitar a duplicação de dados ao relacionar tabelas de *um-para-muitos* simultâneas (ex: um funcionário tem vários vencimentos E vários descontos). A solução foi isolar as somas em subqueries antes de cruzar com a tabela principal.
* **Lógica de Negócio no SQL:** Tradução de regras de negócio (cálculo de salário líquido) diretamente para a query.

## 📸 Evidências
Os comprovantes de "Accepted" da plataforma Beecrowd estão armazenados na pasta `screenshots` deste repositório.

## 🛠️ Tecnologias
* **SGBD:** PostgreSQL
* **Plataforma de Treino:** Beecrowd
* **Versionamento:** Git & GitHub

---

**Autor:** Levi
*Desenvolvido durante a trilha de Banco de Dados do Acelera ZG.*
