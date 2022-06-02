--Qual a quantidade de endereços por estado?
select cidades.uf, count(*) as qtd_end_por_estado
from cidades join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
group by cidades.uf;

--b) Qual a quantidade de clientes de cada estado?

select cidades.uf, count(distinct clientes.cod_cliente)
from clientes join clientes_enderecos
	on clientes_enderecos.cod_cliente = clientes.cod_cliente
	join enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
	on enderecos.cod_cidade = cidades.cod_cidade
group by cidades.uf;

--c)Qual o ranking de estados por quantidade de clientes, ou seja, em ordem decrescente de quantidade de clientes?
	select estados.uf, count(distinct clientes.cod_cliente) AS Clientes
	from clientes join clientes_enderecos
	on clientes_enderecos.cod_cliente = clientes.cod_cliente
	join enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
	on enderecos.cod_cidade = cidades.cod_cidade
	join estados
	on estados.uf = cidades.uf
group by estados.uf
ORDER BY Clientes DESC;


--d)Qual o ranking de regiões por quantidade de clientes, ou seja, em ordem decrescente de quantidade de clientes?
select estados.regiao, count(distinct clientes.cod_cliente) AS Clientes
from clientes join clientes_enderecos
	on clientes_enderecos.cod_cliente = clientes.cod_cliente
	join enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
	on enderecos.cod_cidade = cidades.cod_cidade
	join estados
	on estados.uf = cidades.uf
group by estados.regiao
ORDER BY Clientes DESC;

--e) Qual a quantidade de pedidos por região?
SELECT estados.regiao, COUNT(pedidos.num_pedido) AS PedidoRegiao
from pedidos 
join clientes_enderecos 
	on (clientes_enderecos.cod_cliente = pedidos.cod_cliente AND clientes_enderecos.cod_endereco= pedidos.cod_endereco)
	join enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
	on enderecos.cod_cidade = cidades.cod_cidade
	join estados
	on estados.uf = cidades.uf
group by estados.regiao;

-- f) Qual a quantidade de pedidos por ano e por região, considerando apenas os pedidos feitos nos anos de 2000 até 2004?
SELECT estados.regiao, YEAR(pedidos.data_emissao) as ano, count(*) as total
from pedidos 
join clientes_enderecos 
	on (clientes_enderecos.cod_cliente = pedidos.cod_cliente AND clientes_enderecos.cod_endereco= pedidos.cod_endereco)
	join enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
	on enderecos.cod_cidade = cidades.cod_cidade
	join estados
	on estados.uf = cidades.uf
group by estados.regiao, YEAR(pedidos.data_emissao)
	having YEAR(pedidos.data_emissao) between 2000 AND 2004;

-- g) Qual o valor total gasto por cliente, ordenado em ordem decrescente de valor total?

SELECT clientes.cod_cliente, SUM(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) as total_gasto FROM pedidos_produtos
JOIN pedidos ON pedidos.num_pedido = pedidos_produtos.num_pedido
JOIN clientes_enderecos ON (clientes_enderecos.cod_cliente = pedidos.cod_cliente AND clientes_enderecos.cod_endereco = pedidos.cod_endereco)
JOIN clientes ON clientes_enderecos.cod_cliente = clientes.cod_cliente
group by clientes.cod_cliente
order by total_gasto DESC;

--h) Qual o valor total gasto por cliente, ordenado em ordem decrescente de valor total, considerando apenas os clientes do Rio Grande do Sul?
SELECT clientes.cod_cliente, SUM(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) as total_gasto FROM pedidos_produtos
JOIN pedidos ON pedidos.num_pedido = pedidos_produtos.num_pedido
JOIN clientes_enderecos ON (clientes_enderecos.cod_cliente = pedidos.cod_cliente AND clientes_enderecos.cod_endereco = pedidos.cod_endereco)
JOIN clientes ON clientes_enderecos.cod_cliente = clientes.cod_cliente
JOIN enderecos ON enderecos.cod_endereco = clientes_enderecos.cod_endereco
JOIN cidades ON enderecos.cod_cidade = cidades.cod_cidade
JOIN estados ON estados.uf = cidades.uf
WHERE cidades.uf = 'RS'
group by clientes.cod_cliente

--i) Qual o valor total vendido por autor?
SELECT autores.cod_autor, SUM(PP.quantidade * PP.valor_unitario) as Valor from autores
JOIN autores_produtos AP ON AP.cod_autor = autores.cod_autor
JOIN produtos ON produtos.cod_produto = AP.cod_produto
JOIN pedidos_produtos PP ON PP.cod_produto = produtos.cod_produto
GROUP BY autores.cod_autor;

--j)Qual o valor médio faturado com as vendas por produto? 
SELECT produtos.cod_produto, AVG(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) FROM produtos
JOIN pedidos_produtos on produtos.cod_produto = pedidos_produtos.cod_produto
group by produtos.cod_produto;


-- k)Qual o valor total de cada pedido?
SELECT pedidos.num_pedido, SUM(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) as Soma from pedidos
JOIN pedidos_produtos on pedidos.num_pedido = pedidos_produtos.num_pedido
JOIN produtos on pedidos_produtos.cod_produto = produtos.cod_produto
group by pedidos.num_pedido;

-- l)Qual o valor médio dos pedidos por estado?
SELECT estados.uf, AVG(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) as Soma from pedidos_produtos
JOIN pedidos on pedidos.num_pedido = pedidos_produtos.num_pedido
JOIN clientes_enderecos CE ON CE.cod_cliente = pedidos.cod_cliente AND CE.cod_endereco = pedidos.cod_endereco
JOIN enderecos ON enderecos.cod_endereco = CE.cod_endereco
JOIN cidades ON cidades.cod_cidade = enderecos.cod_cidade
JOIN estados ON estados.uf = cidades.uf
GROUP BY estados.uf;


