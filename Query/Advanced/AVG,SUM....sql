select sqrt(preco), lower(titulo)
from produtos;


select avg(preco)
from produtos;

SELECT count(ddd) from telefones;

SELECT count(*) 
from telefones
where ddd is not null;

select max(preco)
from produtos
where importado = 'N';

----------------------------------

CREATE TABLE PRODS
(
codigo NUMERIC(3) NOT NULL,
nome VARCHAR(50) NOT NULL,
preco NUMERIC (5,2) NOT NULL,
tipo CHAR(1) NULL,
-- [S]uprimento, [C]omponente, [P]eriférico
CONSTRAINT PK1 PRIMARY KEY (codigo)
);

INSERT INTO PRODS
VALUES( 10, 'HD', 200, 'C');
INSERT INTO PRODS
VALUES( 11, 'Memoria', 250, 'C');
INSERT INTO PRODS
VALUES( 12, 'Impressora', 680,'P');
INSERT INTO PRODS
VALUES( 13, 'Processador', 600, 'C');
INSERT INTO PRODS
VALUES( 14, 'DVD-RW', 2, 'S');
INSERT INTO PRODS
VALUES( 15, 'Papel A4', 19, 'S');
INSERT INTO PRODS
VALUES( 16, 'Scanner', 199, 'P');

SELECT * FROM PRODS

select count(*)
from prods
where tipo ='C';

--------------
select tipo, count(*) 
from prods
group by tipo;

select tipo, avg(preco) as media_precos
from prods
group by tipo;

-------------- Exercicios
select count(*)as qtd from prods;

select count(distinct tipo)
from prods

select tipo, count(*) as qtd
from prods
group by tipo;

select avg(preco)
from prods;

select avg(preco)
from prods
where tipo = 'S';

select avg(preco)
from prods
group by tipo

----------------------
ALTER TABLE PRODS ADD usuario NUMERIC(1) NULL;

SELECT * FROM PRODS;

UPDATE PRODS
SET usuario = 1
WHERE codigo IN (10,12,13,14);

UPDATE PRODS
SET usuario = 2
WHERE usuario IS NULL;

SELECT tipo, usuario, AVG(preco)
FROM PRODS
GROUP BY tipo, usuario
ORDER BY tipo, usuario;

UPDATE PRODS
SET usuario = 2
WHERE codigo = 14;

UPDATE PRODS
SET usuario = NULL
WHERE codigo = 13;

------------------------------------------

select tipo, round(avg(preco),2) as media
from prods
group by tipo
	having avg(preco) > 200
;

----------------------------------------

-- Quantas cidades existem por estado?
select uf, count(*) as quant
from cidades 
group by uf
	having count(*) >= 200
order by quant DESC;

-----------------------
select tipo, count(*) as qtd
from prods
group by tipo
	having avg(preco) > 100;

	-----------------------------------

