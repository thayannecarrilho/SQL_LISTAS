CREATE DATABASE Lista_2;

USE Lista_2;

CREATE TABLE Plano (
Numero CHAR(2) NOT NULL PRIMARY KEY,
Descricao CHAR(30),
Valor DEC(10,2));

INSERT INTO Plano(Numero, Descricao, Valor)
VALUES
('B1', 'BÁSICO 1', 200.00),
('B2', 'BÁSICO 2', 150.00),
('B3', 'BÁSICO 3', 100.00),
('E1', 'EXECUTIVO 1', 350.00),
('E2', 'EXECUTIVO 2', 300.00),
('E3', 'EXECUTIVO 3', 250.00),
('M1', 'MASTER 1', 500.00),
('M2', 'MASTER 2', 450.00),
('M3', 'MASTER 3', 400.00);

SELECT * FROM plano;

CREATE TABLE Associado (
Plano CHAR(2) NOT NULL,
Nome CHAR(40) NOT NULL PRIMARY KEY,
Endereco CHAR(35),
Cidade CHAR(20),
Estado CHAR(2),
CEP CHAR(9));

INSERT INTO Associado(Plano, Nome, Endereco, Cidade, Estado, CEP)
VALUES
('B1', 'JOSE ANTONIO DA SILVA', 'R. FELIPE DO AMARAL, 3450', 'COTIA', 'SP', '06700-000'),
('B1', 'MARIA DA SILVA SOBRINHO', 'R. FELIPE DE JESUS, 1245', 'DIADEMA', 'SP', '09960-170'),
('B1', 'PEDRO JOSE DE OLIVEIRA', 'R. AGRIPINO DIAS, 155', 'COTIA', 'SP', '06700-011'),
('B2', 'ANTONIA DE FERNANDES', 'R. PE EZEQUIEL, 567', 'DIADEMA', 'SP', '09960-175'),
('B2', 'ANTONIO DO PRADO', 'R. INDIO TABAJARA, 55', 'GUARULHOS', 'SP', '07132-999'),
('B3', 'WILSON DE SENA', 'R. ARAPIRACA, 1234', 'OSASCO', 'SP', '06293-001'),
('B3', 'SILVA DE ABREU', 'R. DR. JOA DA SILVA, 1', 'SANTO ANDRÉ', 'SP', '09172-112'),
('E1', 'ODETE DA CONCEIÇÃO', 'R. VOLUNTARIOS DA PATRIA, 10', 'SÃO PAULO','SP', '02010-550'),
('E2', 'JOAO CARLOS MACEDO', 'R. VISTA ALEGRE, 500', 'SÃO PAULO', 'SP', '04343-990'),
('E3', 'CONCEIÇÃO DA SILVA', 'AV. VITORIO DO AMPATO, 11', 'MAUÁ', 'SP', '09312-988'),
('E3', 'PAULO BRUNO AMARAL', 'R. ARGENZIO BRILHANTE, 88', 'BARUERI', 'SP', '06460-999'),
('E3', 'WALDENICE DE OLIVEIRA', 'R. OURO VELHO, 12', 'BARUERI', 'SP', '06460-998'),
('E3', 'MARCOS DO AMARAL', 'R. DO OUVIDOR, 67', 'GUARULHOS', 'SP', '07031-555'),
('M1', 'MURILO DE SANTANA', 'R. PRATA DA CASA', 'BARUERI', 'SP', '06455-111'),
('M1', 'LUIZA ONOFRE FREITAS', 'R. VICENTE DE ABREU, 55', 'SANTO ANDRÉ', 'SP', '09060-667'),
('M2', 'MELISSA DE ALMEIDA', 'R. FERNANDO ANTONIO, 2345', 'SÃO PAULO', 'SP', '04842-987'),
('M2', 'JOAO INACIO DA CONCEIÇÃO', 'R. PENELOPE CHARMOSA, 34', 'SUZANO', 'SP', '08670-888'),
('B3', 'AUGUSTA DE ABREU', 'AV. RIO DA SERRA, 909', 'SANTO ANDRÉ', 'SP', '09061-333'),
('M3', 'ILDA DE MELO DA CUNHA', 'AV. POR DO SOL, 546', 'SANTO ANDRÉ', 'SP', '09199-444'),
('M3', 'MARCOS DA CUNHA', 'AV. PEDROSO DE MORAES', 'SÃO PAULO', 'SP', '04040-444');

-- 1 & 2
SELECT * FROM associado
INNER JOIN plano ON
associado.plano = plano.numero;

-- 3
SELECT Count(plano) as 'Plano B1'
FROM associado
WHERE plano = 'B1';

-- 4 
SELECT nome, plano, valor 
FROM associado 
INNER JOIN Plano ON
associado.plano = plano.numero
ORDER BY associado.plano ASC;

-- 5
SELECT nome, cidade 
FROM associado
WHERE cidade = 'DIADEMA' OR cidade = 'COTIA';

-- 6 
SELECT nome, plano, valor, cidade
FROM associado
INNER JOIN Plano ON
associado.plano = plano.numero
WHERE cidade = 'BARUERI' AND plano = 'M1';

-- 7
SELECT nome, plano, valor
FROM associado
INNER JOIN plano ON 
associado.plano = plano.numero
WHERE cidade = 'SÃO PAULO';

-- 8
SELECT * FROM associado
INNER JOIN plano ON
associado.plano = plano.numero
WHERE nome LIKE '%silva%';

-- 9 
SET SQL_SAFE_UPDATES=0;
UPDATE plano
SET valor =
	CASE
		WHEN Descricao LIKE '%BASICO%' THEN valor * 1.1
		WHEN Descricao LIKE '%EXECUTIVO%' THEN valor * 1.05 
		WHEN Descricao LIKE '%MASTER%' THEN valor * 1.03 ELSE valor END;

-- 10
UPDATE associado
SET plano = 'E3'
WHERE nome = 'PEDRO JOSE DE OLIVEIRA';

SELECT * FROM associado;

-- 11
SELECT Count(plano) AS 'PLANO E3'
FROM associado;

-- 12
SELECT nome, valor, plano
FROM associado
INNER JOIN plano ON 
associado.plano = plano.numero
WHERE plano LIKE '%1%';

-- 13
SELECT nome, plano 
FROM associado
WHERE plano LIKE '%E%';

-- 14
SELECT nome, plano
FROM associado
WHERE plano LIKE '%B%' OR plano LIKE '%M%';

-- 15
DELETE FROM associado
WHERE cidade = 'SANTO ANDRÉ';
SELECT * FROM associado;

-- 16
SELECT nome, plano, valor, cidade
FROM associado
INNER JOIN plano ON
associado.plano = plano.numero
WHERE cidade = 'SÃO PAULO' AND plano = 'M2' OR plano = 'M3';

-- 17
SELECT * 
FROM associado
INNER JOIN plano ON 
associado.plano = plano.numero
ORDER BY associado.plano ASC;

-- 18
SELECT * 
FROM associado
INNER JOIN plano ON 
associado.plano = plano.numero
ORDER BY associado.plano ASC, associado.nome DESC;

-- 19 
SELECT nome, plano
FROM associado
WHERE plano NOT LIKE '%M%';

-- 20
SELECT nome, descricao
FROM associado
INNER JOIN plano ON
associado.plano = plano.numero
ORDER BY associado.nome ASC;

-- 21
SELECT * FROM plano
WHERE valor BETWEEN 300.00 AND 500.00;

-- 22
SELECT nome, plano, descricao, valor
FROM associado
INNER JOIN plano ON
associado.plano = plano.numero
WHERE nome LIKE '%AMARAL%';

-- 23
SELECT nome, cidade
FROM associado
WHERE cidade = 'DIADEMA';

-- 24 
SELECT * FROM plano;

UPDATE plano
SET valor = valor * 1.06
WHERE descricao LIKE '%MASTER%';

-- 25 
SELECT nome, cep 
FROM associado
WHERE cep LIKE '09%';








