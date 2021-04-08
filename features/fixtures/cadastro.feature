#language: pt

Funcionalidade: Cadastro de usuario
    Sendo um visitante do site
    Quero fazer o meu cadastro

Contexto: 
    Dado que o usuario esteja na pagina tela inicial

    @cadastrocliente
    Cenario: Cadastro de cliente com sucesso
        Dado que o usuario esteja na tela de identificacao
        E informa o e-mail para registrar
        Quando o usuario preenche as informacoes obrigatorias  
        Então deve ser redirecionado para a area logada

    @cadastrosememail
    Cenario: Cadastro de cliente sem email
        Dado que o usuario esteja na tela de identificacao
        Quando nao informa o email para resgistro
        Entao deve ser informado do email invalido

    @informacoesfaltantes
    Cenario: Cadastro sem informacoes obrigatorias
        Dado que o usuario esteja na tela de identificacao
        E informa o e-mail para registrar
        Quando o usuario nao informa os dados obrigatorios
        Entao devo ser informado que os campos sao obrigatorios

