<%-- 
    Document   : editar
    Created on : 29/04/2020, 10:28:30 AM
    Author     : USUARIO
--%>

<%@page import="Negocio.Mensajeria"%>
<%@page import="Dto.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   
    </head>
    <body>
        <%  Mensajeria msj=new Mensajeria();
            Mensaje m=msj.getMensajeById(Integer.parseInt(request.getParameter("id")));%>
         <div class="container ">
            <div class="row shadow-lg p-3 mb-5 bg-white rounded">
                <div class="col-sm-9  tex-center">
                    <h1><strong>Bienvenidos Login</strong></h1>
                    <form action="RegistrarServlet" method="POST">
                        <div class="form-group">
                            <label for="formGroupExampleInput">Usuario: </label>
                            <input type="text" name="usuario" class="form-control" id="formGroupExampleInput" placeholder="...">
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Contraseña: </label>
                            <input type="password" name="pass" class="form-control" id="formGroupExampleInput2" placeholder="****">
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput">Nombre: </label>
                            <input type="text" name="nombre" class="form-control" id="formGroupExampleInput" placeholder="...">
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Direccion: </label>
                            <input type="text" name="direccion" class="form-control" id="formGroupExampleInput2" placeholder="...">
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput">Telefono: </label>
                            <input type="number" name="telefono" class="form-control" id="formGroupExampleInput" placeholder="...">
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput">Email: </label>
                            <input type="email" name="email" class="form-control" id="formGroupExampleInput" placeholder="example@example.com">
                        </div>
                        
                        <button type="submit" class="btn btn-outline-primary">Guardar</button>
                        <a href="index.jsp" class="btn btn btn-outline-secondary" role="button" aria-disabled="true">Iniciar sesion</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
