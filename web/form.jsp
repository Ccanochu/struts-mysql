<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Enlace al archivo CSS de Bootstrap -->
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
        <title>Formulario</title>
    </head>
    <body class="d-flex justify-content-center align-items-center">
        <div style="display: flex; flex-direction: column; align-items: center;">

            <c:if test="${param.idUsuario eq null}">
                <h1>Registrar usuario</h1>

                <!-- Modo Crear -->
                <form action="ProcesarFormulario.do" method="post">
                    Nombre: <input type="text" name="nombre"><br>
                    Apellido: <input type="text" name="apellido"><br>
                    Correo Electrónico: <input type="text" name="email"><br>
                    <input type="submit" value="Enviar" class="btn btn-success">
                </form>
            </c:if>
            <c:if test="${param.idUsuario ne null}">
                <h1>Actualizar   usuario</h1>

                <c:set var="usuario" value="${dao.obtenerUsuarioPorId(param.idUsuario)}" />
                <form action="ProcesarFormulario.do" method="post">
                    <input type="hidden" name="action" value="actualizarUsuario" />
                    <input type="hidden" name="idUsuario" value="${param.idUsuario}" />
                    Nombre: <input type="text" name="nombre" value="${param.nombre}" /><br>
                    Apellido: <input type="text" name="apellido" value="${param.apellido}" /><br>
                    Correo Electrónico: <input type="text" name="email" value="${param.email}" /><br>
                    <input type="submit" value="Actualizar" class="btn btn-primary">
                </form>
            </c:if>

        </div>
    </body>
</html>
