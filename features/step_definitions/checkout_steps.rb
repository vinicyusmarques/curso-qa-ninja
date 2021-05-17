Dado('avança para o checkout da compra') do
    @finalizarcompra.checkout
  end
  
  Quando('finalizo o processo de compra') do
    @finalizarcompra.finish
  end
  
  Entao('deve ser informado o pedido foi realizado') do
    @finalizarcompra.confirmPurchase
  end