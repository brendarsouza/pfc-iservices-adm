/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoriaProfissaoDAO;
import Model.CategoriaProfissao;
import Model.Status_Categoria;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author brenda
 */
@WebServlet(name = "CategoriaProfissaoControle", urlPatterns = {"/CategoriaProfissaoControle", "/cadastrarCategoria", "/editarCategoria", "/novaProfissao", "/consultarCategoria", "/consultarTodasCategorias", "/inativarCategoria"})
public class CategoriaProfissaoControle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/cadastrarCategoria")) {

            cadastrar(request, response);

        } else if (uri.equals(request.getContextPath() + "/editarCategoria")) {

            editar(request, response);

        }else if (uri.equals(request.getContextPath() + "/novaProfissao")) {
            
            novaProfissao(request, response);

         } else if (uri.equals(request.getContextPath() + "/inativarCategoria")) {

            inativarCategoria(request, response);
         }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/consultarCategoria")) {
            try {
                consultarCategoria(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(CategoriaProfissaoControle.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(CategoriaProfissaoControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/consultarTodasCategorias")) {
            try {
                consultarTodasCategorias(request, response);
            } catch (Exception ex) {
                Logger.getLogger(CategoriaProfissaoControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        try {
            if (request.getParameter("idAdm") != null) {
                CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
                request.setAttribute("novaProfissao", categoriaDAO.buscarTodos());
                request.getRequestDispatcher("Profissao/NovaProfissao.jsp").forward(request, response);
            }else if (request.getParameter("idEditar") != null) {
                CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
                request.setAttribute("categoria", categoriaDAO.getById(Integer.parseInt(request.getParameter("idEditar"))));
                request.getRequestDispatcher("Categoria/EditarCategoria.jsp").forward(request, response);
            }else if (request.getParameter("idInativar") != null) {
                CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
                request.setAttribute("categoria", categoriaDAO.getById(Integer.parseInt(request.getParameter("idInativar"))));
                request.getRequestDispatcher("Categoria/InativarCategoria.jsp").forward(request, response);
            }
        } catch (IOException | NumberFormatException | ServletException ex) {
            Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(500, "ERRO! Não consegui completar a operação.");
        }

    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CategoriaProfissao categoria = new CategoriaProfissao();

        categoria.setCategoriaNome(request.getParameter("txtCategoria"));
        categoria.setStatusCategoria(Status_Categoria.ATIVO);

        CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
        categoriaDAO.cadastrar(categoria);

        response.sendRedirect("Categoria/ConfirmacaoCadastroCategoria.jsp");

    }

    public void editar(HttpServletRequest request, HttpServletResponse response) throws IOException {

        CategoriaProfissao categoria = new CategoriaProfissao();
        categoria.setId(Integer.parseInt(request.getParameter("txtIdCategoria")));
        categoria.setCategoriaNome(request.getParameter("txtCategoria"));
        String status = request.getParameter("txtStatus");
        if ("ATIVO".equals(status)) {
            categoria.setStatusCategoria(Status_Categoria.ATIVO);
        } else {
         categoria.setStatusCategoria(Status_Categoria.INATIVO);
        }

        CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
        categoriaDAO.atualizar(categoria);

        response.sendRedirect("Categoria/ConfirmacaoEdicao.jsp");

    }
    
    public void inativarCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException {

         CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
        
        int idCategoria = Integer.parseInt(request.getParameter("txtIdCategoria"));
        CategoriaProfissao categoria = categoriaDAO.getById(idCategoria);
        categoria.setCategoriaNome(request.getParameter("txtCategoria"));
        String status = request.getParameter("txtStatus");
        if ("ATIVO".equals(status)) {
            categoria.setStatusCategoria(Status_Categoria.ATIVO);
        } else {
         categoria.setStatusCategoria(Status_Categoria.INATIVO);
        }

        categoriaDAO.atualizar(categoria);

        response.sendRedirect("Categoria/ConfirmacaoInativacao.jsp");

    }
    
    public void novaProfissao(HttpServletRequest request, HttpServletResponse response) throws IOException {

        CategoriaProfissao categoria = new CategoriaProfissao();
        categoria.setId(Integer.parseInt(request.getParameter("txtIdCategoria")));
        categoria.setCategoriaNome(request.getParameter("txtCategoria"));

        CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
        categoriaDAO.cadastrar(categoria);

        response.sendRedirect("Profissao/NovaProfissao.jsp");

    }
    
    public void consultarTodasCategorias(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception, Exception {

        CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
        
        List<CategoriaProfissao> categorias = categoriaDAO.buscarTodos();
        
        request.setAttribute("categorias", categorias);

       // response.sendRedirect("Categoria/ListasCategoria.jsp");
       request.getRequestDispatcher("Categoria/ListasCategoria.jsp").forward(request, response);
    }
    
     public void consultarCategoria(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, ParseException {
//        Recupera o valor recebido no formulário e atribui na variável profissaoPesquisada
        String categoria = request.getParameter("txtCategoria");
       CategoriaProfissaoDAO categoriaDAO = new CategoriaProfissaoDAO();
//fazer uma consulta com o id do profissional
        String ordenacao = request.getParameter("txtOrdenacao");

        if ("A-Z".equals(ordenacao)) {
            try {
            
                List<CategoriaProfissao> categorias = categoriaDAO.buscarCategoriaAZ(categoria);
                request.setAttribute("categorias", categorias);
                request.getRequestDispatcher("Categoria/ListarCategoria.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(CategoriaProfissaoControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("Z-A".equals(ordenacao)) {
            try {
               List<CategoriaProfissao> categorias = categoriaDAO.buscarCategoriaZA(categoria);
                request.setAttribute("categorias", categorias);
                request.getRequestDispatcher("Categoria/ListarCategoria.jsp").forward(request, response);
            } catch (Exception ex) {
                Logger.getLogger(CategoriaProfissaoControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}
