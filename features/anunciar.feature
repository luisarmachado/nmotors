#language: pt

Funcionalidade: Anunciar meu carro
    Para que eu possa receber ofertas de compras
    Sendo um usuário cadastrado
    Posso anunciar meu veículo

    #Não usar Esquema do Cenário

    # Se o usuário não selecionar a marca,
    # deve exibir a mensagem "Selecione a marca do seu carro."

    # Se o usuário não selecionar o modelo,
    # deve exibir a mensagem "Selecione o modelo do seu carro."

    # Se o usuário não selecionar a versão,
    # deve exibir a mensagem "Selecione a versão do seu carro."

    # Se o usuário não selecionar o ano,
    # deve exibir a mensagem "Selecione o ano do seu carro."

    # Se o usuário não informar o preço,
    # deve exibir a mensagem "Informe o preço do seu carro."


    Contexto: Formulário de anúncio
        Dado que acessei o formulário de anúncio de veículos

    @login @smoke
    Cenário: Criar anúncio 

        E que possuo o seguinte veículo
            | marca    | modelo | versao  | ano     | preco     |
            |Chevrolet | Camaro | Blue 79 | 1979    | 250.000,00| 
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
        """
        Parabéns. Seu carro foi anunciado com sucesso.
        """

    @login
    Cenário: Carro blindado
        E que possuo o seguinte veículo
            | marca    | modelo | versao  | ano     | preco     |
            |Honda     | Fit    | CVT     | 2012    | 30.000,00 | 
            E este veículo é blindado
            Quando faço o anúncio deste veículo
            Então devo ver a seguinte mensagem:
            """
            Não vendemos carro blindado.
            """

    @login @temp
    Cenário: Anuncio duplicado

        E que possuo o seguinte veículo
            | marca    | modelo | versao        | ano     | preco    |
            |Ford      | Fusion | 2.4 automátco | 2016    | 70.000,00| 
        Mas eu já cadastrei este anúncio anteriormente
        Quando faço o anúncio deste veículo
        Então devo ver a seguinte mensagem:
            """
            Este anúncio já foi cadastrado.
            """

