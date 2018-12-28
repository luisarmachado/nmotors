# MongoDB = banco de dados orientado a documentos - C++ - No SQL
# Não relacional - Documentos no formato JSON

require "mongo"

class DAO

    Mongo::Logger.logger = Logger.new("log/mongo.log")

    def remover_usuario(email)

        usuarios = client[:users]
        usuarios.delete_one("profile.email" => email)
   
    end


    def remover_anuncio(veiculo)

        anuncios = client[:sells]
        anuncios.delete_many(
            "brand" => veiculo[:marca], 
            "model" => veiculo[:modelo], 
            "desc" => veiculo[:versao]
        )

    end

    private

    def client

        str_conn = "mongodb://aluno:qaninja@ds117719.mlab.com:17719/ninjamotors"
        return Mongo::Client.new(str_conn)

    end

end


# SQL
# @usuario_id = (select usuario_id = @usuario_id)
# delete xpto where usuario_id = @usuario_id
# delete credito where usuario_id = @usuario_id
# delete pedidos where usuario_id = @usuario_id
# delete usuario where usuario_id = @usuario_id