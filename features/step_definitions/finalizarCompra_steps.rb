Dado('avança para o checkout da compra') do
    @finalizarcompra.checkout_pedido
  end
  
  Quando('finalizo o processo de compra') do
    @finalizarcompra.finalizacao_pedido
  end
  
  Entao('deve ser informado o pedido foi realizado') do
    @finalizarcompra.confirmacao_compra
  end