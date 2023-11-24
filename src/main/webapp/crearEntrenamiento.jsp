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
    <h3>Crear entrenamiento</h3>
    <form method="post" action="">
        <label for="id"> ID </label>
        <input id = "id" type="number" required>
        <br>

        <label> Tipo
            <select name="tipo">
                <option value="fisico">Físico</option>
                <option value="tecnico">Técnico</option>
            </select>
        </label>
        <br>

        <label for="ubicacion"> Ubicacion </label>
        <input id = "ubicacion" type="text" required>
        <br>

        <label for="fecha"> Fecha </label>
        <input id = "fecha" type="date" required>
        <br>

        <input type="submit" value="Crear entrenamiento">


    </form>

</body>
</html>
