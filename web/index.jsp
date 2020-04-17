<%-- 
    Document   : index
    Created on : 27/06/2017, 10:26:33
    Author     : brenda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ISERVICES - HOME</title>
        <link rel="icon" type="image/png" href="imagens/logo2.png"/>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <link rel="stylesheet" href="admtle/dataTables.bootstrap.min.css">
        <style>
            h3{
                text-shadow: 0.1em 0.1em 0.45em #333;
                font-size: 35px;
                align-self: center;
                align-items: center;
                color: #fff;
            }
            h4{
                text-shadow: 0.1em 0.1em 0.45em #333;
                font-size: 24px;
                align-self: center;
                align-items: center;
                color: #fff;
            }
        </style>
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
    <body class="hold-transition skin-yellow-light sidebar-collapse">

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
                    <!--Sidebar toggle button-->

                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->

                            
                            <li>
                                <a href="Login/NovoAdministrador.jsp"><i class="fa fa-user-plus"></i> Cadastre-se</a>
                            </li>
                            <li>
                                <a href="Login/LoginAdministrador.jsp"><i class="fa fa-sign-in"></i> Entrar</a>
                            </li>
                            

                        </ul>
                    </div>
                </nav>
            </header>

            <section class="content" style="background-image: url('imagens/fundo-adm.jpg'); background-repeat:no-repeat; background-size:cover; background-position: 100%; text-align: center; padding-top: 70px; padding-bottom: 90px;">
                <div class="container-fluid">
                        <br/>
                        <center><h3> Bem-vindo ao ISERVICES ADMINISTRADOR </h3>
                            <br>
                            <h4>Selecione abaixo a operação desejada</h4>
                            <br>
                            <div class="row">
                                <div class="col-sm-6" >
                                    <p><a href="Login/NovoAdministrador.jsp"  style="color:white"><img src="imagens/add-user.png" class="w3-hover-opacity" alt="Novo Cadastro" style="width:120px; height:120px;"><br/>Novo Cadastro. </a> </p>
                                </div>
                                <div class="col-sm-6">
                                    <p><a href="Login/LoginAdministrador.jsp" style="color:white"><img src="imagens/login.png" class="w3-hover-opacity" alt="Logar" style="width:100px; height:100px;"> <br/> Realizar o Login. </a> </p>
                                </div>
                            </div>
                            <br>
                        </center>  

                    
                </div>
            </section>

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <center><div class="pull-center hidden-sm">
                        Brenda Renata & Leticia Youssef <br/>
                    </div>
                    <!-- Default to the left -->
                    <strong>ISERVICES | 2017.</strong></center>
            </footer>


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