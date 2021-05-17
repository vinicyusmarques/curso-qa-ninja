Dado('que o usuario esteja na pagina tela inicial') do
   @cadastrocliente.accessHome
  end
  
  Dado('que o usuario esteja na tela de identificacao') do
    @cadastrocliente.accessAuthentication
  end

  Dado('informa o {string}') do |string|
    @cadastrocliente.fillEmail(string)
  end

  Quando('o usuario preenche as informacoes obrigatorias') do
    @cadastrocliente.fillForm
  end
  
  Então('deve ser redirecionado para a area logada') do
    @cadastrocliente.validateRegistration
  end

#cadastro invalido

Entao('deve ser informado do email invalido') do
  expect(page).to have_text "Invalid email address"
end

#cadastro sem informações

Quando('o usuario nao informa os dados obrigatorios') do
  @cadastrocliente.fillFormEmpty
  click_link_or_button "Register"
end

Entao('devo ser informado que os campos sao obrigatorios') do
  @cadastrocliente.alertFieldsEmpty
end