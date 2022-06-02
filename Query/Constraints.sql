CREATE TABLE ESTADOS
(
uf CHAR(2) NOT NULL,
nome VARCHAR(40) NOT NULL,
regiao CHAR(2) NOT NULL,
CONSTRAINT PK_ESTADOS PRIMARY KEY (uf)
);

CREATE TABLE CIDADES
(
cod_cidade NUMERIC(4) NOT NULL,
nome VARCHAR(60) NOT NULL,
uf CHAR(2) NOT NULL,
CONSTRAINT PK_CIDADES PRIMARY KEY (cod_cidade)
);


insert into estados values ('RS', 'RIO GRANDE DO SUL', 'S');
insert into estados values ('SC', 'Santa Catarina', 'S');

insert into cidades values (10, 'Porto Alegre', 'RS');
insert into cidades values (11, 'Canoas', 'RS');
insert into cidades values (12, 'Florianopolis', 'SC');

select * from cidades

alter table cidades
add constraint FK_EST_CID foreign key (uf)
	references estados(uf)

