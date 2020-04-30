<%-- 
    Document   : registrar
    Created on : 30/04/2020, 12:52:35 AM
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Dto.Usuario" %>
<%@page import="Negocio.Mensajeria" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container ">
            <div class="row shadow-lg p-3 mb-5 bg-white rounded">
                <div class="col-sm-9  tex-center">
                    <h1><strong>Editar Mensaje</strong></h1>
                    <form action="mensajeriaController?action=registrar" method="POST">

                        <div class="form-group">
                            <label for="formGroupExampleInput">Nombre: </label>
                            <input type="text" name="nombre" class="form-control" id="formGroupExampleInput" >
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Email: </label>
                            <input type="email" name="email" class="form-control" id="formGroupExampleInput2" >
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput">SitioWeb: </label>
                            <input type="text" name="sitioweb" class="form-control" id="formGroupExampleInput" >
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Mensaje: </label>
                            <input type="text" name="mensaje" class="form-control" id="formGroupExampleInput2">
                        </div>
                        <jsp:useBean id="m" class="Negocio.Mensajeria"/>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">usuarios: </label> <br>

                            <select name="usuarios">
                                <c:forEach var="u" items="${m.getUsuario()}">
                                    <option value="<c:out value="${u.usuario}"/>"><c:out value="${u.usuario}"/></option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-outline-primary">Guardar</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
