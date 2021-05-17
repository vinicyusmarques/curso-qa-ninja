Dado('que o usuario esteja logado') do
    @cadastrocliente.accessHome
    @cadastrocliente.accessAuthentication
    @login.authentication
  end