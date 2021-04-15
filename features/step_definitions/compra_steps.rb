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
    click_link_or_button "Faded Short Sleeve T-shirts", match: :first
    #find("div[title*='Faded Short Sleeve T-shirts']").click
   end

  Dado('que usuario adiciona o produto no carrinho') do    
    addcart = page.find('span', text: "Add to cart")
    addcart.click
  end
  #assert 
  Dado('avança para o checkout da compra') do
    c1 = page.find('span', text: "Proceed to checkout")
    c1.click
  
    c2 = page.find('span', text: "Proceed to checkout")
    c2.click
  end
  
  Quando('finalizo o processo de compra') do
    c3 = page.find('span', text: "Proceed to checkout")
    c3.click
    find('.checker').click
    c4 = page.find('span', text: "Proceed to checkout")
    c4.click
    find(".bankwire").click
  end
  
  Entao('deve ser informado o pedido foi realizado') do
    c5 = page.find('span', text: "I confirm my order")
    c5.click
    expect(page).to have_text "Your order on My Store is complete."
  end