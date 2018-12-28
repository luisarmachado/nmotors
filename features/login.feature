#language: pt


Funcionalidade: Login
    Para que eu possa anunciar meus veículos
    Sendo um usuário cadastrado
    Posso acessar o sistema com meu email e senha

Contexto: Form de login
    Dado que eu acessei a página de login

@logout @smoke
Cenário: Login do usuário

    Quando faço login com:
        | nome  | Contoso                   |
        | email | contoso@ninjahouse.com.br |
        | senha | 123456                    |   
    Então sou autenticado com sucesso

@tentativa_login
Esquema do Cenário: Tentar logar

    Quando faço login com:
        | email | <email> |
        | senha | <senha> |
    Então devo ver a seguinte mensagem de "<alerta>"    
    

    Exemplos:
      | email                      | senha  | alerta                        |
      | padre.kevedo@nokziste.org  | 123456 | Usuário e/ou senha inválidos. |
      | luisa_resende3@hotmail.com | xyz123 | Usuário e/ou senha inválidos. |
      | luisa_resende3@hotmail.com |        | Senha não informada.          |
      |                            | 123456 | Email não informado.          |
      | teste#teste.com            | 123456 | Email inválido.               |

    