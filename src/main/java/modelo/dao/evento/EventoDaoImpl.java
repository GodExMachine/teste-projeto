package modelo.dao.evento;

import modelo.entidade.evento.Evento;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EventoDaoImpl implements EventoDao {

	public Long inserirEvento(Evento evento) throws SQLException {
	    System.out.println("Inserindo evento: " + evento.getComentario());
	    String sql = "INSERT INTO evento (id_usuario, id_endereco, data_evento, comentario) VALUES (?, ?, ?, ?)";
	    try (Connection con = conectarBanco();
	         PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

	        stmt.setLong(1, evento.getIdUsuario());
	        stmt.setLong(2, evento.getIdEndereco());
	        stmt.setDate(3, Date.valueOf(evento.getDataEvento()));
	        stmt.setString(4, evento.getComentario());

	        int linhas = stmt.executeUpdate();
	        System.out.println("Linhas afetadas: " + linhas);

	        try (ResultSet rs = stmt.getGeneratedKeys()) {
	            if (rs.next()) {
	                Long idGerado = rs.getLong(1);
	                evento.setId(idGerado);
	                System.out.println("ID gerado: " + idGerado);
	                return idGerado;
	            }
	        }
	    }
	    System.out.println("Falha ao inserir evento.");
	    return null;
	}


	public Evento buscarPorId(Long id) throws SQLException {
		String sql = "SELECT * FROM evento WHERE id_evento = ?";
		Evento evento = null;
		try (Connection con = conectarBanco(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setLong(1, id);
			try (ResultSet rs = stmt.executeQuery()) {
				if (rs.next()) {
					evento = new Evento(rs.getLong("id_evento"), rs.getLong("id_usuario"), rs.getLong("id_endereco"),
							// Converte java.sql.Date para LocalDate
							rs.getDate("data_evento").toLocalDate(), rs.getString("comentario"));
				}
			}
		}
		return evento;
	}

	public List<Evento> listarEventos() throws SQLException {
		String sql = "SELECT * FROM evento";
		List<Evento> eventos = new ArrayList<>();
		try (Connection con = conectarBanco();
				PreparedStatement stmt = con.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery()) {
			while (rs.next()) {
				Evento evento = new Evento(rs.getLong("id_evento"), rs.getLong("id_usuario"), rs.getLong("id_endereco"),
						rs.getDate("data_evento").toLocalDate(), rs.getString("comentario"));
				eventos.add(evento);
			}
		}
		return eventos;
	}

	public List<Evento> listarPorUsuario(Long idUsuario) throws SQLException {
		String sql = "SELECT * FROM evento WHERE id_usuario = ?";
		List<Evento> eventos = new ArrayList<>();
		try (Connection con = conectarBanco(); PreparedStatement stmt = con.prepareStatement(sql)) {

			stmt.setLong(1, idUsuario);
			try (ResultSet rs = stmt.executeQuery()) {
				while (rs.next()) {
					Evento evento = new Evento(rs.getLong("id_evento"), rs.getLong("id_usuario"),
							rs.getLong("id_endereco"), rs.getDate("data_evento").toLocalDate(),
							rs.getString("comentario"));
					eventos.add(evento);
				}
			}
		}
		return eventos;
	}

	private Connection conectarBanco() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return DriverManager.getConnection(
				"jdbc:mysql://localhost/projeto?user=root&password=root&serverTimezone=America/Sao_Paulo");
	}
}
