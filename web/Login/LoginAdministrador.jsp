<%-- 
    Document   : AreaCliente
    Created on : 29/09/2017, 17:46:40
    Author     : brenda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ISERVICES - Login Administrador</title>
        <link rel="icon" type="image/png" href="imagens/logo2.png"/>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../admtle/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="../admtle/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="../admtle/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="../admtle/AdminLTE.min.css">
        <link rel="stylesheet" href="../admtle/skin-yellow.css">
        <link rel="stylesheet" href="../admtle/skin-yellow.min.css">
        <link rel="stylesheet" href="../admtle/skin-yellow-light.min.css">
        <link rel="stylesheet" href="../css/LoginLogout.css">
        <!-- Google Font -->
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <!--<link rel="stylesheet" href="css/w3.css">-->

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

        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">

                <!-- Logo -->
                <a href="index.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b><img src="../imagens/logo2.png" style="height:40px; width: 40px;" class="img-thumbnail" alt="ISERVICES"></b></span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b><img src="../imagens/icone2.png" style="height:48px; width: 170px; align-self: center;"class="img-lg" alt="ISERVICES"></b></span>
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


                            <li>
                                <a href="NovoAdministrador.jsp"><i class="fa fa-user-plus"></i> Cadastre-se</a>
                            </li>
                            <li>
                                <a href="LoginAdministrador.jsp"><i class="fa fa-sign-in"></i> Entrar</a>
                            </li>


                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu" data-widget="tree">
                        <br/>


                        <li>
                            <a href="NovoAdministrador.jsp">
                                <i class="fa fa-user-plus"></i> <span>Cadastre-se</span>
                                <span class="pull-right-container">

                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="LoginAdministrador.jsp">
                                <i class="fa fa-sign-in"></i> <span>Entrar</span>
                                <span class="pull-right-container">

                                </span>
                            </a>
                        </li>

                    </ul>
                    <!-- /.sidebar-menu -->
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="background-image:url('../imagens/446744413.jpg');background-attachment: fixed;background-position: center center; background-repeat: no-repeat;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> ISERVICES</a></li>
                        <li class="active">Faça Login</li>
                    </ol>
                    <form action="../ControleAcessoAdministrador" method="post">
                        <div class="container">
                            <center><h1 style='color:white;'>
                                    Login Administrador
                                </h1>
                                <small style='color:white;'><b>Administrador faça aqui seu login.</b></small></center>

                            <div class="card card-container">
                                <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
                                <img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
                                <p id="profile-name" class="profile-name-card"></p>
                                <!--<form class="form-signin">-->
                                <span id="reauth-email" class="reauth-email"></span>
                                <input type="email" id="inputEmail" class="form-control" name="txtEmail" placeholder="Email" required autofocus>

                                <input type="password" id="inputPassword" class="form-control" name="txtSenha" placeholder="Senha" required>
                                <br/>
                                <input type="submit" class="btn btn-lg btn-primary btn-block btn-signin" value="Entrar" name="acao"/>                               

                                <!--</form> /form -->
                                <br/>
                                
                                <br/>

                            </div><!-- /card-container -->
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
                        <h3 class="control-sidebar-heading">Configurações</h3>
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="../index.jsp" >
                                    <i class="menu-icon fa fa-home bg-aqua"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">ISERVICES</h4>
                                    </div>
                                </a>
                            </li>
                        </ul>

                        <!--Desativar conta-->
                        <ul class="control-sidebar-menu">
                            <li>
                                <a href="../index.jsp">
                                    <i class="menu-icon fa fa-home bg-red"></i>

                                    <div class="menu-info">
                                        <h4 class="control-sidebar-subheading">ISERVICES</h4>
                                    </div>
                                </a>
                            </li>
                        </ul>
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
        <script src="../admtle/jquery.min.js"></script>
        <!-- Bootstrap 3.3.7 -->
        <script src="../admtle/bootstrap.min.js"></script>
        <!-- AdminLTE App -->
        <script src="../admtle/adminlte.min.js"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins.
             Both of these plugins are recommended to enhance the
             user experience. -->
    </body>
</html>