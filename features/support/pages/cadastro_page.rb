

class CadastroPage
    include Capybara::DSL

    def visita
        visit "/cadastre-se"
    end

    def novo(usuario)       
        fill_in "fullName", with: usuario[:nome]
        fill_in "email", with: usuario[:email]
        fill_in "password", with: usuario[:senha]

        click_button "Cadastrar"
    end

    def alerta
        find("alerta")
    end
end