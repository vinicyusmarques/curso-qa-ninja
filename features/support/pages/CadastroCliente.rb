class CadastroCliente
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
    
    def acessar_pagina_inicial
        visit("http://automationpractice.com/index.php")
    end

    def acessar_pagina_identificacao
        find(EL["home_botaologin"]).click
    end

    def preencher_label_email(string)
        case string
        when 'e-mail que nao e possivel registrar' 
          then find(EL["createaccount_email"]).set ""
        when 'e-mail para registrar' 
          then find(EL["createaccount_email"]).set @email
        end
        click_link_or_button "Create an account"
    end

    def preencher_formulario
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

    def validar_cadastro
        expect(page).to have_text EL["validacao_cadastro"]
    end
end