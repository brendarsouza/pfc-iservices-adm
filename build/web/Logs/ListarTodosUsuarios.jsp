<%-- 
    Document   : ListarProf
    Created on : 05/10/2016, 18:21:17
    Author     : brenda
--%>


<%@page import="Model.Logs"%>
<%@page import="Model.Profissao"%>
<%@page import="Model.Endereco"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Sexo"%>
<%@page import="java.util.List"%>
<%@page import="Model.Administrador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Sexo"%>
<%@page import="java.util.List"%>
<%@page import="Model.CategoriaProfissao"%>
<%@page import="Model.PerfilAcesso"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ISERVICES - Listas de Logs Todos Usuários</title>
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

            Administrador administrador = (Administrador) session.getAttribute("administrador");

            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listarTodosUsuarios");


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
                        <span class="sr-only">Navegação</span>
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
                                            <a href="./Login/LogoutAdministrador.jsp" class="btn btn-default btn-flat"><i class="fa fa-power-off" aria-hidden="true"></i></a>
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
                        <li class="header"><h5>Funções</h5></li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-briefcase text-aqua"></i> <span>Profissões</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="./novaProfissao?idAdm=<%=administrador.getId()%>">Nova Profissao </a></li>
                                <li><a href="./consultarTodasProfissoes">Consultar Profissões </a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#"><i class="fa fa-tag text-blue"></i> <span>Categoria de Profissão</span>
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
                            <a href="#"><i class="fa fa-users text-olive"></i> <span>Relatórios</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="./consultarTodosUsuarios">Relatório de Usuários</a></li>
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

                    <ol class="breadcrumb">
                        <li><a href="./index.jsp"><i class="fa fa-dashboard"></i> ISERVICES</a></li>
                        <li class="active">Cadastro de Profissão</li>
                    </ol>
                </section>



                <section class="content">

                    <div class="container-fluid">


                        <br>
                        <center>
                            <h1>
                                Lista de Usuários
                            </h1>
                        </center>

                        <hr/>
                        <div class="row">
                            <!-- left column -->
                            <div class="col-md-12">
                                <!-- general form elements -->
                                <div class="box box-primary">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Buscar Usuários</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <!-- form start -->
                                    <form action="./consultarUsuarios" method="get">
                                        <div class="container-fluid" style="padding-bottom: 15px">
                                            <div class="row">
                                                <div class="col-sm-10" >
                                                    <label for="nome">Escreva o email do usuario:</label>
                                                    <input type="search" class="form-control" name="txtEmailUsuario"/>
                                                </div> 

                                                <div class="col-sm-2">
                                                    <br/>
                                                    <!--<input class="btn btn-default" type="submit" value="Pesquisar"/> <br />--> 
                                                    <button class="btn btn-info" type="submit">
                                                        <i class="fa fa-search img-circle text-default"></i> 
                                                    </button>
                                                </div>
                                                
                                            </div>
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--/.col (right) -->
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Usuários do Sistema</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>E-mail</th>
                                                <th>Perfil</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>


                                            
                                                <% for (Usuario usuario : usuarios) {%>
                                                <tr>
                                                <td><%= usuario.getEmail()%></td>
                                                <td><%= usuario.getPerfilAcesso()%></td>
                                                <td><%= usuario.getStatus()%></td>
                                                <td><center><button class="btn btn-success" type="button">
                                                    <a href="./consultarLogs?idUsuario=<%= usuario.getId()%>" style="color: white"><i class="fa fa-bar-chart img-circle text-default"></i> Consultar Logs</a>
                                                </button></center></td>
                                                </tr>
                                                <%

                                                    }
                                                %>
                                            
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer clearfix">
                                        <ul class="pagination pagination-sm no-margin pull-right">

                                        </ul>
                                    </div>
                                </div>
                                <!-- /.box -->

                            </div>

                        </div>


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
                        <h3 class="control-sidebar-heading">Configurações</h3>
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
                                <a href="./Administrador/ConfirmarInativacao.jsp">
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
        <script src="./admtle/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="./admtle/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="./admtle/adminlte.min.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>