CREATE TABLE PESSOAS
( cpf VARCHAR(20) NOT NULL,
nome VARCHAR(150) NOT NULL,
idade NUMERIC(3) NULL,
endereco VARCHAR(150)
-- o campo endereço é NULL implicitamente
);



-- ordem normal das colunas:
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('32809', 'Maria', 25, 'Rua A, 20');
-- outra ordem qualquer das colunas:
INSERT INTO PESSOAS (idade, endereco, cpf, nome)
VALUES (25, 'Rua A, 20', '30599', 'Pedro');
-- valores nulos:
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('29385', 'Carlos', NULL, NULL);
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('39582', 'Alice', 80, NULL);
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('78838', 'Antonio', NULL, 'Rua B, 80');

INSERT INTO PESSOAS (cpf, nome)
VALUES ('90038', 'Ana Paula');
INSERT INTO PESSOAS (cpf, nome, idade)
VALUES ('23487', 'Patricia', 18);
INSERT INTO PESSOAS (cpf, nome, endereco)
VALUES ('23363', 'Jose', 'Rua C, 50');

/*
select *
from pessoas;

select count (*) 
from pessoas
where idade IS null;
;

select count (*) 
from pessoas
where idade IS NOT null;
;

select * 
from pessoas
where nome LIKE'A%';

select * 
from pessoas
where nome LIKE'_n%';

select *
from pessoas
WHERE idade IN(25, 30, 40);
*/
------------------------------------
select *
from pessoas;

alter table pessoas
drop column datanasc;

alter table pessoas
add email varchar(150) NULL;

alter table pessoas
add telefone varchar(20);

 -- CONSTRAINTS == RESTRICOES

 UPDATE PESSOAS
 SET EMAIL = SUBSTRING(NOME, 1,3) + '@EMAIL.COM';

 alter table pessoas 
 ADD datanasci DATE NULL;
 
 INSERT INTO pessoas (cpf, nome, datanasci, endereco) VALUES
('29048', 'Roberto', convert(date,'1980-02-03',103), 'Rua D, 80');

SELECT nome, GETDATE() - datanasci
from pessoas;