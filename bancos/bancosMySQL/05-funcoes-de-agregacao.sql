CREATE DATABASE agregacao; -- criando banco de dados

USE agregacao; --  acessadno meu banco de dados

CREATE TABLE categorias( --  criando tabelas 
	id INT NOT NULL AUTO_INCREMENT, -- crianco campo inteiro nao nulo e auto incremento 
	nome VARCHAR(60) NOT NULL,
	PRIMARY KEY (id) --  definindo id comomchave primaria 
);

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT, 
	descricao VARCHAR(60) NOT NULL,
	preco_venda DECIMAL(8,2) NOT NULL,
	preco_custo DECIMAL(8,2) NOT NULL,
	id_categoria int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_categoria) REFERENCES categorias(id) -- definindo id comom chave estrangeira
);


INSERT INTO categorias (nome) VALUES ('Material Escolar'); -- insertando campos na tabela categorias e definindo seus respectivos valores
INSERT INTO categorias (nome) VALUES ('Acessório Informática');
INSERT INTO categorias (nome) VALUES ('Material Escritório');
INSERT INTO categorias (nome) VALUES ('Game');

INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caderno', '5.45', '2.30', 1);-- insertando campos na tabela produtos e definindo seus respectivos valores
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Caneta', '1.20', '0.45', 1);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Pendrive 32GB', '120.54', '32.55', 2);
INSERT INTO produtos (descricao, preco_venda, preco_custo, id_categoria) VALUES ('Mouse', '17.00', '4.30', 2);

-- max
SELECT MAX(preco_venda) FROM produtos; -- me traz o maior valor de preco_venda da tabela produtos

-- min
SELECT MIN(preco_venda) FROM produtos; -- me traz o menor valor de preco_venda da tabela produtos

-- avg
SELECT AVG(preco_venda) FROM produtos; -- me traz a media aritmetica da coluna 

-- round
SELECT ROUND(AVG(preco_venda), 2) FROM produtos; -- round é usado pra definir o quantas casa decimais o valor terá, nesse caso terá 2

-- count
SELECT COUNT(preco_venda) AS Quantidade FROM produtos WHERE id_categoria = 1; --  serve como * porem traz até os valores nulos, ous eja, ele conta qunatas tuplas tem (tuplas = linhas)

-- group by
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria;

-- having
SELECT id_categoria, MAX(preco_venda) FROM produtos GROUP BY id_categoria HAVING MAX(preco_venda) > 10;

