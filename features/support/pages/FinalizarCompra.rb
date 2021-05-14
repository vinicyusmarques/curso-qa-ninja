class FinalizarCompra
    include Capybara::DSL
    include RSpec::Matchers
    
    def checkout_pedido
        c1 = page.find('span', text: "Proceed to checkout")
        c1.click
      
        c2 = page.find('span', text: "Proceed to checkout")
        c2.click
    end

    def finalizacao_pedido
        c3 = page.find('span', text: "Proceed to checkout")
        c3.click
        find('.checker').click
        c4 = page.find('span', text: "Proceed to checkout")
        c4.click
        find(".bankwire").click
    end

    def confirmacao_compra
        c5 = page.find('span', text: "I confirm my order")
        c5.click
        expect(page).to have_text "Your order on My Store is complete."
    end
end