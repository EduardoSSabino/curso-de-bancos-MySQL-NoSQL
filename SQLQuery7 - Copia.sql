--VIEWS
CREATE VIEW nome_view AS consulta; --criando uma view

CREATE VIEW carros_antigos AS
SELECT * FROM carro WHERE ano_fabricacao < 2013; --criando uma view carros_antigos que é da tabela carro e tem o filtro de ano_fabricacao menor que o ano de 2013

CREATE VIEW nome_view (novoNome1, novoNome1, novoNomeN) AS consulta;--Caso queria, é possível mudar o nome das colunas retornadas pela consulta

ALTER VIEW nome_view AS consulta;--alterando uma view

DROP VIEW nome_view;--excluindo view

--As colunas devem ser de apenas uma tabela base;
--As colunas devem referenciar diretamente o campo original da tabela sem usar as funções (AVG, COUNT, SUM, MIN, MAX), que aprenderemos mais à frente no curso;
--As colunas modificadas não são afetadas pelas cláusulas GROUP BY, HAVING ou DISTINCT.

