<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: muffinsita
  Date: 24/11/23
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Entrenamientos</title>
</head>
<body>
    <h3>Borrar entrenamiento</h3>

<%
    boolean valida = true;
    int id = -1;

    try{
        id = Integer.parseInt(request.getParameter("id"));
    } catch (NumberFormatException nfe){
        nfe.printStackTrace();
        valida = false;
    }

    if (valida){
        Connection conn = null;
        PreparedStatement ps = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "root");

            String sqlDelete = "DELETE FROM entrenamiento WHERE id = ?";
            System.out.println(sqlDelete);


            ps = conn.prepareStatement(sqlDelete);
            ps.setInt(1, id);


            int filasAfectadas = ps.executeUpdate();
            System.out.println("Entrenamiento borrado > " + filasAfectadas);

        } catch (Exception ex){
            ex.printStackTrace();
        } finally {
            try { ps.close(); } catch (Exception e) { /* Ignored */ }
            try { conn.close(); } catch (Exception e) { /* Ignored */ }
        }
    }
%>

    <!-- REDIRECCIÓN POR JavaScript EN EL CLIENTE  -->
    <script>document.location = "listadoEntrenamiento.jsp"</script>
</body>
</html>
