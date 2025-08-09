package controle.servlet;

import modelo.dao.evento.EventoDao;
import modelo.dao.evento.EventoDaoImpl;
import modelo.entidade.evento.Evento;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(urlPatterns = {"/novo-evento", "/inserir-evento", "/listar-eventos"})
public class EventoServlet extends HttpServlet {

    private EventoDao eventoDao;

    @Override
    public void init() {
        eventoDao = new EventoDaoImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/novo-evento":
                    mostrarTelaCadastroEvento(request, response);
                    break;

                case "/inserir-evento":
                    inserirEvento(request, response);
                    break;

                case "/listar-eventos":
                    listarEventos(request, response);
                    break;

                default:
                    mostrarTelaErro404(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void mostrarTelaCadastroEvento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("novo-evento.jsp");
        dispatcher.forward(request, response);
    }

    private void inserirEvento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        Long idUsuario = Long.parseLong(request.getParameter("idUsuario"));
        Long idEndereco = Long.parseLong(request.getParameter("idEndereco"));
        LocalDate dataEvento = LocalDate.parse(request.getParameter("dataEvento"));
        String comentario = request.getParameter("comentario");

        Evento evento = new Evento(idUsuario, idEndereco, dataEvento, comentario);

        eventoDao.inserirEvento(evento);

        response.sendRedirect("listar-eventos");
    }

    private void listarEventos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        request.setAttribute("eventos", eventoDao.listarEventos());
        RequestDispatcher dispatcher = request.getRequestDispatcher("listar-eventos.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarTelaErro404(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("erro404.jsp");
        dispatcher.forward(request, response);
    }
}
