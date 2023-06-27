create database ocorrenciascpd;
-- ----------------------------
-- [1] ESQUEMAS
-- Criacao de pelo menos 1 esquema
-- Nesse(s) esquema(s) serao criados: tabelas, visoes, funcoes, procedimentos, gatilhos, sequencias etc (vide secoes seguintes)
create schema tb;
create schema vw;
create schema fep;
create schema tgg;
-- ----------------------------
-- [2] TABELAS
-- Criacao das tabelas e de suas restricoes (chaves primarias, unicidades, valores padrao, checagem e nao nulos)
-- Pelo menos 1 UNIQUE, 1 DEFAULT, 1 CHECK
-- Definicao das chaves estrangeiras das tabelas com acoes referenciais engatilhadas
-- As restricoes criadas com ALTER TABLE devem aparecer logo apos a tabela correspondente

CREATE TABLE tb.departamento(
dep_codigo INT PRIMARY KEY,
dep_nome VARCHAR(30) NOT NULL,
--VARCHAR = valores q variam em numero de caracteres (nome, rua, cidade)
-- CHAR = valores q n variam em numero de caracteres(cpf, cep, telefone)
);
CREATE TABLE tb.func( 
func_id INT PRIMARY KEY,
func_nome VARCHAR(30) NOT NULL,
func_dep INT NOT NULL REFERENCES tb.departamento (dep_codigo),
func_status VARCHAR(8) NOT NULL CHECK((func_status = 'ativo') or (func_status = 'inativo'))
);

CREATE TABLE tb.ocorrencia(
oco_codigo INT PRIMARY KEY,
oco_descricao text NOT NULL,
oco_data date NOT NULL, CHECK(oco_data <= current_date),
oco_dep_rep INT REFERENCES tb.departamento (dep_codigo),
oco_func_aloc INT NOT NULL REFERENCES tb.func (func_id),
oco_data_lmt date CHECK(oco_data_lmt >= current_date),
oco_stat VARCHAR(10) NOT NULL CHECK((oco_stat = 'aberta') or (oco_stat = 'encerrada')),
);

-- ----------------------------
-- [3] CARGA DE DADOS
-- 100 tuplas no total e identificar quem fez as insercoes

INSERT INTO tb.departamento VALUES (1 ,'setor financeiro');
INSERT INTO tb.departamento VALUES (2 ,'setor administrativo');
INSERT INTO tb.departamento VALUES (3 ,'setor marketing');
INSERT INTO tb.departamento VALUES (4 ,'setor relacoes humanas');
INSERT INTO tb.departamento VALUES (5 ,'setor informatica');


INSERT INTO tb.func VALUES (1 ,'Pedro', 2, 'ativo');
INSERT INTO tb.func VALUES (2 ,'jao', 2, 'ativo');
INSERT INTO tb.func VALUES (3 ,'bruno', 2, 'inativo');
INSERT INTO tb.func VALUES (4 ,'davi', 1, 'inativo');
INSERT INTO tb.func VALUES (5 ,'mateus', 1, 'inativo');
INSERT INTO tb.func VALUES (6 ,'vick', 1, 'ativo');
INSERT INTO tb.func VALUES (7 ,'kah', 1, 'ativo');
INSERT INTO tb.func VALUES (8 ,'rafa', 3, 'ativo');
INSERT INTO tb.func VALUES (9 ,'vitor', 1, 'ativo');
INSERT INTO tb.func VALUES (10 ,'poli', 1, 'inativo');
INSERT INTO tb.func VALUES (11 ,'bell', 4, 'ativo');
INSERT INTO tb.func VALUES (12 ,'luci', 4, 'ativo');
INSERT INTO tb.func VALUES (13 ,'sonia', 4, 'inativo');
INSERT INTO tb.func VALUES (14 ,'bia', 3, 'ativo');
INSERT INTO tb.func VALUES (15 ,'julia', 3, 'inativo');
INSERT INTO tb.func VALUES (16 ,'amanda', 5, 'inativo');
INSERT INTO tb.func VALUES (18 ,'gabi', 5, 'ativo');
INSERT INTO tb.func VALUES (19 ,'gabriel', 5, 'ativo'); 
INSERT INTO tb.func VALUES (20 ,'gustavo', 5, 'ativo');

INSERT INTO tb.ocorrencia VALUES (1 ,'arrumar wifi', '2022-07-03', 1, 20, '2022-07-07', 'aberta');
INSERT INTO tb.ocorrencia VALUES (2 ,'arrumar rede', '2022-07-03', 1, 20, '2022-07-13', 'aberta');
INSERT INTO tb.ocorrencia VALUES (3 ,'arrumar pc', '2022-07-03', 1, 19, '2022-07-04', 'aberta');
INSERT INTO tb.ocorrencia VALUES (4 ,'arrumar monitor', '2022-07-03', 1, 18, '2022-07-03', 'aberta');

CREATE TRIGGER tgg.verifica 
BEFORE INSERT ON tb.ocorrencia
FOR EACH ROW
EXECUTE FUNCTION fep.verifica_dep();

	
select dep INTO Vr from tABELA qhere id = pARAMETRO;


-- -----------------------
-- [4] CONSULTAS
-- Alem do comando SELECT correspondente, fornecer o que se pede

-- [4.1] Listagem
-- Usar juncao(oes) (JOINs), filtro(s) (WHERE), ordenacao (ORDER BY)
-- Enunciado: 
-- Importancia na aplicacao: 
-- Usuario(s) atendido(s): 
SELECT func_status, tb.func.func_nome AS funcionario, tb.departamento.dep_nome AS departamento FROM tb.func inner join tb.departamento ON func_dep=dep_codigo WHERE func_status = 'ativo'

SELECT tb.departamento.dep_nome "Departamento", count (oco_dep_rep) "Qtde ocorrencia" FROM tb.ocorrencia inner join tb.departamento on dep_codigo = oco_dep_rep group by dep_nome

SELECT d.dep_nome "Nome Departamento", f.func_nome "Nome", COUNT (o.oco_func_aloc) "Quantidade de Ocorrencias" 
FROM tb.func as f 
left join tb.departamento d ON f.func_dep = d.dep_codigo  
left join tb.ocorrencia o ON f.func_id = o.oco_func_aloc
GROUP by d.dep_nome,f.func_nome 
ORDER by "Quantidade de Ocorrencias" desc,"Nome" desc
-- [4.2] Relatorio
-- Usar juncao(oes) (JOINs), filtro(s) (WHERE), agrupamento (GROUP BY) e funcao de agregacao (count, sum, avg, etc)
-- Enunciado: 
-- Importancia na aplicacao: 
-- Usuario(s) atendido(s): 
-- Apague esta linha e redija a consulta SQL aqui





-- -------------------------
-- [5] VISOES


-- [5.1] Visao
-- A visao deve ter, no minimo, as caracteristicas de 4.1
-- Enunciado: 
-- Importancia na aplicacao: 
-- Usuario(s) atendido(s): 
CREATE VIEW vw.qnt_ocorrencias AS 
	SELECT d.dep_nome "Nome Departamento", f.func_nome "Nome", COUNT (o.oco_func_aloc) "Quantidade de Ocorrencias" 
	FROM tb.func as f 
	left join tb.departamento d ON f.func_dep = d.dep_codigo  
	left join tb.ocorrencia o ON f.func_id = o.oco_func_aloc
	GROUP by d.dep_nome,f.func_nome 
	ORDER by "Quantidade de Ocorrencias" desc,"Nome" desc;

-- [5.2] Consulta na visao
-- Consultar a visao criada em 5.1 realizando filtro(s) (WHERE)
-- Enunciado: 
-- Importancia na aplicacao: 
-- Usuario(s) atendido(s): 
SELECT * FROM vw.qnt_ocorrencias


-- [5.3] Visao materializada
-- A visao deve ter, no minimo, as caracteristicas de 4.2
-- Enunciado: 
-- Importancia na aplicacao: 
-- Usuario(s) atendido(s): 
CREATE MATERIALIZED VIEW vw.mv_qnt_ocorrencias AS 
	SELECT d.dep_nome "Nome Departamento", f.func_nome "Nome", COUNT (o.oco_func_aloc) "Quantidade de Ocorrencias" 
	FROM tb.func as f 
	left join tb.departamento d ON f.func_dep = d.dep_codigo  
	left join tb.ocorrencia o ON f.func_id = o.oco_func_aloc
	GROUP by d.dep_nome,f.func_nome 
	ORDER by "Quantidade de Ocorrencias" desc,"Nome" desc;


-- [5.4] Consulta na visao materializada
-- Consultar a visao criada em 4.2 realizando filtro(s) (WHERE)
-- Enunciado: 
-- Importancia na aplicacao: 
-- Usuario(s) atendido(s): 
SELECT * FROM vw.mv_qnt_ocorrencias

-- [5.5] Atualizacao da visao materializada
-- Comente brevemente sobre a necessidade de atualizacao e qual seria a frequencia/periodicidade
-- Redija o comando REFRESH correspondente

REFRESH MATERIALIZED VIEW vw.mv_qnt_ocorrencias 


-- ---------------------------------------------
-- [6] DESEMPENHO DO PROCESSAMENTO DAS CONSULTAS
-- Primeiro analise o desempenho das suas consultas 4.1., 4.2, 5.2 e 5.4, verificando custo e tempo das operacoes
-- Depois de analisa-las, comente a necessidade da criacao ou nao de um indice e justifique a escolha pelo tipo de indice.
-- Selecione uma dentre essas consultas (a mais importante delas) e apresente aquilo que se pede abaixo.

-- [6.1] EXPLAIN 
-- comente com '--' as linhas do plano abaixo e apague esta linha


-- [6.2] EXPLAIN ANALYZE
-- comente com '--' as linhas do relatorio abaixo e apague esta linha


-- [6.3] Comentarios e justificativas para o indice 
-- Considerar custo e tempo das operacoes, por exemplo
-- comente e justifique nesta linha


-- [6.4] CREATE INDEX e PARAMETROS (Set)
-- Crie o indice, verifique se o indice ja esta sendo usado no processamento da consulta e, caso nao esteja, ajuste os parametros
-- apague esta linha e redija os comandos




-- ---------------------------------------------
-- [7] FUNCOES INTERNAS
-- Usar funcoes internas nas operacoes em tabelas do banco de dados

-- Explicar aqui o que o comando abaixo faz e sua utilidade na aplicacao
-- Redigir abaixo o SELECT (apagar esta linha)

-- Explicar aqui o que o comando abaixo faz e sua utilidade na aplicacao
-- Redigir abaixo o INSERT (apagar esta linha)

-- Explicar aqui o que o comando abaixo faz e sua utilidade na aplicacao
-- Redigir abaixo o UPDATE (apagar esta linha)

-- Explicar aqui o que o comando abaixo faz e sua utilidade na aplicacao
-- Redigir abaixo o DELETE (apagar esta linha)





-- ---------------------------------------------
-- [8] USER-DEFINED FUNCTION (UDF)
-- Vislumbrar a criacao de uma funcao (UDF) para o banco de dados.
-- Comentar a utilidade da funcao na aplicacao.
-- Redigir o comando CREATE OR REPLACE FUNCTION correspondente usando PL/pgSQL.
-- Redigir um comando SQL que chame a funcao, explicando o que sua chamada faz.
-- A funcao devera' ter parametro(s).


-- Comentar aqui a utilidade da funcao na aplicacao 
-- CREATE OR REPLACE FUNCTION abaixo (apagar esta linha)

-- Explicar aqui o que a chamada abaixo faz
-- SELECT ou INSERT ou UPDATE ou DELETE abaixo para chamar a funcao (apagar esta linha)



-- ---------------------------------------------
-- [9] STORED PROCEDURE
-- Vislumbrar a criacao de um procedimento armazenado para o banco de dados.
-- Comentar a utilidade do procedimento na aplicacao.
-- Redigir o comando CREATE OR REPLACE PROCEDURE correspondente usando PL/pgSQL.
-- Redigir um comando SQL que chame o procedimento, explicando o que sua chamada faz.
-- O procedimento devera' ter parametro(s).

-- Comentar a utilidade do procedimento na aplicacao aqui
-- CREATE OR REPLACE PROCEDURE abaixo (apagar esta linha)
create or replace procedure fep.procedure(id int, nome varchar, depto int, status varchar) as
$$
begin

INSERT INTO tb.func(func_id, func_nome, func_dep, func_status) VALUES (id, nome, depto, status);

end
$$ language 'plpgsql';

-- Explicar aqui o que a chamada abaixo faz
-- chamar aqui o procedimento (apagar essa linha)
call fep.procedure(27, 'David', 3, 'ativo');
-- Realizar a criacao dos itens do procedimento armazenado adequadamente, tais como
-- parametros, variaveis locais, tipo(s) de retorno, linguagem usada, blocos, estruturas de controle (decisao e repeticao)
-- 






-- ---------------------------------------------
-- [10] TRIGGER
-- Revisar as aplicacoes em potencial para bancos de dados ativos (e gatilhos).
-- Vislumbrar a criacao de um gatilho e de uma funcao engatilhada para o banco de dados.
-- Se necessario redigir logo abaixo outros comandos SQL necessarios (criacao de coluna, atualizacao de tuplas etc):
 

-- [10.1] ROW
-- Comentar aqui a utilidade, para a aplicacao, do gatilho em nivel de tupla e da sua funcao engatilhada.
CREATE TRIGGER verifica 
BEFORE INSERT ON tb.ocorrencia
FOR EACH ROW
EXECUTE FUNCTION fep.verifica_dep();

-- Redigir o comando CREATE OR REPLACE FUNCTION correspondente usando PL/pgSQL
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





-- Redigir o comando CREATE TRIGGER correspondente ao gatilho em nivel de tupla usando PL/pgSQL


-- Redigir pelo menos 1 comando SQL que dispare o gatilho em nivel de tupla
-- Descrever o que acontece no banco de dados quando e' disparado


-- Se necessario para executar os comandos seguintes, remover o gatilho de 10.1 abaixo:



-- [10.2] STATEMENT
-- Comentar aqui a utilidade, para a aplicacao, do gatilho em nivel de sentenca e da sua funcao engatilhada.
-- Redigir o comando CREATE OR REPLACE FUNCTION correspondente usando PL/pgSQL


-- Redigir o comando CREATE TRIGGER correspondente ao gatilho em nivel de sentenca usando PL/pgSQL


-- Redigir pelo menos 1 comando SQL que dispare o gatilho em nivel de sentenca
-- Descrever o que acontece no banco de dados quando e' disparado






-- ---------------------------------------------
-- [11] SEGURANCA
-- Nao sera incluida aqui
-- Usar/entregar o modelo especifico


-- [11.1] ACESSO REMOTO (pg_hba.conf)
-- Cole nas linhas abaixo o conteudo do arquivo pg_hba.conf que o servidor deve conter, iniciando cada linha com comentario '--' (para nao impedir a execucao desse script); apague esta linha


-- [11.2] PAPEIS (Roles)
-- Criar papeis de usuarios e de grupos
-- Nessa criacao, considerar tanto papeis da equipe (administracao/desenvolvimento) quanto papeis de usuarios da aplicacao
-- Para cada papel criado adicionar um comentario antes explicando qual e' a utilidade dele na aplicacao


-- [11.3] PRIVILEGIOS DE ACESSO (Grant)

-- [11.3.1]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) criar o(s) esquema(s) da Secao 1
-- Usuario(s) podem conceder esse acesso alem do superusuario: citar aqui
-- Apagar essa linha e adicionar os comandos necessarios


-- [11.3.2]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) criar a(s) tabela(s), as sequencias e as restricoes da Secao 2 e as visoes da Secao 5
-- Usuario(s) podem conceder esse acesso alem do superusuario: citar aqui
-- Apagar essa linha e adicionar os comandos necessarios


-- [11.3.3]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) inserir e atualizar tuplas, conforme a Secao 3
-- Usuario(s) podem conceder esse acesso alem do superusuario: citar aqui
-- Apagar essa linha e adicionar os comandos necessarios


-- [11.3.4]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) executar as consultas das Secoes 4 e 5
-- Usuario(s) podem conceder esse acesso alem do superusuario: citar aqui
-- Apagar essa linha e adicionar os comandos necessarios


-- [11.3.5]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) executar os comandos da Secao 7
-- Usuario(s) podem conceder esse acesso alem do superusuario: citar aqui
-- Apagar essa linha e adicionar os comandos necessarios


-- [11.3.6]
-- Assegurar os privilegios necessarios para o(s) papel(is) poder(em) executar as subrotinas das Secoes 8, 9 e 10
-- Assegurar tambem os privilegios para executar os comandos que realizam as chamadas (ou disparos) daquelas subrotinas
-- Usuario(s) podem conceder esse acesso alem do superusuario: citar aqui
-- Apagar essa linha e adicionar os comandos necessarios




-- [11.4] PRIVILEGIOS DE ACESSO (Revoke)

-- [11.4.1]
-- Revogar o acesso em 11.3.1 de pelo menos 1 papel
-- Usuario(s) podem revogar esse acesso alem do superusuario: citar aqui
-- Apague esta linha e redija o comando aqui

-- [11.4.2]
-- Revogar o acesso em 11.3.2 de pelo menos 1 papel
-- Usuario(s) podem revogar esse acesso alem do superusuario: citar aqui
-- Apague esta linha e redija o comando aqui

-- [11.4.3]
-- Revogar o acesso em 11.3.3 de pelo menos 1 papel
-- Usuario(s) podem revogar esse acesso alem do superusuario: citar aqui
-- Apague esta linha e redija o comando aqui

-- [11.4.4]
-- Revogar o acesso em 11.3.4 de pelo menos 1 papel
-- Usuario(s) podem revogar esse acesso alem do superusuario: citar aqui
-- Apague esta linha e redija o comando aqui

-- [11.4.5]
-- Revogar o acesso em 11.3.5 de pelo menos 1 papel
-- Usuario(s) podem revogar esse acesso alem do superusuario: citar aqui
-- Apague esta linha e redija o comando aqui

-- [11.4.6]
-- Revogar o acesso em 11.3.6 de pelo menos 1 papel
-- Usuario(s) podem revogar esse acesso alem do superusuario: citar aqui
-- Apague esta linha e redija o comando aqui


-- Se for necessario para executar os comandos seguintes, assegure novamente os privilegios de acesso revogados acima
-- Apague esta linha e redija os comandos a partir daqui



-- ---------------------------------------------
-- [12] TRANSACOES
-- Nao incluir aqui
-- Usar/entregar o modelo proprio para esse topico


