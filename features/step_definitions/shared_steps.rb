

# login.feature e cadastro.feature

Então("sou autenticado com sucesso") do
    # expect(page).to have_content @usuario[:nome]
    expect(@nav.menu_usuario.text).to eql @usuario[:nome]
end