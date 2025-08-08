package modelo.dao.endereco;

import modelo.entidade.endereco.Endereco;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EnderecoDaoImpl implements EnderecoDao {

	public Long inserirEndereco(Endereco endereco) throws SQLException {
	    Connection conexao = null;
	    PreparedStatement insert = null;
	    ResultSet chavePrimariaEndereco = null;
	    Long idGerado = null;

	    try {
	        conexao = conectarBanco();
	        insert = conexao.prepareStatement(
	            "INSERT INTO endereco (logradouro_endereco, numero_endereco, complemento_endereco, bairro_endereco, cidade_endereco, estado_endereco, cep_endereco) VALUES (?, ?, ?, ?, ?, ?, ?)",
	            Statement.RETURN_GENERATED_KEYS
	        );

	        insert.setString(1, endereco.getLogradouro());
	        insert.setString(2, endereco.getNumero());
	        insert.setString(3, endereco.getComplemento());
	        insert.setString(4, endereco.getBairro());
	        insert.setString(5, endereco.getCidade());
	        insert.setString(6, endereco.getEstado());
	        insert.setString(7, endereco.getCep());
	        System.out.println("Endereço salvo!");
	        insert.executeUpdate();

	        chavePrimariaEndereco = insert.getGeneratedKeys();

	        if (chavePrimariaEndereco.next()) {
	            idGerado = chavePrimariaEndereco.getLong(1);
	            endereco.setId(idGerado);
	        }
	    } finally {
	        if (chavePrimariaEndereco != null) chavePrimariaEndereco.close();
	        if (insert != null) insert.close();
	        if (conexao != null) conexao.close();
	    }

	    return idGerado;
	}


    public void deletarEndereco(Long idEndereco) throws SQLException {
        Connection conexao = null;
        PreparedStatement delete = null;

        try {
            conexao = conectarBanco();
            delete = conexao.prepareStatement("DELETE FROM endereco WHERE id_endereco = ?");
            delete.setLong(1, idEndereco);
            delete.executeUpdate();
        } finally {
            if (delete != null) delete.close();
            if (conexao != null) conexao.close();
        }
    }

    public void atualizarEndereco(Endereco endereco) throws SQLException {
        Connection conexao = null;
        PreparedStatement update = null;

        try {
            conexao = conectarBanco();
            update = conexao.prepareStatement(
                "UPDATE endereco SET logradouro_endereco = ?, numero_endereco = ?, complemento_endereco = ?, bairro_endereco = ?, cidade_endereco = ?, estado_endereco = ?, cep_endereco = ? WHERE id_endereco = ?"
            );

            update.setString(1, endereco.getLogradouro());
            update.setString(2, endereco.getNumero());
            update.setString(3, endereco.getComplemento());
            update.setString(4, endereco.getBairro());
            update.setString(5, endereco.getCidade());
            update.setString(6, endereco.getEstado());
            update.setString(7, endereco.getCep());
            update.setLong(8, endereco.getId());

            update.executeUpdate();
        } finally {
            if (update != null) update.close();
            if (conexao != null) conexao.close();
        }
    }

    private Connection conectarBanco() throws SQLException {
    	try {
    	    Class.forName("com.mysql.cj.jdbc.Driver");
    	} catch (ClassNotFoundException e) {
    	    e.printStackTrace();
    	}
    	return DriverManager.getConnection("jdbc:mysql://localhost/projeto?user=root&password=root&serverTimezone=America/Sao_Paulo");
    }

}
