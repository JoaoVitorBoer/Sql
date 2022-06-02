CREATE TABLE ALUNOS
(	nroMatricula VARCHAR(10) NOT NULL,
	cpf VARCHAR(20) NOT NULL,
	email VARCHAR(100) NULL,
	nome VARCHAR(150) NOT NULL,
	anoIngresso NUMERIC(4) NOT NULL,
	endereco VARCHAR(150) NULL,
	sexo CHAR(1) NOT NULL,
	CONSTRAINT PK_ALUNOS PRIMARY KEY (nroMatricula),
	CONSTRAINT AK1_ALUNOS UNIQUE (cpf),
	CONSTRAINT AK2_ALUNOS UNIQUE (email)
);

select * from pessoas;

alter table pessoas
add constraint PK_PESSOAS primary key (cpf);

insert into pessoas
VALUES ('23487', 'Jose', 'Rua C, 50', nULL, NULL, NULL);  --Como cpf é PK e está rependio, logo não pdoe ser inserido duplicado.

alter table veiculos
add constraint CK_KM CHECK (km >= 0);-- Cria restrições para as colunas


