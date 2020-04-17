<%-- 
    Document   : LoginInativo
    Created on : 25/04/2017, 17:19:07
    Author     : brenda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ISERVICES - LOGIN INATIVO</title>
   <link rel="icon" type="image/png" href="imagens/logo2.png"/>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link href='css/fullcalendar.min.css' rel='stylesheet' />
        <link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src='css/lib/moment.min.js'></script>
        <script src='css/lib/jquery.min.js'></script>
        <script src='css/fullcalendar.min.js'></script>
        <script src='css/gcal.min.js'></script>
        <style>
            body {

                line-height: 1.8;
                color: #1abc9c;
                font-size: 14px;
                font-family: "Montserrat", sans-serif;
            }

            p {font-size: 14px;}
            .margin {margin-bottom: 45px;}

            .bg-1 {
                background-image: url("imagens/Erro_Usuario_Inativo.jpg");/* */
                background-repeat:no-repeat;
                background-size:cover;
                background-position: 100%;
                text-align: center;
            }
            .bg-2 {
                background-image: url("imagens/app1.jpg");/* */
                background-repeat:no-repeat;
                background-size:cover;
                background-position: 100%;
                align-items: center;
            }
            h3{
                text-shadow: 0.1em 0.2em 0.85em #333;
                font-size: 35px;
                align-self: center;
                align-items: center;
                color: #fff;
            }
             h4{
                text-shadow: 0.2em 0.2em 0.85em #fff;
                font-size: 25px;
                align-self: center;
                align-items: center;
                color: #ref;
            }

            .container-fluid {
                padding-top: 20px;
                padding-bottom: 10px;
                padding-left: 2px;
                padding-right: 2px;
                color: #000;
                background-color: #fff;
            }
            input[type=text] {
                width: 100%;
                box-sizing: border-box;

                font-size: 16px;
                background-position: 10px 10px; 
                background-repeat: no-repeat;
                padding: 12px 20px 12px 40px;
                -webkit-transition: width 0.4s ease-in-out;
                transition: width 0.4s ease-in-out;
            }
            * {
                box-sizing: border-box;
            }
            /* Style the "Add" button */
            .addBtn {
                padding: 10px;
                width: 25%;
                background: #d9d9d9;
                color: #555;
                float: left;
                text-align: center;
                font-size: 11px;
                cursor: pointer;
                transition: 0.3s;
            }
            .addBtn:hover {
                background-color: #bbb;
            }input {
                border: none;
                width: 75%;
                padding: 10px;
                float: left;
                font-size: 16px;
                color: black;
            }
        </style>
    </head>
    <body>

        <script>
            // Script to open and close sidenav
            function w3_open() {
                document.getElementById("mySidenav").style.display = "block";
            }
            function w3_close() {
                document.getElementById("mySidenav").style.display = "none";
            }
        </script>

        <nav class="navbar">
            <nav class="w3-sidenav w3-card-4 w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:30%;min-width:20px" id="mySidenav">
                <a href="javascript:void(0)" onclick="w3_close()" class="w3-closenav">Fechar ( X )</a>
                <a href="index.jsp" onclick="w3_close" >Home</a>
                <a href="Profissional/loginProfissional.jsp">Área do Profissional</a>
                <a href="cadastro.jsp">Cadastre-se</a>
                <a href="Cliente/loginCliente.jsp">Entrar</a>
            </nav>
        </nav>
        <div class="w3-top">
            <div class="w3-white w3-xlarge w3-padding-xlarge" style="max-width:1200px;margin:auto;">
                <div class="w3-opennav w3-left w3-hover-text-grey" style="margin-bottom: auto" onclick="w3_open()">☰</div>
                <div class="w3-center"><a href="index.jsp"><img src="imagens/icone_1.png" alt="Sandwich" style="width:190px"> </a>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Profissional/loginProfissional.jsp">Área do Profissional</a></li>  
                        <li><a href="cadastro.jsp">Cadastre-se</a></li>
                        <li><a href="Cliente/loginCliente.jsp">Entrar</a></li> 
                    </ul>   
                </div>
            </div>
        </div>
        <div>
            <div class="container-fluid">
                <div class="bg-1">
                    <br>
                    <center><h3>Seu login esta inativo, deseja ativá-lo? </h3>    
                        <br>
                        <a href="AtivarLogin.jsp"><img src="imagens/icone.png" alt="Sandwich" style="width:80%; opacity: 0.4"></a>
                        <br><br>
                        <h4 ><a href="#" style="color: red">Clique aqui para ativar.</a></h4>
                        <br> 
                    </center>                
                </div> 
                
            </div>
        </div>

        <!-- Footer -->
        <footer class="container-fluid text-center">
            <p>ISERVICES | 2017</p>
            <p>Brenda Renata & Leticia Youssef</p>
        </footer>
    </body>
</html>

