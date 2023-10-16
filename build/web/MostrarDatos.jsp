<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mostrar Datos</title>
    </head>
    <body>

        <c:if test="${not empty listaUsuarios}">
            <table>
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
                                <a href="ProcesarFormulario.do?action=eliminarUsuario&idUsuario=${usuario.id}">
                                    Eliminar
                                </a>
                                <a href="form.jsp?idUsuario=${usuario.id}&email=${usuario.email}&nombre=${usuario.nombre}&apellido=${usuario.apellido}">
                                    Actualizar
                                </a>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </c:if>




        <!-- Agregar un botón para volver atrás -->
        <form action="form.jsp" method="get">
            <input type="submit" value="Volver Atrás" />
        </form>
    </body>
</html>
