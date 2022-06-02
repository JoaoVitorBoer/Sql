CREATE TABLE MEDICOS(
	crm varchar(20) NOT NUll,
	nome varchar(50) NOT NULL ,
	especialidade varchar(100) NOT NULL
	CONSTRAINT PK_CRM PRIMARY KEY (crm)
);

CREATE TABLE PACIENTES(
	cpf varchar(20) NOT NUll,
	nome varchar(50) NOT NULL ,
	sexo varchar(15) NOT NULL,
	CONSTRAINT PK_CPF PRIMARY KEY (cpf)
);

CREATE TABLE MEDICOSPACIENTES(
	crm varchar(20) NOT NUll,
	cpf varchar(20) NOT NULL ,
	CONSTRAINT PK_MEDICOSPACIENTES PRIMARY KEY(crm,cpf)
);

CREATE TABLE DATAS(
	dia DATE
);


ALTER TABLE MEDICOSPACIENTES
ADD CONSTRAINT FK_CPF_CPF
		FOREIGN KEY (cpf)
		REFERENCES PACIENTES (cpf);

ALTER TABLE MEDICOSPACIENTES
ADD CONSTRAINT FK_CRM_CRM
	FOREIGN KEY (crm)
	REFERENCES MEDICOS (crm);

INSERT INTO MEDICOS (crm, nome, especialidade)
VALUES ('123456', 'Joao', 'Cardio'),
	   ('598614', 'Victor', 'Nefrologista'),
	   ('458937', 'Paulo Ricardo', 'Otorrino'),
	   ('471032', 'Luiza', 'Pediatra'),
	   ('786158', 'Picanha', 'Nutricionista');
SELECT * FROM MEDICOS;

INSERT INTO PACIENTES (cpf, nome, sexo)
VALUES ('72130614', 'Peter', 'M'),
	   ('51479334', 'Laura C.', 'F'),
	   ('21456398', 'Luiara', 'F'),
	   ('45871029', 'Greg', 'M'),
	   ('89321478', 'Thiago P.', 'M'),
	   ('02365478', 'Isabela', 'F'),
	   ('01897653', 'Adolfo', 'M'),
	   ('53012735', 'Ana Maria', 'F'),
	   ('02987346', 'Regina', 'F'),
	   ('12589634', 'Ronaldo', 'M');

SELECT * FROM PACIENTES;

INSERT INTO MEDICOSPACIENTES (crm, cpf)
VALUES ('786158', '72130614');
	

INSERT INTO MEDICOSPACIENTES (crm, cpf) --TESTANDO INVALIDO
VALUES ('458937', '72130000');

INSERT INTO MEDICOSPACIENTES (crm, cpf)
VALUES ('598614', '01897653');

SELECT * FROM MEDICOSPACIENTES;

