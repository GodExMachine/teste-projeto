package modelo.dao.evento;

import modelo.entidade.evento.Evento;
import java.sql.SQLException;
import java.util.List;

public interface EventoDao {
    Long inserirEvento(Evento evento) throws SQLException;
    Evento buscarPorId(Long id) throws SQLException;
    List<Evento> listarPorUsuario(Long idUsuario) throws SQLException;
    List<Evento> listarEventos() throws SQLException;
}
