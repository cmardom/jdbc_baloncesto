<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: muffinsita
  Date: 26/11/23
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
    <title>Pide ID Entrenamiento</title>
</head>
<body>
    <h3>Elige que entrenamiento quieresb borrar:</h3>

    <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "root");
        Statement s = conexion.createStatement();

        ResultSet listado = s.executeQuery ("SELECT * FROM entrenamiento");
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>Ubicacion</th>
            <th>Fecha</th>
        </tr>
        <%
            Integer entrenamientoIDADestacar = (Integer)session.getAttribute("id");
            String claseADestacar = "";

            while (listado.next()) {

                if (entrenamientoIDADestacar != null && entrenamientoIDADestacar == listado.getInt("id")){
                    claseADestacar = "destacar";

                } else {
                    claseADestacar = "";
                }

        %>
        <tr>
            <td>
                <%=listado.getInt("id")%>
            </td>
            <td>
                <%=listado.getString("tipo")%>
            </td>
            <td>
                <%=listado.getString("ubicacion")%>
            </td>
            <td>
                <%=listado.getString("fecha")%>
            </td>

            <td>
                <form method="post" action="borrarEntrenamiento.jsp">
                    <input type="hidden" name="id" value="<%=listado.getString("id") %>"/>
                    <input type="submit" value="borrar">
                </form>
            </td></tr>
        <%
            } // while
            conexion.close();
        %>
    </table>
</body>
</html>
