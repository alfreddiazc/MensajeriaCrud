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
                        <td><a href='/editar.jsp?id=<c:out value="${mensaje.id}"/>'>
                                <input type="submit" value="Detalle"/></a>
                            <a href='/eliminar.jsp?id=<c:out value="${mensaje.id}"/>'>
                                <input type="submit" value="Eliminar"/></a></td>
                    </tr>
                </c:forEach>
            </tbody>
           
        </table>
    </body>
</html>
