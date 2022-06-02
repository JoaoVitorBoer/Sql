select * from  autores;

select * from cidades where cod_cidade = 1444;

select * from enderecos where cod_cidade = 1444;

select rua, numero, complemento, nome, uf
from cidades join enderecos --Tanto faz a ordem
	on cidades.cod_cidade = enderecos.cod_cidade
where cidades.COD_CIDADE = 1444;

SELECT produtos.titulo, autores.nome
FROM (autores join autores_produtos
	on autores_produtos.cod_autor = autores.cod_autor)
	join produtos
		on produtos.cod_produto = autores_produtos.cod_produto
where importado = 'S' 
order by produtos.titulo;
------------------------------------------------------------------------
--- Exercicios
SELECT COUNT(*)
from cidades join estados
	on cidades.UF = estados.UF
where estados.UF = 'SP'

SELECT usuarios.nome, usuarios.email, telefones.numero
from usuarios join clientes
	on usuarios.cod_usuario = clientes.cod_cliente
	join telefones
	on clientes.cod_cliente = telefones.cod_cliente
where telefones.ddd = 51;

--- Modo 2
SELECT usuarios.nome, usuarios.email, telefones.numero
from usuarios join telefones
	on usuarios.cod_usuario = telefones.cod_cliente
where telefones.ddd = 51;

SELECT cidades.nome, cidades.cod_cidade, estados.regiao
from cidades join estados
	on cidades.UF = estados.UF
WHERE (estados.uf = 'RS' OR estados.uf = 'SP'OR estados.uf = 'PE') and cidades.nome LIKE 'Santa %'
ORDER BY cidades.nome DESC;


SELECT DISTINCT autores.nome, estados.regiao
FROM autores join autores_produtos
		on autores.cod_autor = autores_produtos.cod_autor
	join produtos
		on autores_produtos.cod_produto = produtos.cod_produto
	join pedidos_produtos
		on pedidos_produtos.cod_produto = produtos.cod_produto
	join pedidos
		on pedidos.num_pedido = pedidos_produtos.num_pedido
	join clientes_enderecos
		on pedidos.cod_cliente = clientes_enderecos.cod_cliente
	join enderecos
		on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
		on cidades.cod_cidade = enderecos.cod_cidade
	join estados
		on estados.uf = cidades.uf
	where estados.regiao = 'N'
	ORDER BY autores.nome;










