select * from produtos;

create view PRODUTOS_IMPORTADOS AS
select cod_produto, titulo, preco, prazo_entrega
from produtos 
where importado = 'S';

SELECT*
FROM PRODUTOS_IMPORTADOS join autores_produtos
on PRODUTOS_IMPORTADOS.cod_produto =  autores_produtos.cod_autor
join autores on autores_produtos.cod_autor = autores.cod_autor
where autores.nome like 'A%';

create view produtos_importados_em_dolares AS
select titulo,round(preco / 4.80, 2) as USD from PRODUTOS_IMPORTADOS;

SELECT * FROM PRODUTOS_IMPORTADOS_EM_DOLARES;

update PRODUTOS_IMPORTADOS 
set prazo_entrega = 25
where COD_PRODUTO =133;