class Login
    include Capybara::DSL
    include RSpec::Matchers
    
    def initialize
        @email = "vinicyusmarquess@gmail.com"
        @senha = "vini1994"
    end

    def autenticacao
        find(EL["auth_email"]).set @email
        find(EL["auth_senha"]).set @senha
        click_button "Sign in" 
        expect(page).to have_text "Welcome to your account. Here you can manage all of your personal information and orders"
    end
end