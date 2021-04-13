Dado('que o usuario esteja logado') do
    visit "http://automationpractice.com/index.php"
    find(".login").click
    find("#email").set "vinicyusmarquess@gmail.com"
    find("#passwd").set "vini1994"
    click_button "Sign in"
  end

  Dado('busco o produto Faded Short Sleeve T-shirts') do
    find("#search_query_top").set "Faded Short Sleeve T-shirts"
    click_button "Search"
  end
  
  Dado('que usuario adiciona o produto no carrinho') do
    expect(page).to have_button('Add to cart')

    #expect(page).to have_content('Add to cart')
    sleep 5
  end
  
  Dado('avança para o checkout da compra') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('finalizo o processo de compra') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Entao('deve ser informado o pedido foi realizado') do
    pending # Write code here that turns the phrase above into concrete actions
  end