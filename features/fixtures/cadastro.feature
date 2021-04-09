#language: pt

Funcionalidade: Cadastro de usuario
    Sendo um visitante do site
    Quero fazer o meu cadastro

Contexto: 
    Dado que o usuario esteja na pagina tela inicial
    E que o usuario esteja na tela de identificacao

    @cadastrocliente
    Cenario: Cadastro de cliente com sucesso
        E informa o 'e-mail para registrar'
        Quando o usuario preenche as informacoes obrigatorias  
        Então deve ser redirecionado para a area logada

    @cadastrosememail
    Cenario: Cadastro de cliente sem email
        E informa o 'e-mail que nao e possivel registrar'
        Entao deve ser informado do email invalido

    @informacoesfaltantes
    Cenario: Cadastro sem informacoes obrigatorias
        E informa o 'e-mail para registrar'
        Quando o usuario nao informa os dados obrigatorios
        Entao devo ser informado que os campos sao obrigatorios

