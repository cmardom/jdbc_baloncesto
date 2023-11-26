<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Detalle entrenamiento</title>
  <link rel="stylesheet" type="text/css" href="estilos.css" />
</head>

<body>
<h1>Detalle entrenamiento</h1>

<%
  //CÓDIGO DE VALIDACIÓN
  boolean valida = true;
  int entrenamientoID = -1;
  System.out.println(request.getParameter("id"));

  try {
    entrenamientoID = Integer.parseInt(request.getParameter("id"));

  } catch (Exception ex) {
    ex.printStackTrace();
    valida = false;
  }

  if (valida) {
    System.out.println("hola");
    Connection conn;
    conn = null;
    PreparedStatement ps = null;

    ResultSet rs;
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "root");


      String sql = "SELECT * FROM entrenamiento WHERE id = ? ";


      ps = conn.prepareStatement(sql);
      int idx = 1;
      ps.setInt(idx, entrenamientoID);


      rs = ps.executeQuery();

      if (rs.next()) {
        int id = rs.getInt("id");
        String tipo = rs.getString("tipo");
        String ubicacion = rs.getString("ubicacion");
        String fecha = rs.getString("fecha");
%>
<table >
  <tr>
    <td>entrenamientoID</td>
    <td>
      <%=id%>
    </td>
  </tr>
  <tr>
    <td>tipo</td>
    <td>
      <%=tipo%>
    </td>
  </tr>
  <tr>
    <td>ubicacion</td>
    <td>
      <%=ubicacion%>
    </td>
  </tr>
  <tr>
    <td>fecha</td>
    <td>
      <%=fecha%>
    </td>
  </tr>

</table>

<%

} else {
%>
<span>Entrenamiento con ID <%=entrenamientoID%> no existe</span>
<%
      }


    } catch (Exception ex) {
        System.out.println(ex.getMessage());
    } finally {

      try {
        ps.close();
      } catch (Exception e) {
        System.out.println(e.getMessage());
      }
      try {
        conn.close();
      } catch (Exception e) {
        System.out.println(e.getMessage());
      }
    }

  } else {
    out.println("Error de validación!");
  }

%>

  <form method="post" action="listadoEntrenamiento.jsp">
    <input type="submit" value="Listado">
  </form>
</body>
</html>
