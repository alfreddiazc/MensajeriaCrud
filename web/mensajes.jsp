<%-- 
    Document   : mensajes
    Created on : 29/04/2020, 12:16:36 AM
    Author     : USUARIO
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page  import="Dto.Mensaje" %>
<%@page import="Dao.MensajeJpaController" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>listado de mensajes</title>
    </head>
    <body>
        
        <h1>listado de mensajes</h1>
        <table>
            <thead>
                <tr><th>Nombre</th><th>Email</th>
                    <th>SitioWeb</th><th>Mensaje</th><th>Usuario</th>
                </tr>
            </thead>
            <tbody>
                
                 <c:forEach var="mensaje"  items="${list}">
                    <tr>
                        <td><c:out value="${mensaje.nombre}"/></td>
                        <td><c:out value="${mensaje.email}"/></td>
                        <td><c:out value="${mensaje.sitioweb}"/></td>
                        <td><c:out value="${mensaje.mensaje}"/></td>
                        <td><c:out value="${mensaje.usuario}"/></td>
                        <td><a href="mensajeriaController?action=showEditar&id=<c:out value="${mensaje.id}"/>"> Editar </a>
                            <a href="mensajeriaController?action=eliminar&id=<c:out value="${mensaje.id}"/>"> Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
           
        </table>
        <a href="registrar.jsp">Registrar nuevo</a>
    </body>
</html>
