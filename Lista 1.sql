CREATE DATABASE Lista_1;

USE Lista_1;

CREATE TABLE Contas_a_receber (
Nome CHAR(40),
Numero INTEGER NOT NULL PRIMARY KEY,
Valor DEC(10,2),
Vencimento DATE,
Banco CHAR(10));

INSERT INTO Contas_a_receber(Nome, Numero, Valor, Vencimento, Banco)
VALUES
('ABC PAPELARIA', 100100, 5000.00, 20170120, 'ITAU'),
('LIVRARIA FERNANDES', 100110, 2500.00, 20170122, 'ITAU'),
('LIVRARIA FERNANDES', 100120, 1500.00,	20161015, 'BRADESCO'),
('ABC PAPELARIA', 100130, 8000.00, 20161015, 'SANTANDER'),
('LER E SABER',	200120,	10500.00, 20180426, 'BANCO DO BRASIL'),
('LIVROS E CIA', 200125, 2000.00,	20180426, 'BANCO DO BRASIL'),
('LER E SABER',	200130,	11000.00, 20180926,	'ITAU'),
('PAPELARIA SILVA', 250350, 1500.00, 20180126, 'BRADESCO'),
('LIVROS MM', 250360, 500.00, 20181218, 'SANTANDER'),
('LIVROS MM', 250370, 3400.00, 20180426, 'SANTANDER'),
('PAPELARIA SILVA',	250380,	3500.00, 20180426, 'BANCO DO BRASIL'),
('LIVROS E CIA', 453360, 1500.00, 20180615, 'ITAU'),
('LIVROS MM', 453365, 5400.00, 20180615, 'BRADESCO'),
('PAPELARIA SILVA', 453370, 2350.00, 20171227, 'ITAU'),
('LIVROS E CIA', 453380, 1550.00, 20171227,	'BANCO DO BRASIL'),
('ABC PAPELARIA', 980130, 4000.00, 20161211, 'ITAU'),
('LIVRARIA FERNANDES', 770710, 2500.00, 20161115, 'SANTANDER'),
('ABC PAPELARIA', 985001, 3000.00,	20160911,	'ITAU'),
('PAPEL E AFINS', 985002, 2500.00,	20160312, 'SANTANDER'),
('LER E SABER', 888132, 2500.00, 20170305, 'ITAU');

SELECT * FROM contas_a_receber;

-- 1
SELECT Nome, Vencimento, Valor FROM contas_a_receber;

-- 2
SELECT Count(*) AS 'BANCO ITAU'
FROM contas_a_receber
WHERE Banco = 'ITAU';

-- 3
SELECT Count(*) AS 'BANCO ITAU'
FROM contas_a_receber
WHERE Banco = 'ITAU';

-- 4
SELECT Nome, Numero, Vencimento, Valor
FROM contas_a_receber
WHERE Vencimento BETWEEN '2017-01-01' AND '2017-12-31';

-- 5
SELECT Nome, Numero, Vencimento, Valor, Banco
FROM contas_a_receber
WHERE NOT Banco = 'ITAU' AND NOT Banco = 'SANTANDER';

-- 6
SELECT Nome, Sum(valor) AS 'Total Divida'
FROM contas_a_receber
WHERE Nome = 'PAPELARIA SILVA';

SELECT Nome, Numero, Vencimento, Valor, Banco
FROM contas_a_receber
WHERE Nome = 'PAPELARIA SILVA';

-- 7
DELETE FROM contas_a_receber
WHERE Numero = '770710';

-- 8 
SELECT * FROM contas_a_receber ORDER BY Nome asc;

-- 9
SELECT Nome, Banco, Valor, Vencimento 
FROM contas_a_receber
ORDER BY Vencimento asc;

-- 10
UPDATE contas_a_receber
SET Banco = 'SANTANDER'
WHERE Banco = 'BANCO DO B';

-- 11
SELECT Nome AS 'Clientes Bradesco'
FROM contas_a_receber
WHERE Banco = 'BRADESCO';

-- 12
SELECT Sum(Valor) AS 'Previsão 01/2016 e 12/2016'
FROM contas_a_receber
WHERE Vencimento BETWEEN '2016-01-01' AND '2016-12-31';

-- 13
SELECT Sum(Valor) AS 'Previsão 01 a 30/08/2016'
FROM contas_a_receber
WHERE vencimento BETWEEN '2016-08-01' AND '2016-08-30';

-- 14
SELECT count(Nome) AS 'ITENS ABC PAPELARIA'
FROM contas_a_receber
WHERE Nome = 'ABC PAPELARIA';

-- 15
SELECT Nome, Vencimento, Valor, Valor * 1.15 'Multa 15%'
FROM contas_a_receber
WHERE vencimento BETWEEN '2016-01-01' AND '2016-12-31';

-- 16
SELECT Nome, Vencimento, Valor, Valor * 1.05 'Multa 5%'
FROM contas_a_receber
WHERE nome = 'LER E SABER' AND vencimento BETWEEN '2017-01-01' AND '2017-05-31';

-- 17
SELECT Avg(valor) AS 'Média 2016'
FROM contas_a_receber
WHERE Vencimento BETWEEN '2016-01-01' AND '2016-12-31';

-- 18
SELECT Nome, Valor
FROM contas_a_receber
WHERE Valor >= '10000';

-- 19
SELECT Sum(Valor) AS 'Total Santander'
FROM Contas_a_receber
WHERE Banco = 'SANTANDER';

-- 20
SELECT DISTINCT Nome AS 'Clientes', Banco
FROM contas_a_receber
WHERE Banco = 'SANTANDER' OR Banco = 'ITAU';






