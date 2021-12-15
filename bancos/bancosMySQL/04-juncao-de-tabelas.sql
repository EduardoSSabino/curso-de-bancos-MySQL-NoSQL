CREATE DATABASE juncao; -- um banco de dados

USE juncao; -- acessando meu banco de dados

CREATE TABLE profissoes( -- criando uma tabela  profissoes
	id INT NOT NULL AUTO_INCREMENT, -- criando um campo (coluna) do tipo inteiro nao nulo e auto incrementa
	cargo VARCHAR(60) NOT NULL, -- criando um campo cargo do tipo varchar que pode ter o tamanho de 60 caracteres, não nulo
	PRIMARY KEY (id) -- definindo meu campo id como miha chave primária
);

CREATE TABLE clientes( 
	id INT NOT NULL AUTO_INCREMENT, 
	nome VARCHAR(60) NOT NULL,
	data_nascimento DATE NOT NULL,
	telefone VARCHAR(10) NOT NULL,
	id_profissao int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id_profissao) REFERENCES profissoes(id) -- definindo o id como minha chave estrangeira 
);


INSERT INTO profissoes (cargo) VALUES ('Programador'); -- insertando na tabela profissoes o campo cargo que recebe o valor de Programador
INSERT INTO profissoes (cargo) VALUES ('Analista de Sistemas'); 
INSERT INTO profissoes (cargo) VALUES ('Suporte');
INSERT INTO profissoes (cargo) VALUES ('Gerente');

INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('João Pereira', '1981-06-15', '1234-5688', 1); -- insertando na tabela clientes 4 campos e passando 4 valores respectivos
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Ricardo da Silva', '1973-10-10', '2234-5669', 2);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Felipe Oliveira', '1987-08-01', '4234-5640', 3);
INSERT INTO clientes (nome, data_nascimento, telefone, id_profissao) VALUES ('Mário Pirez', '1991-02-05', '5234-5621', 1);

-- Junção de produto cartesiano
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo -- selecionando id, nome, data_nascimento da tabela cliente e selecionando cargo da tabela profissoes
	FROM clientes AS c, profissoes AS p -- apelidando minha tabela clientes de c e minha tabela profissao de p
    WHERE c.id_profissao = p.id; -- meu filtro diz que, id_profissao da tabela produto igual ao id de profissoes


-- Inner Join
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c INNER JOIN profissoes AS p -- pegando os dados em comum de c e p (tabela clientes e tabela profissoes)
ON  c.id_profissao = p.id; -- ON serve como um "where", ou seja, meu filtro

-- Left Outer Join
SELECT * FROM clientes -- seleciona tudo ta minha tabela clientes
LEFT OUTER JOIN profissoes -- seleciona tudo da minha tabela da esquerda, ou seja, minha tabela clientes
ON clientes.id_profissao = profissoes.id; -- ON = WHERE = filtro

-- Right Outer Join
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes -- seleciona tudo da minha tabela da direita, no caso a tabela profissoes ( a tabela clientes está a esquerda pq vem primeiro
ON clientes.id_profissao = profissoes.id;

-- Full Outer Join (Não funciona no MySQL)
SELECT * FROM clientes
FULL OUTER JOIN profissoes -- seleciona tudo da tabela clientes e da tabela profissao
ON clientes.id_profissao = profissoes.id; -- ON = WHERE = filtro

-- Full Outer Join (Versão MySQL)
SELECT * FROM clientes
LEFT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id
UNION
SELECT * FROM clientes
RIGHT OUTER JOIN profissoes
ON clientes.id_profissao = profissoes.id;


-- Cross Join
SELECT c.id, c.nome, c.data_nascimento, c.telefone, p.cargo
FROM clientes AS c
CROSS JOIN profissoes AS p;

-- Self Join

CREATE TABLE consumidor( -- criando tabela
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL
);


INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Alfredo Nunes', 'Maria Nunes', 'Rua da paz, 47', 'São Paulo', '123.456-87', 'Brasil'); -- insertando campos e seus respectivos valores
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Ana Trujillo', 'Guilherme Souza', 'Rua Dourada, 452', 'Goiânia', '232.984-23', 'Brasil');
INSERT INTO consumidor (nome, contato, endereco, cidade, cep, pais) VALUES ('Leandro Veloz', 'Pedro Siqueira', 'Rua Vazia, 72', 'São Paulo', '936.738-23', 'Brasil');

SELECT a.nome AS Consumidor1, b.nome AS Consumidor2, a.cidade -- selecionando campos e dando apelidos
FROM consumidor AS a -- selecionando minha tabela e dando um apelido a ela
INNER JOIN consumidor AS b -- selecionando os campos em comum na duas tabelas 
ON a.id <> b.id -- meu filtro. se a.id for diferente de b.id
AND a.cidade = b.cidade -- funciona como &&, 
ORDER BY a.cidade; -- ordenar campo cidade