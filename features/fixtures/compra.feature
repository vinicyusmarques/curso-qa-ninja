#language: pt

Funcionalidade: Compra de produtos
    Sendo cliente logado no site
    Quero fazer a compra de produtos

Contexto: 
    Dado que o usuario esteja logado
    E busco o produto Faded Short Sleeve T-shirts

@compracomsucesso
Cenario: Compra finalizada com sucesso
    Dado que usuario adiciona o produto no carrinho
    E avança para o checkout da compra
    Quando finalizo o processo de compra
    Entao deve ser informado o pedido foi realizado