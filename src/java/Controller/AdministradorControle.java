/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.AdministradorDAO;
import DAO.EnderecoDAO;
import DAO.LogsDAO;
import DAO.UsuarioDAO;
import Model.Administrador;
import Model.Endereco;
import Model.Logs;
import Model.PerfilAcesso;
import Model.Sexo;
import Model.Status;
import Model.Usuario;
import Util.Email;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "AdministradorControle", urlPatterns = {"/AdministradorControle", "/perfilAdministrador", "/cadastrarAdministrador", "/editarAdministrador"})
public class AdministradorControle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();

        if (uri.equals(request.getContextPath() + "/cadastrarAdministrador")) {
            try {
                cadastrar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/editarAdministrador")) {
            try {
                editar(request, response);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (uri.equals(request.getContextPath() + "/perfilAdministrador")) {
            perfilAdministrador(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uri = request.getRequestURI();
        try {
            if (request.getParameter("idEditar") != null) {
                AdministradorDAO administradorDAO = new AdministradorDAO();
                request.setAttribute("editarPessoa", administradorDAO.getById(Integer.parseInt(request.getParameter("idEditar"))));
                request.getRequestDispatcher("Administrador/EditarAdministrador.jsp").forward(request, response);
            }
        } catch (IOException | NumberFormatException | ServletException ex) {
            Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(500, "ERRO! Não consegui completar a operação.");
        }

    }

    public void cadastrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, ParseException, MessagingException {

        Usuario usuario = new Usuario();
        String emailUsuario = request.getParameter("txtEmail");
        usuario.setEmail(emailUsuario);
        String senha = request.getParameter("txtSenha");
        usuario.setSenha(Usuario.encryptBlowfish(senha, senha));
        usuario.setPerfilAcesso(PerfilAcesso.ADMINISTRADOR);
        usuario.setStatus(Status.ATIVO);
        Endereco endereco = new Endereco();

        endereco.setCep(request.getParameter("txtCEP"));
        endereco.setRua(request.getParameter("txtRua"));
        endereco.setNumero(request.getParameter("txtNumero"));
        endereco.setComplemento(request.getParameter("txtComplemento"));
        endereco.setBairro(request.getParameter("txtBairro"));
        endereco.setCidade(request.getParameter("txtCidade"));
        endereco.setEstado(request.getParameter("txtEstado"));
        endereco.setPais(request.getParameter("txtPais"));

        Administrador administrador = new Administrador();
        administrador.setNome(request.getParameter("txtNome"));
        administrador.setSobrenome(request.getParameter("txtSobrenome"));
        String cpf = request.getParameter("txtCPF");
        administrador.setCpf(cpf);
        String rg = request.getParameter("txtRG");
        administrador.setRg(rg);
        administrador.setTelefone(request.getParameter("txtTelefone"));
        administrador.setCelular(request.getParameter("txtCelular"));

        String sexo = request.getParameter("txtSexo");
        if ("FEMININO".equals(sexo)) {
            administrador.setSexo(Sexo.FEMININO);
        } else {
            administrador.setSexo(Sexo.MASCULINO);
        }
        Date dataNasc = new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("txtDataNascimento"));

        Date dataAtual = new Date();
        boolean data;
        if (dataAtual.after(dataNasc)) {
            try {
                data = true;
                System.out.println("Correto! A data de nascimento está antes da data atual!");
                administrador.setDataNascimento(dataNasc);

                administrador.setUsuario(usuario);
                administrador.setEndereco(endereco);
                AdministradorDAO administradorDAO = new AdministradorDAO();
                List<Administrador> a = administradorDAO.verificarUnique(emailUsuario, cpf, rg);
                if (a.isEmpty()) {
                    EnderecoDAO enderecoDAO = new EnderecoDAO();
                    enderecoDAO.cadastrar(endereco);

                    UsuarioDAO usuarioDAO = new UsuarioDAO();
                    usuarioDAO.cadastrar(usuario);

                    administradorDAO.cadastrar(administrador);

                    Email email = new Email();
                    email.setNomeDestinatario(administrador.getNome());
                    email.setEmailDestinatario(administrador.getUsuario().getEmail());
                    email.setAssunto("Confirmação de Cadastro no ISERVICES");
                    email.setMensagem("Seu cadastro como Administrador foi confirmado!");
                    if (email.enviar()) {
                        response.getWriter().println("Enviado com sucesso");
                    } else {
                        response.getWriter().println("Nao enviou");
                    }

                    response.sendRedirect("CadastroRealizado.jsp");
                } else {
                    System.out.println("Erro! Dados duplicados.");
                    response.sendRedirect("ErroDadosDuplicados.jsp");

                }
            } catch (Exception ex) {
                Logger.getLogger(AdministradorControle.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Erro! Dados duplicados.");
                response.sendRedirect("ErroDadosDuplicados.jsp");
            }

        } else if (dataAtual.before(dataNasc)) {
            data = true;
            System.out.println("Erro! É impossível você nascer antes da data atual.");
            response.sendRedirect("ErroData.jsp");
        } else {
            System.out.println("Formato incorreto");
        }

    }

    public void editar(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException, ServletException, ParseException {

        int idUsuario = Integer.parseInt(request.getParameter("txtIdUsuario"));
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.getById(idUsuario);

        usuario.setEmail(request.getParameter("txtEmail"));
        usuario.setPerfilAcesso(PerfilAcesso.ADMINISTRADOR);
        usuario.setStatus(Status.ATIVO);

        int idEndereco = Integer.parseInt(request.getParameter("txtIdEndereco"));
        EnderecoDAO enderecoDAO = new EnderecoDAO();

        Endereco endereco = enderecoDAO.getById(idEndereco);

        endereco.setCep(request.getParameter("txtCEP"));
        endereco.setRua(request.getParameter("txtRua"));
        endereco.setNumero(request.getParameter("txtNumero"));
        endereco.setComplemento(request.getParameter("txtComplemento"));
        endereco.setBairro(request.getParameter("txtBairro"));
        endereco.setCidade(request.getParameter("txtCidade"));
        endereco.setEstado(request.getParameter("txtEstado"));
        endereco.setPais(request.getParameter("txtPais"));

        int idAdministrador = Integer.parseInt(request.getParameter("txtIdAdministrador"));
        AdministradorDAO administradorDAO = new AdministradorDAO();

        Administrador administrador = administradorDAO.getById(idAdministrador);
        administrador.setNome(request.getParameter("txtNome"));
        administrador.setSobrenome(request.getParameter("txtSobrenome"));
        administrador.setCpf(request.getParameter("txtCPF"));
        administrador.setRg(request.getParameter("txtRG"));
        administrador.setTelefone(request.getParameter("txtTelefone"));
        administrador.setCelular(request.getParameter("txtCelular"));
        Date dataNasc = new SimpleDateFormat("yyy-MM-dd").parse(request.getParameter("txtDataNascimento"));
        administrador.setDataNascimento(dataNasc);
        String sexo = request.getParameter("txtSexo");
        if ("FEMININO".equals(sexo)) {
            administrador.setSexo(Sexo.FEMININO);
        } else {
            administrador.setSexo(Sexo.MASCULINO);
        }

        administrador.setUsuario(usuario);
        administrador.setEndereco(endereco);

        enderecoDAO.atualizar(endereco);

        usuarioDAO.atualizar(usuario);

        administradorDAO.atualizar(administrador);

        request.getRequestDispatcher("Administrador/ConfirmacaoEdicao.jsp").forward(request, response);

    }

    public void perfilAdministrador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdministradorDAO administradorDAO = new AdministradorDAO();
        HttpSession sessaoUsuario = request.getSession();
        int a = Integer.parseInt(request.getParameter("txtIdAdministrador"));
        Administrador administrador = (Administrador) administradorDAO.getById(a);
        request.setAttribute("administrador", administrador);
        sessaoUsuario.setAttribute("administrador", administrador);

        Usuario usuario = administrador.getUsuario();

        Logs logs = new Logs();
        logs.setUsuario(usuario);
        Date dataLog = new Date();
        logs.setData(dataLog);
        logs.setEvento("Acesso ao Perfil do Administrador");
        logs.setDescricaoEvento("O usuário acessou a àrea do Administrador.");

        LogsDAO logsDAO = new LogsDAO();
        logsDAO.cadastrar(logs);

        RequestDispatcher rd = request.getRequestDispatcher("Administrador/PerfilAdministrador.jsp");

        rd.forward(request, response);

    }

}
