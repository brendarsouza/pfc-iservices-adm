/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.LogsDAO;
import DAO.UsuarioDAO;
import Model.Logs;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brenda
 */
@WebServlet(name = "LogsController", urlPatterns = {"/LogsController", "/consultarUsuarios", "/consultarLogs", "/consultarTodosUsuarios"})
public class LogsController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*o request.getRequestURI(); pega a uri que está vindo do navegador e atribui na variavel uri*/
        String uri = request.getRequestURI();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*o request.getRequestURI(); pega a uri que está vindo do navegador e atribui na variavel uri*/
        String uri = request.getRequestURI();

        /*se a uri for igual a consultarProfissionais irá chamar o metodo consultarProfissionais*/
        if (uri.equals(request.getContextPath() + "/consultarUsuarios")) {

            try {
                consultarUsuarios(request, response);
                /*se a uri for igual a deletarProfissional irá chamar o metodo deletarProfissional*/
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/consultarLogs")) {
            try {
                consultarLogs(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getParameter("idUsuario") != null) {
            try {
                consultarLogs(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/consultarTodosUsuarios")) {
            try {
                consultarTodosUsuarios(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    /* Esse método é utilizado para buscar profissionais que atendem as profissoes pesquisadas por pessoas que não estão logadas*/
    public void consultarUsuarios(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        String emailUsuario = request.getParameter("txtEmailUsuario");

        LogsDAO logsDAO = new LogsDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        try {

            List<Usuario> listaUsuarios = usuarioDAO.consultarUsuarios(emailUsuario);
//            List<Usuario> listaTodosUsuarios = usuarioDAO.buscarTodos();

            request.setAttribute("listaUsuarios", listaUsuarios);
//            request.setAttribute("listaTodosUsuarios", listaTodosUsuarios);
            request.getRequestDispatcher("Logs/UsuariosLista.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void consultarTodosUsuarios(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException {

        LogsDAO logsDAO = new LogsDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        try {

            List<Usuario> listaTodosUsuarios = usuarioDAO.buscarTodos();
            request.setAttribute("listarTodosUsuarios", listaTodosUsuarios);

            request.getRequestDispatcher("Logs/ListarTodosUsuarios.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(LogsController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void consultarLogs(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, Exception {
        LogsDAO logsDAO = new LogsDAO();
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        request.setAttribute("logs", logsDAO.consultarLogs(idUsuario));
        /* direciona para a pagina de listagem de Pedidos*/
        request.getRequestDispatcher("Logs/ListarLogs.jsp").forward(request, response);
    }

}
