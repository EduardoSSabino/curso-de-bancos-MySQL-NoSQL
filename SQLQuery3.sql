ALTER TABLE FUN_FUNCIONARIOS --altera tabela
ADD FUN_CPF CHAR(11) NOT NULL --adiciona uma conluna fun_cpf do tipo char(11) não nulo
DEFAULT '-';--quem nao tiver cpf, eu coloca  -  no lugar dos numeros

SELECT * FROM FUN_FUNCIONARIOS;--seleciono toda minha tabela de fun_funcionarios

UPDATE FUN_FUNCIONARIOS --atualizo minha tabela
SET FUN_CPF = '12345678903' WHERE FUN_ID = 4;--colocco o cpf de numero 12345678903 para meu funcionario de fun_id = 4

ALTER TABLE FUN_FUNCIONARIOS --altera minha tabela funcionario
ADD CONSTRAINT UC__FUN_FUNCIONARIOS_FUN_CPF --adiciono umaa restrinção (constranit)
UNIQUE NONCLUSTERED (FUN_CPF);--unico nao cluesterizado

INSERT INTO FUN_FUNCIONARIOS (FUN_NOME, FUN_SOBRENOME, FUN_DATA_NASCIMENTO, FUN_OBSERVACOES, FUN_CPF)--inserto essas tabelas  
VALUES ('TREINAWEB', 'CURSOS', '2007-01-01', NULL, '12345678904');--valores da minha tupla

SELECT * FROM FUN_FUNCIONARIOS;--seleciono toda minha tabela fun_funcionarios

UPDATE FUN_FUNCIONARIOS --atualizo minha tabela fun_funcionarios
SET FUN_CPF = '12345678904' WHERE FUN_ID = 5;--defino o cpf do meu usuario de id =5 como 12345678904





