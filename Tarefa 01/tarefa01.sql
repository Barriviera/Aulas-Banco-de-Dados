SELECT * FROM demo;-- Banco de Dados 2
-- ATIVIDADE 2
-- Mateus Augusto Viotto (PC3008967)
-- Pedro Barriviera (PC3010155)


-- 1
UPDATE empregado SET cpf = '226.842.014-78' WHERE cpf = '226.842.014-87' ;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando altera na tabela empregado o valor onde o cpf é "226.842.014-87" para "226.842.014-78"
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE empregado SET cpf = '226.842.014-87' WHERE cpf = '226.842.014-78' ;

-- 2
DELETE FROM departamento WHERE numero = 2;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Troca o valor de depto_num onde ele é 2 para null e apaga da tabela localização onde depto_num = 2.
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into departamento (nome, numero, cpf_gerente, data_inicio_gerente) 
values ('Comercial', 2, '306.105.124-79', '2007-04-30'); 

UPDATE empregado SET depto_num = 2 WHERE cpf = '302.605.324-09';
UPDATE empregado SET depto_num = 2 WHERE cpf = '886.718.454-10';
UPDATE empregado SET depto_num = 2 WHERE cpf = '306.105.124-79';

insert into localizacoes (depto_num, localizacao) 
values (2, 'SQS 187'); 
 
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQSW 2371'); 
 
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQSW 1987');

-- 3
UPDATE localizacoes SET depto_num = 1 WHERE localizacao = 'SQS 187';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Altera na tabela localizacoes o valor de depto_num onde a localização é igual a SQS 187 para 1
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE localizacoes SET depto_num = 2 WHERE localizacao = 'SQS 187';

-- 4
DELETE FROM empregado WHERE cpf = '806.178.153-22';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Exclui da tabela empregado os dados onde o cpf é igual a 806.178.153-22 e retorna na tabela departamento o valor default onde cpf_gerente é igual a 806.178.153-22 
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Iara Muniz', '806.178.153-22', 'F', '1974-03-05', 'Rua 5', 100, 6049.65, 1);
UPDATE departamento SET cpf_gerente = '806.178.153-22' WHERE cpf_gerente = '302.605.324-09';

-- 5
UPDATE empregado SET supervisor_cpf = '226.842.014-87' WHERE supervisor_cpf = '306.178.144-80';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Este comando atualiza o dado CPF do supervisor_cpf = 226.842.014-87 para supervisor_cpf = 306.178.144-80
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE empregado SET supervisor_cpf = '306.178.144-80' WHERE supervisor_cpf = '226.842.014-87';

-- 6
DELETE FROM empregado WHERE depto_num = 1;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando deleta os dados da tabela empregado onde depto_num é igual a 1
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Eloa Martins Chagas', '306.178.144-80', 'F', '1982-07-20', 'Rua 15', 1657, 2822.26, 1);
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) 
values ('Ivan Chagas', '226.842.014-87', 'M', '1980-12-14', 'Rua 15', 1657, 2522.26, 1, '306.178.144-80');
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Iara Muniz', '806.178.153-22', 'F', '1974-03-05', 'Rua 5', 100, 6049.65, 1); 

-- 7
UPDATE departamento SET numero = 3 WHERE numero = 1;
-- c) Comente abaixo as alterações que ocorreram em consequência da execução
-- Altera na tabela departamento o valor de numero onde ele é igual a 1 para 3 e também altera nas tabelas empregado e localizacoes o valor de depto_num onde ele é 1 para 3
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE departamento SET numero = 1 WHERE numero = 3;

-- 8
DELETE FROM empregado WHERE cpf = '806.178.153-22';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Exclui da tabela empregado os dados onde o cpf é igual a 806.178.153-22 e retorna na tabela departamento o valor default onde cpf_gerente é igual a 806.178.153-22 
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Iara Muniz', '806.178.153-22', 'F', '1974-03-05', 'Rua 5', 100, 6049.65, 1);
UPDATE departamento SET cpf_gerente = '806.178.153-22' WHERE cpf_gerente = '302.605.324-09';

-- 9
UPDATE empregado SET supervisor_cpf = '806.178.153-22', depto_num = 1 WHERE cpf = '886.718.454-10';
-- c) Comente as alterações que ocorreram em consequência da execução
-- Este comando atualiza os dados supervisor_cpf = 302.605.324-09 e depto_num = 2 do cpf igual a 886.718.454-10 para supervisor_cpf = 806.178.153-22 e depto_num = 1
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE empregado SET supervisor_cpf = '302.605.324-09', depto_num = 2 WHERE cpf = '886.718.454-10';

-- 10
DELETE FROM localizacoes WHERE depto_num = 1;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando deleta os dados da tabela localizacoes onde depto_num é igual a 1
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into localizacoes (depto_num, localizacao) 
values (1, 'SQN 345'); 
insert into localizacoes (depto_num, localizacao) 
values (1, 'SQN 122'); 

