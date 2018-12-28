Before do
    @cadastro_page = CadastroPage.new
    @nav = Nav.new
    @home = HomePage.new 
    @login = LoginPage.new
    @anuncio_page = AnuncioPage.new
    @swal = SweetAlert.new 
    page.current_window.resize_to(1440, 900)
end

Before ("@login") do
    @home.acessar
    @nav.vai_para_login
    @login.faz_login("contoso@ninjahouse.com.br", "123456")
end

After do |scenario|

    tira_print(scenario)    

    tem = page.has_css?("#userMenu")
   
    if tem
        visit "/sair"
        wait_until_css(".swal2-modal") 
    end

end

# After("@logout") do
    # @nav.sair
    # visit "/sair"
    # wait_until_css(".swal2-modal")
# end

def tira_print(scenario)
    nome = scenario.name.gsub(/[^A-Za-z0-9 ]/, "")
    nome = nome.tr(" ", "_").downcase!
    screenshot = "log/screenshots/#{nome}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, "image/png", "Tá aqui o print :)")
end

def wait_until_css(element, time_out = Capybara.default_max_wait_time)
    found = true

    while found == true
        sleep 1
        raise Timeout::Error, "Time out of wait until css" + element if time_out.zero?
        found = page.has_css?(element)
        time_out -= 1
    end
end
