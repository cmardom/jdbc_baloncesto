<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="estilos.css" />

</head>
<body>
<h1><%= "Hello World!" %>
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

</body>
</html>