  Dado('busco o produto Faded Short Sleeve T-shirts') do
    @buscaproduto.buscar_produto
   end

  Dado('que usuario adiciona o produto no carrinho') do    
    @buscaproduto.adicionar_produto_ao_carrinho
  end  