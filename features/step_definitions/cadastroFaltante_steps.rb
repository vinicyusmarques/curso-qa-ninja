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