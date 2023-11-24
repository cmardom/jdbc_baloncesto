<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="estilos.css" />

</head>
<body>
<h1><%= "SOCIOS DEL CLUB DE BALONCESTO" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br>
<a href="listadoSocios.jsp">Listado de Socios</a>
<br>
<a href="formularioSocio.jsp">Formulario de Socio Nuevo</a>
<br>
<a href="pideNumeroSocio.jsp">Listado de Socios</a>
<br>
<a href="detalleSocio.jsp">Busca Socios</a>
<br>
<form action="detalleSocio.jsp">
    <input type="text" name="socioID">
    <input type="submit" value="enviar">
</form>

<%--ENTRENAMIENTOS--%>
<h3>ENTRENAMIENTOS</h3>
<a href="entrenamiento.jsp">Ir a entrenamientos</a>
<br>
</body>
</html>