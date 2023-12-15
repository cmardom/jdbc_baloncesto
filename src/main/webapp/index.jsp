<%--
  Created by IntelliJ IDEA.
  User: muffinsita
  Date: 15/12/23
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Redirigiendo</title>
</head>
<body>
<p>Redirigiendo. Por favor, espere...</p>
<%
    response.sendRedirect("ListarSociosServlet");

%>

</body>
</html>
