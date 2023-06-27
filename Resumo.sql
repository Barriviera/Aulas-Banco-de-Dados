-----------------LINKS-----------------------

--DOCUMENTACAO https://www.w3schools.com/sql/default.asp

--GRANT https://docs.microsoft.com/pt-br/sql/t-sql/statements/grant-object-permissions-transact-sql?view=sql-server-ver16

--CONSTRAINTS https://www.postgresql.org/docs/9.0/ddl-constraints.html

--VIEW https://www.w3schools.com/sql/sql_view.asp

--JOINS https://joins.spathon.com/




-----------------INSERT-----------------------
INSERT INTO clientes VALUES ('Pedro', 'jundiai', 123)
--insere os valores pedro jundiai 123 na ordem das colunas da tabela cliente

INSERT INTO clientes (nome, cidade ,cpf) VALUES ('Pedro', 'jundiai', 123)
--insere os valores pedro jundiai 123 em nome cidade cpf na tabela cliente


-----------------UPDATE-----------------------
UPDATE clientes SET nome='Pedro', cidade='jundai' WHERE cliente_id=47;
--muda o nome para Pedro e a cidade para jundiai onde o id for 47


-----------------DELETE-----------------------
DELETE FROM clientes WHERE cidade='santos';
--deleta a linha onde a cidade eh santos


-----------------SELECT-----------------------
SELECT coluna1, coluna2 FROM nome_tabela;
--seleciona apenas coluna 1 e 2

SELECT * FROM nome_tabela;
--seleciona todos os campos da tabela

SELECT DISTINCT cidade FROM clientes;
--mostra as cidades sem repetir 

SELECT COUNT (DISTINCT cidade) FROM clientes;
--mostra o numero de cidades registradas


------------------WERE------------------------
SELECT * FROM clientes WHERE cidade='jundiai';
--moastra as linhas da tabela onde a cidade eh jundiai
--WHERE pode usar =, <, >, <=, >=, !=,BETWEEN, LIKE e IN


--------------AND, OR, NOT--------------------
SELECT * FROM clientes WHERE cidade='jundiai' AND estado_civil='solteiro'
--moastra as linhas da tabela onde a cidade eh jundiai E o estado eh solteiro

SELECT * FROM clientes WHERE cidade='jundiai' OR cidade='piracicaba'
--moastra as linhas da tabela onde a cidade eh jundiai OU piracicaba

SELECT * FROM clientes WHERE NOT cidade='santos';
--mostra as linhas da tabela onde a cidedade N eh santos


-----------------ORDER BY----------------------
SELECT * FROM clientes ORDER BY cliente_id ASC;
--organiza a tabela cliente pelo id de forma cresente

SELECT * FROM clientes ORDER BY cliente_id DESC;
--organiza a tabela cliente pelo id de forma decesente

SELECT * FROM clientes ORDER BY nome,cliente_id ASC;
--ordena pelo nome e se tiver nome igual ordena pelo id


------------------NULL------------------------
SELECT nome,cidade,cpf FROM clientes WHERE cpf IS NOT NULL
--mostra nome,cidade e cpf onde cpf N eh nulo

SELECT nome,cidade,cpf FROM clientes WHERE cpf IS NULL
--mostra nome,cidade e cpf onde cpf eh nulo


----------------MAX() MIN()---------------------
SELECT MIN(salario) as MenorSalario FROM clientes;
--retrona o menor valor da coluna salario e renomeia a coluna no console pra MenorSalario

SELECT MAX(salario) as MaiorSalario FROM clientes;
--retrona o maior valor da coluna salario e renomeia a coluna no console pra MaiorSalario


------------COUNT() AVG() SUM()------------------
SELECT COUNT(cliente_id) FROM clientes;
--conta o numero de clientes pelo id

SELECT AVG(salario) FROM clientes;
--mosta a media da coluna salario da tabela clientes

SELECT SUM(salario) FROM clientes;
--mostra a soma da coluna salario


------------------LIKE------------------------
SELECT * FROM clientes WHERE nome LIKE 'a%';
--mostra nomes que comecem com a letra 'a' da tabela clientes
--'%a' terminem com 'a'
--'%123%' tem 123 no meio
--'a%b' que comecem com 'a' e terminem com 'b'


-------------------IN-------------------------
SELECT * FROM clientes WHERE cidade IN(SELECT cidade FROM fornecedores);
--seleciona clientes que moram na mesma cidade que os fornecerdores


----------------BETWEEN-----------------------
SELECT * FROM clientes WHERE servico_preco BETWEEN 1000 AND 5000;
--mostra clintes com preco de servico entre 1000 e 5000


-------------------AS-------------------------
SELECT nome, endereco + ','+ cep + ' ' + cidade + "," + estado AS endereco FROM clientes;
--printa o nome e o endereco que eh a soma de endereco+cep+cidade+estado


------------------JOIN------------------------
SELECT tabela1.coluna_x, tabela2.coluna_y FROM tabela1 JOIN tabela2 ON tabela1.id=tabela2.id;
--printa coluna_x e coluna_y onde os id's forem iguais


------------------UNION------------------------
SELECT cidade FROM clintes 
UNION 
SELECT cidade FROM fornecedores;
--mostra a cidade de clientes e fornecedores


-----------------GROUP BY----------------------
--agrupa linhas que tem os mesmo valores, 
--geralemte usado com count() max() min() sum() e avg() para agrupar os valores
SELECT COUNT(c_cpf), c_sexo FROM colaborador GROUP BY c_sexo;
--mostra o numero de homens e mulheres da empresa







----------------FUNCTION-----------------------
CREATE OR REPLACE FUNCTION nome_funcao(parametro1 tipo, parametro2 tipo)
RETURNS TIPO AS $$
BEGIN

codigo....

AND;
$$ LANGUAGE plpgsql;

------------------VIEW-------------------------
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;


-------------FUNCOES INTERNAS-------------------

Lower:deixa o campo com caracter minusculo
ex:SELECT matricula, lower(nome) from empresa;
saida: 12346 pedro barriviera

Upper:deixa o campo com caracter maiusculo
ex:SELECT matricula, lower(nome) from empresa;
saida: 12346 PEDRO BARRIVIERA

Initcap:deixa o campo penas com os caracteres maiusculos
ex:SELECT matricula, initcap(nome) from empresa;
saida: 12346 P B
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

AVG:calcula media da coluna 
SELECT avg(salario) from empresa;

COUNT:conta o numero de linas da coluna
SELECT count(funcionario) from empresa;

MAX:exibe valor maximo da coluna
SELECT max(salario) from empresa;

MIN:exibe valor minimo da coluna
SELECT min(salario) from empresa;

SUM:exibe a soma da coluna
SELECT SUM(salario) from empresa;

Group By: arupa  os valores iuais da coluna
SELECT salario, nome, cpf from empresa group by salario;

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ABS(x) - valor absoluto de x
CEIL(numeric) - arredonda para o próximo inteiro superior
DEGREES(valor) - converte valor de radianos para graus
FLOOR(numeric) - arredonda para o próximo inteiro inferior
MOD(x,y) - resto da divisão de x por y
PI() - constante PI (3,1415...)
POWER(x,y) - x elevado a y
RADIANS(valor) - converte valor de graus para radianos
RANDOM() - valor aleatório entre 0 e 1
ROUND(numeric) - arredonda para o inteiro mais próximo
ROUND(v, d) - arredonda v com d casas decimais
SIGN(numeric) - retorna o sinal da entrada, como -1 ou +1
SQRT(X) - Raiz quadrada de X
TRUNC (numeric) - trunca para nenhuma casa decimal
TRUNC (v numeric, s int) - trunca para s casas decimais

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SELECT CURRENT_DATE; -- Retorna a data atual do sistema.
SELECT CURRENT_TIME; -- Retorna a hora atual do sistema
SELECT CURRENT_TIMESTAMP; --retorna o horário e a data atuais
SELECT now(); --retorna um timestamp com data e horário atuais do sistema
SELECT timeofday(); -- o retorno é do tipo text
SELECT AGE('2001-11-03 15:56:00', '2001-01-03 
14:22:00') -- retorna 10 mons 01:34:00 --retorna a diferça ente as datas
SELECT TO_DATE('29032010','DDMMYYYY'); -- Retorna 2010-03-29
SELECT TO_TIMESTAMP('29032010 14:23:05','DDMMYYYY HH:MI:SS'); --2006-03-29 14:23:05+00



----------------------------------------------



CREATE TRIGGER verifica 
BEFORE INSERT ON tb.ocorrencia
FOR EACH ROW
EXECUTE FUNCTION fep.verifica_dep();

CREATE OR REPLACE FUNCTION fep.verifica_dep()
	returns trigger AS $$
	DECLARE variavel int;
	BEGIN
	SELECT func_dep INTO variavel FROM tb.func WHERE func_id = new.oco_func_aloc;
	IF variavel = 5 THEN
		RETURN new;
	else
		RAISE NOTICE 'funcionario n é do departamendo de informatica';
		RETURN null;
	end if;
	end;
$$ LANGUAGE 'plpgsql';
---------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fep.verifica_dep()
	returns trigger AS $$
	DECLARE variavel varchar;
	BEGIN
	SELECT lower(d.dep_nome) INTO variavel FROM tb.departamento d inner join tb.func f on f.func_dep = d.dep_codigo WHERE func_id = new.oco_func_aloc;
	IF variavel = 'setor informatica' THEN
		RETURN new;
	else
		RAISE NOTICE 'funcionario eh do %', variavel;
		RETURN null;
	end if;
	end;
$$ LANGUAGE 'plpgsql';
