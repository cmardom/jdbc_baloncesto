<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
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
  <h3>Listado entrenamiento</h3>
  <%

      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto","root", "root");

      //UTILIZAR STATEMENT SÓLO EN QUERIES NO PARAMETRIZADAS.
      Statement s = conexion.createStatement();
      ResultSet listado = s.executeQuery ("SELECT * FROM entrenamiento");

      while (listado.next()) {
          out.println(listado.getInt("id") +
                  " " + listado.getString("tipo") +
                  " " + listado.getString("ubicacion") +
                  " " + listado.getString("fecha") +
                  "<br>");
      }
      listado.close();
      s.close();

      conexion.close();
  %>
</body>
</html>
