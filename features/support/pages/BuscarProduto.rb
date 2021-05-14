class BuscarProduto
    include Capybara::DSL
    include RSpec::Matchers
    
    def buscar_produto
        find(EL["insere_nome_produto"]).set "Faded Short Sleeve T-shirts"
        click_button "Search"
        click_link_or_button "Faded Short Sleeve T-shirts", match: :first
    end

    def adicionar_produto_ao_carrinho
        addcart = page.find('span', text: "Add to cart")
        addcart.click
    end
end 
