#language: pt

Funcionalidade: Cadastro do usuário
    Sendo um visitante do site
    Posso fazer meu cadastro com nome, email e senha
    Para que eu possa anunciar um veículo usado


@sprint1 @logout
Cenário: Cadastro simples

    Dado que estou na página de cadastro
    Quando faço o meu cadastro com 
        | nome  | Luisa Machado              |
        | email | luisa_resende3@hotmail.com |
        | senha | 123456                     |
    Então sou autenticado com sucesso


Esquema do Cenário: Tentativa de cadastro     

    Dado que estou na página de cadastro
    Quando faço o meu cadastro com 
        | nome  | <nome>  |
        | email | <email> |
        | senha | <senha> |
    Então devo ver a mensagem "<alerta>"

    Exemplos:
    |nome         |email                     |senha |alerta                                 |
    |Luisa Machado|luisa_resende3$hotmail.com|123456|Email inválido.                        |
    |Luisa Machado|luisa_resende3@hotmail.com|      |Senha não informada.                   |
    |             |luisa_resende3@hotmail.com|123456|Nome não informado.                    |
    |Luisa Machado|luisa_resende3@hotmail.com|12345 |Senha deve ter pelo menos 6 caracteres.|



