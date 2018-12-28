#support --> env.rb: quando rodo o cucumber, tudo que está no env.rb acontece primeiro.


require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"

@browser = ENV["BROWSER"]

if @browser.eql?("headless")
    Capybara.javascript_driver = :selenium
    Capybara.run_server = false

    caps = Selenium::WebDriver::Remote::Capabilities.chrome(
        "chromeOptions" => {
            "args" => ["--no-default-browser-check"]
        }
    )

    Capybara.register_driver :selenium do |app|
        Capybara::Selenium::Driver.new(
            app,
            browser: :remote,
            url: "http://localhost:4444/wd/hub",
            desired_capabilities: caps
        )
    end
end

Capybara.configure do |c|     #|c| : variável de configuração

    if @browser.eql?("headless")
        c.default_driver = :selenium
    elsif @browser.eql?("chrome")
        c.default_driver = :selenium_chrome
    end

    c.app_host = "https://ninjamotors.herokuapp.com"
    c.default_max_wait_time = 10    # espera até 10 segundos, diferente do sleep
end