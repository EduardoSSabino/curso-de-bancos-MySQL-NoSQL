--Laços
DECLARE @nacionalidade CHAR(20) --criando uma variavel nacionalidade do tipo char
DECLARE @paisDeOrigem CHAR(20)--criando uma variavel paisDeOrigem do tipo char
SET @paisDeOrigem = 'Brasil' --definindo o valor da variavel de Brasil
IF @paisDeOrigem = 'Brasil'  --se o meu pais de origem for o brasil
BEGIN --funciona como os colchetes 
SET @nacionalidade = 'você é brasileiro!'
SET @nacionalidade = CONCAT('Parabéns,', @nacionalidade)
END
ELSE--caso eu nao for brasileiro
BEGIN
SET @nacionalidade = 'você é de outro país'
END--encerro meu else

DECLARE @resultado varchar(max), @contador int --criando duas variaveis
SET @contador = 0 --definindo o valor da variavel
SET @resultado = ''--definindo o valor da variavel

WHILE @contador <= 10--laço while "enquanto"
BEGIN
  SET @resultado = CONCAT(@resultado, @contador, ', ')--definindo o valor da variavel
  SET @contador = @contador + 1;--definindo o valor da variavel
END


DECLARE @numero int
SET @numero = 10
CREATE FUNCTION multi_valorada(@numero int) --criando função 
RETURNS @tabela TABLE(campo int)
BEGIN
  DECLARE @contador int
  SET @contador = 0--definindo o valor da variavel

  WHILE @contador <= @numero --enquanto meu contdor for menor e igual a numero...
  BEGIN--funciona como um colchete 
    INSERT INTO @tabela(campo) VALUES (@contador)--insertando uma tabela com valor contador
    SET @contador = @contador + 1;--definindo o valor da variavel
  END

  RETURN--retornando 
END