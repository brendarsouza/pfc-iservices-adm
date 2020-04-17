/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoriaProfissaoDAO;
import DAO.ProfissaoDAO;
import Model.CategoriaProfissao;
import Model.Profissao;
import Model.Status_Categoria;
import Model.Status_Profissao;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProfissaoControle", urlPatterns = {"/ProfissaoControle", "/cadastrarProfissao", "/editarProfissao", "/consultarTodasProfissoes"})
public class ProfissaoControle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/cadastrarProfissao")) {

            cadastrar(request, response);

        } else if (uri.equals(request.getContextPath() + "/editarProfissao")) {

            editar(request, response);

        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (request.getParameter("idEditar") != null) {
            ProfissaoDAO profissaoDAO = new ProfissaoDAO();
            request.setAttribute("editarProfissao", profissaoDAO.consultarPorId(Integer.parseInt(request.getParameter("idEditar"))));
            request.getRequestDispatcher("Profissao/EditarProfissao.jsp").forward(request, response);
        } else if (uri.equals(request.getContextPath() + "/consultarTodasProfissoes")) {
            try {
                consultarTodasProfissoes(request, response);
            } catch (Exception ex) {
                Logger.getLogger(ProfissaoControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Profissao profissao = new Profissao();
        CategoriaProfissao categoriaProfissao = new CategoriaProfissao();
        categoriaProfissao.setId(Integer.parseInt(request.getParameter("idcategoria")));
        profissao.setProfissaoNome(request.getParameter("txtNomeProfissao"));
        profissao.setStatusProfissao(Status_Profissao.ATIVO);

        profissao.setCategoria(categoriaProfissao);

        ProfissaoDAO profissaoDAO = new ProfissaoDAO();
        profissaoDAO.cadastrar(profissao);

        response.sendRedirect("Profissao/ConfirmacaoCadastroProfissao.jsp");

    }

    public void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Profissao profissao = new Profissao();
        profissao.setId(Integer.parseInt(request.getParameter("txtIdProfissao")));

        profissao.setProfissaoNome(request.getParameter("txtProfissaoNome"));
        String status = request.getParameter("txtStatus");
        if ("ATIVO".equals(status)) {
            profissao.setStatusProfissao(Status_Profissao.ATIVO);
        } else {
            profissao.setStatusProfissao(Status_Profissao.INATIVO);
        }
        int idCategoria = Integer.parseInt(request.getParameter("txtIdCategoria"));
        CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
        CategoriaProfissao categoria = categoriaDAO.getById(idCategoria);
        profissao.setCategoria(categoria);

        ProfissaoDAO profissaoDAO = new ProfissaoDAO();
        profissaoDAO.atualizar(profissao);

        response.sendRedirect("Profissao/ConfirmacaoEdicao.jsp");

    }

    public void consultarTodasProfissoes(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception, Exception {

        ProfissaoDAO profissaoDAO = new ProfissaoDAO();

        List<Profissao> profissoes = profissaoDAO.buscarTodos();

        request.setAttribute("profissoes", profissoes);

        // response.sendRedirect("Categoria/ListasCategoria.jsp");
        request.getRequestDispatcher("Profissao/ListasProfissao.jsp").forward(request, response);
    }

}
