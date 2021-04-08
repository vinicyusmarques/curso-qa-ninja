Dado('que o usuario esteja na pagina tela inicial') do
   visit "http://automationpractice.com/index.php"
  end
  
  Dado('que o usuario esteja na tela de identificacao') do
    find(".login").click
  end
  
  Dado('informa o e-mail para registrar') do
    find("#email_create").set Faker::Internet.email
    click_link_or_button "Create an account"
  end
  
  Quando('o usuario preenche as informacoes obrigatorias') do
    find("#uniform-id_gender1").click
    find("#customer_firstname").set Faker::Name.first_name
    find("#customer_lastname").set Faker::Name.last_name
    find("#passwd").set "vini123"
    find("#firstname").set Faker::Name.first_name
    find("#lastname").set Faker::Name.last_name
    find("#address1").set Faker::Address.street_name 
    find("#city").set Faker::Address.city 
    find("select[name='id_state'] option[value='1']").click
    find("#postcode").set "00000"
    find("#phone_mobile").set "11971487394"
    find("#alias").set "meu endereco"
    click_link_or_button "Register"
  end
  
  Então('deve ser redirecionado para a area logada') do
    expect(page).to have_text "Welcome to your account. Here you can manage all of your personal information and orders"
  end


  Quando('nao informa o email para resgistro') do
    find("#email_create").set ""
    click_link_or_button "Create an account"
  end
  
  Entao('deve ser informado do email invalido') do
    expect(page).to have_text "Invalid email address"
  end
  
  Quando('o usuario nao informa os dados obrigatorios') do
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
    click_link_or_button "Register"
  end
  
  Entao('devo ser informado que os campos sao obrigatorios') do
    expect(page).to have_text "You must register at least one phone number"
    expect(page).to have_text "lastname is required"
    expect(page).to have_text "firstname is required"
    expect(page).to have_text "passwd is required"
    expect(page).to have_text "address1 is required"
    expect(page).to have_text "city is required"
    expect(page).to have_text "The Zip/Postal code you've entered is invalid. It must follow this format: 00000"
    expect(page).to have_text "This country requires you to choose a State"
  end