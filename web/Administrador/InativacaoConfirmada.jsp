<%-- 
    Document   : InativacaoConfirmada
    Created on : 25/05/2017, 16:47:03
    Author     : brenda
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ISERVICES - Inativação Confirmada</title>
        <link rel="icon" type="image/png" href="imagens/logo2.png"/>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <script src='css/lib/moment.min.js'></script>
        <script src='css/lib/jquery.min.js'></script>
        
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
                <a href="NovoAdministrador.jsp">Cadastre-se</a>
                <a href="Administrador/LoginAdministrador.jsp">Entrar</a>
            </nav>
        </nav>
        <div class="w3-top">
            <div class="w3-white w3-xlarge w3-padding-xlarge" style="max-width:1200px;margin:auto;">
                <div class="w3-opennav w3-left w3-hover-text-grey" style="margin-bottom: auto" onclick="w3_open()">☰</div>
                <div class="w3-center"><a href="index.jsp"><img src="imagens/icone_1.png" alt="Sandwich" style="width:190px"> </a>
                    <ul class="nav navbar-nav navbar-right">
                        <a href="NovoAdministrador.jsp">Cadastre-se</a>
                <a href="Administrador/LoginAdministrador.jsp">Entrar</a>
                    </ul>   
                </div>
            </div>
        </div>        

        <div>
            <div class="container-fluid">
                <div class="bg-1">
                    <br>
                    <center>
                        <h3 style="color: black">Inativação realizada com sucesso! <br/><a href="./index.jsp" style="color: black">Clique aqui para voltar ao menu principal.</a></h3>
                        <br>
                        <br>
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


