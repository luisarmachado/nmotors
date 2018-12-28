# steps do cenário

# Cenário: Cadastro simples

Dado("que estou na página de cadastro") do  
    @cadastro_page.visita
end
    
Quando("faço o meu cadastro com") do |table|

    @usuario = table.rows_hash
    # DAO Data Acess Object
    DAO.new.remover_usuario(@usuario[:email])
    # usuario2 = {
    #  nome: "Vinicius Rezende",
    #  email: "vinicius@gmail.com",
    #  senha: "98765"
     # }

     # puts @usuario
     # puts usuario2
    
     # inserindo os dados da tabela na mão (hardcode)
     @cadastro_page.novo(@usuario)
     # sleep 10 (espera obrigatoriamente 10 segundos)

end

Então("devo ver a mensagem {string}") do |mensagem_alerta|
   expect(@cadastro_page).to have_content mensagem_alerta
end