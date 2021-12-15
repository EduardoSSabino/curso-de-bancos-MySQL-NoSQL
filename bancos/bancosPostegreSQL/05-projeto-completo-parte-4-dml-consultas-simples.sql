-- Select Simple

-- Atores
 SELECT * FROM atores;

-- Clientes
 SELECT * FROM clientes;

-- Filmes
 SELECT * FROM filmes;
-- Generos
 SELECT * FROM generos;

-- Filmes e Generos 
 SELECT f.id, f.titulo, g.genero, f.valor FROM filmes AS f, generos AS g WHERE f.id_genero = g.id;

-- Atores Filmes
 SELECT * FROM atores_filme;

-- Atores Filmes
 SELECT af.id, f.titulo, a.nome, af.personagem -- selecionando alguns campos de tabelas diferentes
	FROM filmes AS f, atores AS a, atores_filme AS af 
	WHERE af.id_filme = f.id AND af.id_ator = a.id; -- meu filtr. é bom se atentar em igualar as chaves estrangeiras que fazem parte da transação

-- Utilizando Filtros
 SELECT * FROM generos WHERE id = 2;

 SELECT * FROM generos WHERE genero = 'Terror';

-- Funcoes Agregadas
 SELECT SUM(valor) AS Soma FROM filmes; -- a soma da coluna vlor da tabela filmes

SELECT MAX(valor) FROM filmes; -- valor máximo da coluna valor do campo filmes

-- Subconsulta
SELECT * FROM filmes WHERE valor IN (SELECT MAX(valor) FROM filmes); -- selecionando toda a tabela filmes com o valor máximo

