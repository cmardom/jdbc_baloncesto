<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: carmen
  Date: 20/11/23
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalle de socio</title>
    <link rel="stylesheet" type="text/css" href="estilos.css" />
</head>

<body>
<h1>Detalle socio</h1>

<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int socioID = -1;

    try {
        socioID = Integer.parseInt(request.getParameter("socioID"));

    } catch (Exception ex) {
        ex.printStackTrace();
        valida = false;
    }

    if (valida) {

        Connection conn;
        conn = null;
        PreparedStatement ps = null;

        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "root");


            String sql = "SELECT * FROM socio WHERE socioID = ? ";


            ps = conn.prepareStatement(sql);
            int idx = 1;
            ps.setInt(idx, socioID);


            rs = ps.executeQuery();

            if (rs.next()) {
                int numSocio = rs.getInt("socioID");
                String nombre = rs.getString("nombre");
                int estatura = rs.getInt("estatura");
                int edad = rs.getInt("edad");
                String localidad = rs.getString("localidad");
                %>
                <table style="border: 1px solid black">
                    <tr>
                        <td style="border: 1px solid black" >SocioID</td>
                        <td style="border: 1px solid black">
                            <%=numSocio%>
                        </td>
                    </tr>
                    <tr style="border: 1px solid black">
                        <td style="border: 1px solid black" >Nombre</td>
                        <td style="border: 1px solid black">
                            <%=nombre%>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">Estatura</td>
                        <td style="border: 1px solid black">
                            <%=estatura%>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black">Edad</td>
                        <td style="border: 1px solid black">
                            <%=edad%>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid black" >Localidad</td>
                        <td style="border: 1px solid black">
                            <%=localidad%>
                        </td>
                    </tr>
                </table>

                <%

            } else {
                %>
                <span>Socio con ID <%=socioID%> no existe</span>
                <%
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {

            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }

    } else {
        out.println("Error de validación!");
    }

%>
</body>
</html>
