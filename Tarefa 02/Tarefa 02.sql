-- Banco de Dados II - Consultas
-- Pedro Barriviera PC3010155
-- Redija a consulta SQL abaixo do enunciado correspondente.


-- 1. Liste todas as localizações do departamento cujo número é 100, em ordem alfabética.
SELECT e_localizacao from edificios where e_depto_num = 100 ORDER BY e_localizacao ASC;

-- 2. Liste todos os números de projetos em que trabalha o(a) colaborador(a) com CPF 112.356.757-34.
SELECT t_proj_num FROM trabalha_em WHERE t_cpf = '112.356.757-34';

-- 3. Liste CPFs de colaboradores(as), números de projetos e horas trabalhadas. Classifique os resultados por ordem decrescente de horas trabalhadas. 
SELECT t_cpf, t_proj_num, t_horas from trabalha_em ORDER BY t_horas DESC;

-- 4. Liste o nome, o endereço e o salário das colaboradoras que trabalham num dos seguintes departamentos: 66 ou 5.
select c_nome, c_logradouro, c_salario from colaborador WHERE c_depto_num = 66 or c_depto_num = 5;

-- 5. Liste nome e parentesco de dependentes de colaboradores(as) que recebem salário maior que 2.500.
select de_nome, de_parentesco from dependente join colaborador on (de_cpf = c_cpf) WHERE c_salario > 2500;

-- 6. Liste nomes das gerentes cujo salário é maior que 1.000 e menor que 3.000.
SELECT c_nome from colaborador join departamento on (c_cpf = d_cpf_gerente) WHERE c_salario > 1000 and c_salario < 3000;

-- 7. Nome e endereço das colaboradoras e o nome dos projetos nos quais trabalham, desde que elas dediquem mais que 3h aos projetos.
select c_nome, c_logradouro, p_nome from colaborador, projeto 
inner join trabalha_em on (p_numero = t_proj_num)where c_cpf = t_cpf and t_horas > 3;


-- 8. Liste nome e endereço das supervisoras.
SELECT c_nome, c_logradouro from colaborador WHERE c_cpf in(select c_supervisor_cpf from colaborador);

-- 9. Liste nomes de dependentes cujos pais trabalham no projeto 'Carro que voa'
select de_nome from dependente INNER JOIN colaborador on (de_cpf = c_cpf) INNER JOIN projeto on (c_depto_num = p_numero) WHERE p_nome = 'Carro que voa'; 

-- 10. Liste os departamentos que não controlam nenhum projeto. Exiba: o número e o nome do departamento (e o número e o nome do projeto).
SELECT d_numero, d_nome FROM departamento
WHERE d_numero NOT IN (SELECT p_depto_controle FROM projeto);  

-- 11. Reescreva o exemplo de consulta seguinte, mas inverta o lado da junção. 
-- SELECT p.numero AS p_numero, p.nome AS p_nome, d.numero AS d_numero, d.nome as d_nome
-- FROM departamento d LEFT JOIN projeto p ON p.depto_num=d.numero;

SELECT p_numero, p_nome, d_numero , d_nome
FROM departamento Right JOIN projeto ON p_depto_controle = d_numero;

-- 12. Liste os dependentes de cada colaborador(a), mostrando inclusive quem não tem dependente. 
--Exiba o nome e o parentesco do dependente, bem como o CPF e o nome do(a) colaborador(a).
SELECT de_nome, de_parentesco, c_cpf, c_nome from dependente RIGHT join colaborador on (de_cpf = c_cpf) ORDER by de_parentesco;

-- 13.Liste apenas colaboradores(as) que não possuem dependentes.
SELECT c_nome from colaborador WHERE c_cpf not in (SELECT de_cpf from dependente);

-- 14. Calcule o total pago em salários pela empresa.
SELECT sum(c_salario) AS soma_salario FROM colaborador;

-- 15. Calcule a soma e a média dos salários pagos pelo departamento número 40.
SELECT sum(c_salario) as somasalario, ROUND(AVG(c_salario),2) as media FROM colaborador WHERE c_depto_num = 40;

-- Você é capaz de usar a função ROUND na consulta anterior para aproximar o cálculo da média para 2 dígitos decimais?  
-- Consulte: https://www.w3resource.com/PostgreSQL/round-function.php

-- 16. Exiba o nome e o salário do(a) colaborador(a) pertencente ao departamento número 40 e que recebe o maior salário.
SELECT c_nome, c_salario from colaborador WHERE c_salario in (SELECT max(c_salario) as maiorsalario 
from colaborador WHERE c_depto_num = 40 group by c_depto_num);

-- 17. Exiba o nome e o salário do(a) colaborador(a) pertencente ao departamento número 40 e que recebe o menor salário.
SELECT c_nome, c_salario from colaborador WHERE c_salario in (SELECT MIN(c_salario) as maiorsalario 
from colaborador WHERE c_depto_num = 40 group by c_depto_num);

-- 18. Exiba quantos colaboradores(as) trabalham no projeto de número 1.
SELECT COUNT(*) from colaborador inner join projeto on (c_depto_num = p_depto_controle) WHERE p_numero = 1;

-- 19. Mostre o nome do departamento e a sua quantidade de colaboradores(as). 
SELECT d_nome as nomeDepartamento, COUNT(*) as qtdeColaboradores from departamento INNER JOIN colaborador on (c_depto_num = d_numero) group by d_numero;

-- 20. Mostre o nome de cada colaborador(a) e seu total de horas trabalhadas, desde que o total 
--seja maior ou igual a 20 e menor ou igual a 40.
SELECT c_nome as nome, t_horas as horastrabalhadas from colaborador INNER join trabalha_em on (t_cpf = c_cpf) WHERE t_horas >= 20 and t_horas <= 40;

