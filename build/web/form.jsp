<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Formulario</title>
    </head>
    <body>
        <c:if test="${param.idUsuario eq null}">

            <!-- Modo Crear -->
            <form action="ProcesarFormulario.do" method="post">
                Nombre: <input type="text" name="nombre"><br>
                Apellido: <input type="text" name="apellido"><br>
                Correo Electrónico: <input type="text" name="email"><br>
                <input type="submit" value="Enviar">
            </form>
        </c:if>
        <c:if test="${param.idUsuario ne null}">
            <c:set var="usuario" value="${dao.obtenerUsuarioPorId(param.idUsuario)}" />
            <form action="ProcesarFormulario.do" method="post">
                <input type="hidden" name="action" value="actualizarUsuario" />
                <input type="hidden" name="idUsuario" value="${param.idUsuario}" />
                Nombre: <input type="text" name="nombre" value="${param.nombre}" /><br>
                Apellido: <input type="text" name="apellido" value="${param.apellido}" /><br>
                Correo Electrónico: <input type="text" name="email" value="${param.email}" /><br>
                <input type="submit" value="Actualizar">
            </form>
        </c:if>


    </body>
</html>
