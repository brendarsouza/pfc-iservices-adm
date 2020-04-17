<%-- 
    Document   : ListarProf
    Created on : 05/10/2016, 18:21:17
    Author     : brenda
--%>


<%@page import="Model.Profissao"%>
<%@page import="Model.Endereco"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Sexo"%>
<%@page import="java.util.List"%>
<%@page import="Model.Administrador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sexo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ISERVICES - Editar Administrador</title>
        <link rel="icon" type="image/png" href="imagens/logo2.png"/>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="admtle/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="admtle/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="admtle/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="admtle/AdminLTE.min.css">
        <link rel="stylesheet" href="admtle/skin-yellow.css">
        <link rel="stylesheet" href="admtle/skin-yellow.min.css">
        <link rel="stylesheet" href="admtle/skin-yellow-light.min.css">

        <!-- Google Font -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>

    <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |
    |               | sidebar-mini                            |
    |---------------------------------------------------------|
    -->
    <body class="hold-transition skin-yellow-light sidebar-mini">
        <%

            Administrador administrador1 = (Administrador) session.getAttribute("administrador");
            Usuario usuario = (Usuario) session.getAttribute("usuarioAutenticado");
            Administrador administrador = (Administrador) request.getAttribute("editarPessoa");

        %>
        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">

                <!-- Logo -->
                <a href="index.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b><img src="imagens/logo2.png" style="height:40px; width: 40px;" class="img-thumbnail" alt="ISERVICES"></b></span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b><img src="imagens/icone2.png" style="height:48px; width: 170px; align-self: center;"class="img-lg" alt="ISERVICES"></b></span>
                </a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                        <span class="sr-only">Navega��o</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu" style="padding-top: 5%;">
                                <form action="./perfilAdministrador" method="post"> 
                                    <input type="text" name="txtIdAdministrador" value="<%=administrador.getId()%>" hidden>
                                    <button type="submit" name="AreaAdministrador" class="btn btn-warning"><i class="fa fa-home"></i>
                                    </button>
                                </form>
                            </li>
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="imagens/user-login2.png" class="user-image" alt="User Image">
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"><%=administrador.getNome()%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="imagens/user-login2.png" class="img-circle" alt="User Image">

                                        <p> 
                                            <%=administrador.getNome()%> <%=administrador.getSobrenome()%>
                                            <small><%=administrador.getUsuario().getEmail()%></small> 
                                        </p>
                                    </li>
                                    <!-- Menu Body -->

                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="./editarAdministrador?idEditar=<%= administrador.getId()%>" class="btn btn-default btn-flat"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Editar Perfil</a>
                                        </div>

                                        <div class="pull-right">
                                            <a href="Login/LogoutAdministrador.jsp" class="btn btn-default btn-flat"><i class="fa fa-power-off" aria-hidden="true"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <!-- Control Sidebar Toggle Button -->
                            <li>
                                <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="imagens/user-login.png" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><%=administrador.getNome()%></p>
                            <p><small><%=administrador.getUsuario().getEmail()%></small></p>
                        </div>
                    </div>
                    <center><form action="./perfilAdministrador" method="post"> 
                            <input type="text" name="txtIdAdministrador" value="<%=administrador.getId()%>" hidden>
                            <button type="submit" name="AreaAdministrador" class="btn btn-default" style="width: 100%;"><i class="fa fa-home"></i>
                            </button>
                        </form></center>

                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <br/>
                        <li class="header"><h5>Fun��es</h5></li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-briefcase text-aqua"></i> <span>Profiss�es</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="./novaProfissao?idAdm=<%=administrador.getId()%>">Nova Profissao </a></li>
                                <li><a href="./consultarTodasProfissoes">Consultar Profiss�es </a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-tag text-blue"></i> <span>Categoria de Profiss�o</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="./Categoria/NovaCategoria.jsp">Nova Categoria </a></li>
                                <li><a  href="./consultarTodasCategorias">Consultar Categorias </a></li>
                            </ul>
                        </li>

                        <li class="treeview">
                            <a href="#"><i class="fa fa-users text-olive"></i> <span>Relat�rios</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="./consultarTodosUsuarios">Relat�rio de Usu�rios</a></li>
                            </ul>
                        </li>
                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Editar Perfil
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="./index.jsp"><i class="fa fa-dashboard"></i> ISERVICES</a></li>
                        <li class="active">Editar Perfil</li>
                    </ol>
                </section>



                <section class="content">

                    <form action="./editarAdministrador" method="post">
                        <div class="container">
                            <center><h1>EDITE SEUS DADOS</h1></center>
                            <hr>
                            <input type="text" hidden id="idUsuario" name="txtIdUsuario"  value="<%= administrador.getUsuario().getId()%>">
                            <input type="text"  hidden id="idEndereco" name="txtIdEndereco"  value="<%= administrador.getEndereco().getId()%>">
                            <input type="text"  hidden id="idAdministrador" name="txtIdAdministrador"  value="<%= administrador.getId()%>">

                            <h5>Dados da Conta (Usuario)</h5>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="nome">Nome: </label>
                                    <input type="name" class="form-control" id="nome" name="txtNome"  value="<%= administrador.getNome()%>">
                                </div>
                                <div class="col-sm-6">
                                    <label>Sobrenome: </label>
                                    <input type="name" class="form-control" id="sobrenome" name="txtSobrenome" value="<%= administrador.getSobrenome()%>">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <label for="nome">Data de Nascimento:</label>
                                    <input type="date" class="form-control" id="dataNascimento" name="txtDataNascimento" value="<%= administrador.getDataNascimento()%>">
                                </div>
                                <div class="col-sm-4">
                                    <label for="telefone">Telefone:</label>
                                    <input type="text" class="form-control" id="email" maxlength=10 name="txtTelefone" value="<%= administrador.getTelefone()%>">
                                </div>
                                <div class="col-sm-4">
                                    <label for="nome">Celular:</label>
                                    <input type="name" class="form-control" id="celular" maxlength=11 name="txtCelular" value="<%= administrador.getCelular()%>">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="nome">Email:</label>
                                    <input type="email" class="form-control" id="email" name="txtEmail" value="<%= administrador.getUsuario().getEmail()%>">
                                </div>      
                                <%
                                    if (administrador.getSexo() == Sexo.FEMININO) {
                                %>
                                <div class="col-sm-6" >
                                    <br>
                                    <label for="nome">Sexo:</label>
                                    <select name="txtSexo" id="sexo" class="btn btn-primary dropdown-toggle" required>
                                        <option value="">Selecione</option>
                                        <option value="FEMININO" selected="selected" label="Feminino">
                                            Feminino
                                        </option>
                                        <option value="MASCULINO" label="Masculino">
                                            Masculino
                                        </option>
                                    </select> 
                                </div>
                                <%
                                } else {
                                %>
                                <div class="col-sm-6" >
                                    <br>
                                    <label for="nome">Sexo:</label>
                                    <select name="txtSexo" id="sexo" class="btn btn-primary dropdown-toggle" required>
                                        <option value="">Selecione</option>
                                        <option value="FEMININO" label="Feminino">
                                            Feminino
                                        </option>
                                        <option value="MASCULINO" selected="selected" label="Masculino">
                                            Masculino
                                        </option>
                                    </select> 
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <%
                                if (administrador.getCpf() == null) {
                            %>
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="nome">Raz�o Social: </label>
                                    <input type="name" class="form-control" id="nomeFasia" name="txtRazaoSocial" value=<%= administrador.getRazaoSocial()%>>
                                </div> 
                                <div class="col-sm-6">
                                    <label for="nome">CNPJ:</label>
                                    <input type="name" class="form-control" id="cnpj" name="txtCNPJ" value=<%= administrador.getCnpj()%>>
                                </div>
                            </div>

                            <%
                            } else {
                            %>

                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="nome">CPF:</label>
                                    <input type="name" class="form-control" id="cpf" name="txtCPF" maxlength=11 value="<%= administrador.getCpf()%>" >
                                </div> 
                                <div class="col-sm-6">
                                    <label for="nome">RG:</label>
                                    <input type="name" class="form-control" id="rg" name="txtRG" maxlength=9 value="<%= administrador.getRg()%>">
                                </div>
                            </div>

                            <% }%> 

                            
                            <hr>
                            <div class="row">
                                <div class="col-sm-2">
                                    <label for="nome">CEP</label>
                                    <input type="name" class="form-control" id="CEP" maxlength=8 name="txtCEP" value="<%= administrador.getEndereco().getCep()%>">
                                </div>
                                <div class="col-sm-6">
                                    <label forl="nome">Rua</label>
                                    <input type="name" class="form-control" id="Rua" name="txtRua"  value="<%= administrador.getEndereco().getRua()%>">
                                </div>
                                <div class="col-sm-1">
                                    <label for="nome">Numero</label>
                                    <input type="name" class="form-control" id="Numero" name="txtNumero" value="<%= administrador.getEndereco().getNumero()%>">
                                </div>
                                <div class="col-sm-3">
                                    <label for="nome">Complemento</label>
                                    <input type="name" class="form-control" id="Complemento" name="txtComplemento"  value="<%= administrador.getEndereco().getComplemento()%>">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <label for="nome">Bairro</label>
                                    <input type="name" class="form-control" id="Bairro" name="txtBairro" value="<%= administrador.getEndereco().getBairro()%>">
                                </div>
                                <div class="col-sm-3">
                                    <label for="nome">Cidade</label>
                                    <input type="name" class="form-control" id="Cidade" name="txtCidade" value="<%= administrador.getEndereco().getCidade()%>">
                                </div>
                                <div class="col-sm-3">
                                    <label for="nome">Estado</label>
                                    <input type="name" class="form-control" id="Estado" name="txtEstado" value="<%= administrador.getEndereco().getEstado()%>">
                                </div>
                                <div class="col-sm-3">
                                    <label for="nome">Pa�s</label>
                                    <input type="name" class="form-control" id="Pais" name="txtPais" value="<%= administrador.getEndereco().getPais()%>">
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-4">
                                    <input  type="submit" class="btn btn-success center-block"  id="btnSalvar"  value="Salvar">                        
                                </div>
                            </div>
                        </div>
                        </div>
                    </form>

                </section>
            </div>

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <center><div class="pull-center hidden-sm">
                        Brenda Renata & Leticia Youssef <br/>
                    </div>
                    <!-- Default to the left -->
                    <strong>ISERVICES | 2017.</strong></center>
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-light">
                <!-- Create the tabs -->
                <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
                    <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
                    <!--<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>-->
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- Home tab content -->
                    <div class="tab-pane active" id="control-sidebar-home-tab">

                        <!--Editar Perfil-->
                        <h3 class="control-sidebar-heading">Configura��es</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="./editarAdministrador?idEditar=<%= administrador.getId()%>" >
                                    <i class="menu-icon fa fa-pencil-square-o bg-aqua"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Editar Perfil</h4>
                                    </div>
                                </a>
                            </li>
                        </ul>

                        <!--Desativar conta-->

                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="Administrador/ConfirmarInativacao.jsp">
                                    <i class="menu-icon fa fa-power-off bg-red"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">Desativar Conta</h4>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <!-- /.control-sidebar-menu -->


                    </div>

                </div>
            </aside>
            <!-- /.control-sidebar -->
            <!-- Add the sidebar's background. This div must be placed
            immediately after the control sidebar -->
            <div class="control-sidebar-bg"></div>
        </div>
        <!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 3 -->
        <script src="admtle/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="admtle/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="admtle/adminlte.min.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>