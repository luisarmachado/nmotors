

Dado("que eu acessei a página de login") do
    # cenário começa aqui
    @home.acessar
    @nav.vai_para_login
end
  
# Quando("faço login com {string} e {string}") do |email, senha|
#    find("input[placeholder=Email]").set email
#    find("input[type=password]").set senha
#    click_button "Entrar"

    # outra forma caso não tenha outros atributos
    # campos = all("input")
    # campos[0].set email
    # campos[1].set senha

#end

Quando("faço login com:") do |table|

    @usuario = table.rows_hash
    @login.faz_login(@usuario[:email], @usuario[:senha])

end
  
Então("devo ver a seguinte mensagem de {string}") do |mensagem_alerta|
    expect(@login.msg_alerta).to eql mensagem_alerta
end