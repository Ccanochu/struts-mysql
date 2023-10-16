<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">

<!-- Enlace al archivo JS de Bootstrap (requiere jQuery) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Font Awesome CSS CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mostrar Datos</title>
    </head>
    <body class="d-flex justify-content-center align-items-center">
        <div style="display: flex; flex-direction: column; align-items: center;">
            <h1>Listado de usuarios</h1>

            <c:if test="${not empty listaUsuarios}">

                <table class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Acciones</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${listaUsuarios}">
                            <tr>
                                <td><c:out value="${usuario.email}" /></td>
                                <td><c:out value="${usuario.nombre}" /></td>
                                <td><c:out value="${usuario.apellido}" /></td>
                                <td>
                                    <a href="ProcesarFormulario.do?action=eliminarUsuario&idUsuario=${usuario.id}" class="btn btn-danger">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                    <a href="form.jsp?idUsuario=${usuario.id}&email=${usuario.email}&nombre=${usuario.nombre}&apellido=${usuario.apellido}" class="btn btn-primary">
                                        <i class="fa-solid fa-square-pen"></i>
                                    </a>

                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </c:if>




            <!-- Agregar un botón para volver atrás -->
            <form action="form.jsp" method="get">
                <input type="submit" value="Volver Atrás" class="btn btn-secondary"/>
            </form>
        </div>

    </body>
</html>
