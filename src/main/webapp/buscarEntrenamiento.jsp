<%--
  Created by IntelliJ IDEA.
  User: muffinsita
  Date: 24/11/23
  Time: 13:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Entrenamientos</title>
</head>
<body>
    <h3>Buscar entrenamiento</h3>
    <form method="post" action="detalleEntrenamiento.jsp">
        <label for="id">Introduce ID del entrenamiento que quieres buscar</label>
        <input id="id" name="id" type="number">
        <input type="submit" value="Buscar">
    </form>
</body>
</html>
