package controle.servlet;

import modelo.dao.evento.EventoDao;
import modelo.dao.evento.EventoDaoImpl;
import modelo.entidade.evento.Evento;
import modelo.entidade.endereco.Endereco;
import modelo.dao.endereco.EnderecoDao;
import modelo.dao.endereco.EnderecoDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(urlPatterns = {"/novo-evento", "/inserir-evento"})
public class EventoServlet extends HttpServlet {

    private EventoDao eventoDao;
    private EnderecoDao enderecoDao;

    public void init() {
        eventoDao = new EventoDaoImpl();
        enderecoDao = new EnderecoDaoImpl();
    }

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

  
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

        // Criar objeto Endereco com os dados do form
    	String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String complemento = request.getParameter("complemento");
		String cep = request.getParameter("cep");

		// cria o endereço
		Endereco endereco = new Endereco(null, logradouro, numero, complemento, bairro, cidade, estado, cep);

		// insere o endereço e pega o ID gerado
		Long idEndereco = enderecoDao.inserirEndereco(endereco);

        // do evento
        LocalDate dataEvento = LocalDate.parse(request.getParameter("dataEvento"));
        String comentario = request.getParameter("comentario");

        Evento evento = new Evento(idUsuario, idEndereco, dataEvento, comentario);

        eventoDao.inserirEvento(evento);

        response.sendRedirect("index.jsp");
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