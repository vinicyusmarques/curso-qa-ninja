class Checkout
    include Capybara::DSL
    include RSpec::Matchers

    def clickButton(text)
        btnProceed = page.find('span', text: text)
        btnProceed.click
    end
    
    def checkout
        2.times{clickButton("Proceed to checkout")}
    end

    def finish
        clickButton("Proceed to checkout")
        find('.checker').click
        clickButton("Proceed to checkout")
        find(".bankwire").click
    end

    def confirmPurchase
        clickButton("I confirm my order")
        expect(page).to have_text "Your order on My Store is complete."
    end
end