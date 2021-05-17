class RegisterCustomer
    include Capybara::DSL
    include RSpec::Matchers

    def initialize
        @primeironome = Faker::Name.first_name
        @ultimonome = Faker::Name.last_name
        @senha = "vini123"
        @nomeendereco =  Faker::Name.first_name
        @ultimoendereco = Faker::Name.last_name
        @endereco = Faker::Address.street_name
        @cidade = Faker::Address.city
        @cep = "00000"
        @celular = "11971487394"
        @referenciaendereco = "meu endereco"
        @email = Faker::Internet.email
    end
    
    def accessHome
        visit("http://automationpractice.com/index.php")
    end

    def accessAuthentication
        find(EL["home_botaologin"]).click
    end

    def fillEmail(string)
        case string
        when 'e-mail que nao e possivel registrar' 
          then find(EL["createaccount_email"]).set ""
        when 'e-mail para registrar' 
          then find(EL["createaccount_email"]).set @email
        end
        click_link_or_button "Create an account"
    end

    def fillForm
        find("#uniform-id_gender1").click
        find(EL["cadastro_primeironome"]).set @primeironome
        find(EL["cadastro_ultimonome"]).set @ultimonome
        find(EL["cadastro_senha"]).set @senha
        find(EL["cadastro_nomeendereco"]).set @nomeendereco
        find(EL["cadastro_ultimonomeendereco"]).set @ultimoendereco
        find(EL["cadastro_endereco"]).set @endereco
        find(EL["cadastro_cidade"]).set @cidade
        find(EL["cadastro_estado"]).click
        find(EL["cadastro_cep"]).set @cep
        find(EL["cadastro_celular"]).set @celular
        find(EL["cadastro_referenciaendereco"]).set @referenciaendereco
        click_link_or_button "Register"
    end

    def validateRegistration
        expect(page).to have_text EL["validacao_cadastro"]
    end

    def fillFormEmpty
        find("#uniform-id_gender1").click
        find("#customer_firstname").set ""
        find("#customer_lastname").set ""
        find("#passwd").set ""
        find("#firstname").set ""
        find("#lastname").set ""
        find("#address1").set  "" 
        find("#city").set  ""
        find("select[name='id_state'] option[value='']").click
        find("#postcode").set ""
        find("#phone_mobile").set ""
        find("#alias").set ""
    end

    def alertFieldsEmpty
        expect(page).to have_text "You must register at least one phone number"
        expect(page).to have_text "lastname is required"
        expect(page).to have_text "firstname is required"
        expect(page).to have_text "passwd is required"
        expect(page).to have_text "address1 is required"
        expect(page).to have_text "city is required"
        expect(page).to have_text "The Zip/Postal code you've entered is invalid. It must follow this format: 00000"
        expect(page).to have_text "This country requires you to choose a State"
    end
end