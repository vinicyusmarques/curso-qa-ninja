class SearchProduct
    include Capybara::DSL
    include RSpec::Matchers
    
    def search
        find(EL["insere_nome_produto"]).set "Faded Short Sleeve T-shirts"
        click_button "Search"
        click_link_or_button "Faded Short Sleeve T-shirts", match: :first
    end

    def addCart
        addcart = page.find('span', text: "Add to cart")
        addcart.click
    end
end 
