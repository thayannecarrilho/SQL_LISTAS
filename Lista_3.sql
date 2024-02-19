CREATE DATABASE lista_3;

USE lista_3;

CREATE TABLE aluno(
ra CHAR(10) NOT NULL PRIMARY KEY,
nome VARCHAR(20),
nascimento DATE);

INSERT INTO aluno(ra, nome, nascimento)
VALUES
(123456, 'Ana', 19720110),
(123457, 'Bianca', 19730211),
(123458, 'Carla', 19871212),
(123459, 'Danilo', 19901002),
(123460, 'Eliana', 19870101);

CREATE TABLE curso(
codigo CHAR(2) PRIMARY KEY,
nome VARCHAR(10),
ch CHAR(4),
inicio DATE,
termino DATE);

INSERT INTO curso(codigo, nome, ch, inicio, termino)
VALUES
(1, 'Java', 360, 20071201, 20081010), 
(2, 'auto cad', 60, 20080110, 20080510),
(3, 'php', 90, 20080215, 20080710),
(4, 'redes', 60, 20080120, 20080320);

CREATE TABLE matricula (
curso CHAR(2) NOT NULL,
ra CHAR(10), 
datamat DATE,
valor DEC(10,2));

INSERT INTO matricula (curso, ra, datamat, valor)
VALUES
(1, 123456, 20070910, 100.00),
(3, 123456, 20071001, 60.00),
(1, 123457, 20070901, 100.00),
(2, 123458, 20080111, 50.00),
(2, 123459, 20070720, 50.00),
(1, 123460, 20070810, 80.00);



-- 1
SELECT aluno.nome, matricula.ra, curso.nome FROM aluno
INNER JOIN matricula ON 
aluno.ra = matricula.ra
INNER JOIN curso ON 
matricula.curso = curso.codigo;

-- 2
SELECT aluno.nome, matricula.ra, curso.nome FROM aluno
INNER JOIN matricula ON 
aluno.ra = matricula.ra
INNER JOIN curso ON 
matricula.curso = curso.codigo
ORDER BY curso.nome ASC;

-- 3 
SELECT curso.nome, count(matricula.curso) AS 'Matriculados'
FROM curso
INNER JOIN matricula ON 
curso.codigo = matricula.curso
GROUP BY curso.nome;

-- 4 
SELECT coalesce(curso.nome, 0), count(matricula.curso) AS 'Matriculados'
FROM curso
LEFT JOIN matricula ON
curso.codigo = matricula.curso
GROUP BY curso.nome;

-- 5
SELECT coalesce(curso.nome, 0), sum(matricula.valor) AS 'Total'
FROM curso
LEFT JOIN matricula ON
curso.codigo = matricula.curso
GROUP BY curso.nome;

-- 6
SELECT coalesce(curso.nome, 0) AS 'Curso', sum(matricula.valor) AS 'Total', (SELECT sum(valor) FROM matricula)
FROM curso
LEFT JOIN matricula ON
curso.codigo = matricula.curso
GROUP BY curso.nome;

-- 7 
SELECT round(Avg(valor), 2) as 'Média escola'
FROM matricula;

-- 8 
SELECT curso.nome, round(Avg(valor), 2) as 'Média matricula'
FROM matricula
LEFT JOIN curso ON
matricula.curso = curso.codigo 
GROUP BY curso.nome;

-- 9 
SELECT curso.nome, count(ra) AS Alunos
FROM matricula
INNER JOIN curso ON 
matricula.curso = curso.codigo 
GROUP BY curso.nome
HAVING alunos <= 2;

-- 10 
SELECT nome, ch
FROM curso
WHERE ch = 60;

-- 11
SELECT nome, nascimento
FROM ALUNO
WHERE SUBSTRING(nascimento, 7, 1) LIKE '1';

-- 12 
SELECT curso.nome, count(matricula.curso) AS Alunos
FROM curso
INNER JOIN matricula ON
curso.codigo = matricula.curso
WHERE SUBSTRING(inicio, 7, 1) LIKE '1'
GROUP BY curso.nome; 

-- 13
SELECT nome, inicio
FROM curso
WHERE SUBSTRING(inicio, 7, 1) LIKE '1';

-- 14
SELECT aluno.nome, matricula.datamat, curso.inicio
FROM aluno
INNER JOIN matricula ON
aluno.ra = matricula.ra
INNER JOIN curso ON
matricula.curso = curso.codigo
WHERE DATEDIFF(matricula.datamat, curso.inicio) < 1;

-- 15
SELECT nome, inicio
FROM curso
WHERE inicio > CURDATE();

-- 16 
SELECT aluno.nome, matricula.datamat
FROM aluno
INNER JOIN matricula ON
aluno.ra = matricula.ra
WHERE WEEKDAY(matricula.datamat) = 5;

-- 17 
SELECT aluno.nome, matricula.datamat, matricula.valor, round((matricula.valor * 0.5), 2) AS 'Desconto_50%'
FROM aluno
INNER JOIN matricula ON
aluno.ra = matricula.ra
WHERE WEEKDAY(matricula.datamat) = 5;

-- 18 
SELECT nome, nascimento, SUBSTRING(FLOOR(DATEDIFF(CURDATE(), nascimento) / 365), 1, 2) AS Idade
FROM aluno;

-- 19
SELECT nome, inicio, termino, PERIOD_DIFF(DATE_FORMAT(termino, '%Y%m'), DATE_FORMAT(inicio, '%Y%m')) AS Qtde_Meses
FROM curso;









