<%-- 
    Document   : ListarCategoria
    Created on : 25/05/2017, 17:17:55
    Author     : brenda
--%>

<%@page import="Model.CategoriaProfissao"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>


        <%
            List<CategoriaProfissao> categorias = (List<CategoriaProfissao>) request.getAttribute("categorias");
        %>


        <form action="./consultarCategoria" method="get">
            <center><h3> Busque aqui um serviço </h3> <br/>
                <div class="container row">
                    <div class="col-sm-7">
                        <label for="nome">Escreva o nome da categoria que você está buscando:</label>                            
                        <input type="text" name="txtCategoria" class="form-control" placeholder="Ex: TI, Beleza"/>
                    </div> 
                    <div class="col-sm-3">
                        <p>Filtros</p>
                        <select name="txtOrdenacao" required id="ordenacao" class="btn btn-default dropdown-toggle">
                            <option value="">Selecione</option>

                            <option value="A-Z">
                                A-Z
                            </option>
                            <option value="Z-A">
                                Z-A
                            </option>                       
                        </select> 
                    </div>
                    <div class="col-sm-2"><br/>
                        <input class="btn btn-default" type="submit" value="Ok"/>                    
                    </div>
                </div>  
            </center>


            <hr>
            <br> 
        </form>
        <%--
        <% for (CategoriaProfissao categoria : categorias) {%>
        <input type="text" name="txtCategoria" hidden value="<%=categoria.getCategoriaNome() %>"/>
        
        <div class="row">
            
            <div class="col-sm-7">
                <div class="well">
                    <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i> Categoria <%=categoria.getCategoriaNome() %></p>
                    
                </div>
            </div>

                <div class="col-sm-2">
                    <br/>
                    <!--Chama a servlet ProfissionalControle/enviarSolicitação e atribui na variavel idEnviarEmail o valor do id do usuario-->
                    <p><a href="./editarCategoria?idEditar=<%= categoria.getId()%>"><input class="btn btn-default" type="button" name="solicitar" id="solicitar" value="Editar"/></a></p>

                </div>
            </div>  

            <%
                }
            %>
        
        --%>
    </body>
</html>
