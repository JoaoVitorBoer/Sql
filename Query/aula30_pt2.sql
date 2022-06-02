select * from ESTADOS;
select * from CIDADES;


select*
from estados, cidades
where estados.UF = cidades.UF

select * 
from estados INNER JOIN cidades
	on estados.UF = cidades.UF
WHERE ESTADOS.uf ='RS';

delete from cidades;
delete from estados;

select count (*) from estados; --27
select count (*)from cidades; --5561


select ESTADOS.NOME, CIDADES.NOME
from estados INNER JOIN cidades
	on estados.UF = cidades.UF;


