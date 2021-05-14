Dado('que o usuario esteja na pagina tela inicial') do
   @cadastrocliente.acessar_pagina_inicial
  end
  
  Dado('que o usuario esteja na tela de identificacao') do
    @cadastrocliente.acessar_pagina_identificacao
  end

  Dado('informa o {string}') do |string|
    @cadastrocliente.preencher_label_email(string)
  end

  Quando('o usuario preenche as informacoes obrigatorias') do
    @cadastrocliente.preencher_formulario
  end
  
  Então('deve ser redirecionado para a area logada') do
    @cadastrocliente.validar_cadastro
  end
  