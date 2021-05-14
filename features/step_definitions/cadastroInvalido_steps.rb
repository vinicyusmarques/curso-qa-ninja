 Entao('deve ser informado do email invalido') do
   expect(page).to have_text "Invalid email address"
 end