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
    <title>Crear entrenamiento</title>
</head>
<body>
    <h3>Crear entrenamiento</h3>
    <form method="post" action="grabaEntrenamiento.jsp">
        <label for="id"> ID </label>
        <input id="id" name="id" type="number" required>
        <br>

        <label for="tipo"> Tipo </label>
        <select id="tipo" name="tipo">
                <option value="fisico">Físico</option>
                <option value="tecnico">Técnico</option>
            </select>
        <br>

        <label for="ubicacion"> Ubicacion </label>
        <input id="ubicacion" name="ubicacion" type="text" required>
        <br>

        <label for="fecha"> Fecha </label>
        <input id="fecha" name="fecha" type="text" required>
        <br>

        <input type="submit" value="Crear entrenamiento">


    </form>

</body>
</html>
