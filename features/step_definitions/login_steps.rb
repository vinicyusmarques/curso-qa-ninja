Dado('que o usuario esteja logado') do
    @cadastrocliente.acessar_pagina_inicial
    @cadastrocliente.acessar_pagina_identificacao
    @login.autenticacao
  end