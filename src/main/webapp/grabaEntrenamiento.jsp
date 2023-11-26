<%@ page import="java.util.Date" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: Carmen
  Date: 11/26/2023
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Graba entrenamiento</title>
</head>
<body>

<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;

    int id = -1;
    String tipo = null;
    String ubicacion = null;
    int fecha = null;

    boolean flagValidaId = false;
    boolean flagValidaTipo = false;
    boolean flagValidaUbicacionNull = false;
    boolean flagValidaUbicacionBlank = false;
    boolean flagValidaFecha = false;

    try {

        id = Integer.parseInt(request.getParameter("id"));
        flagValidaId = true;

        Objects.requireNonNull(request.getParameter("tipo"));
        flagValidaTipo = true;

        if (request.getParameter("ubicacion").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
        flagValidaUbicacionBlank = true;
        Objects.requireNonNull(request.getParameter("ubicacion"));
        flagValidaUbicacionNull = true;
        ubicacion = request.getParameter("ubicacion");


        fecha = Integer.parseInt(request.getParameter("fecha"));
        flagValidaFecha = true;


    } catch (Exception ex) {
        ex.printStackTrace();

        if (!flagValidaId) {
            session.setAttribute("error", "Error en ID.");
        } else if (!flagValidaTipo) {
            session.setAttribute("error", "Error en tipo");
        } else if (!flagValidaUbicacionBlank || !flagValidaUbicacionNull) {
            session.setAttribute("error", "Error en ubicacion.");
        } else if (!flagValidaFecha) {
            session.setAttribute("error", "Error en fecha.");
        }



        valida = false;
    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {

        Connection conn = null;
        PreparedStatement ps = null;
// 	ResultSet rs = null;

        try {


            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/baloncesto", "root", "root");



            String sql = "INSERT INTO socio VALUES ( " +
                    "?, " + //socioID
                    "?, " + //nombre
                    "?, " + //estatura
                    "?, " + //edad
                    "?)"; //localidad

            ps = conn.prepareStatement(sql);
            int idx = 1;
            ps.setInt(idx++, numero);
            ps.setString(idx++, nombre);
            ps.setInt(idx++, estatura);
            ps.setInt(idx++, edad);
            ps.setString(idx++, localidad);

            int filasAfectadas = ps.executeUpdate();
            System.out.println("SOCIOS GRABADOS:  " + filasAfectadas);


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

        //out.println("Socio dado de alta.");

        //response.sendRedirect("detalleSocio.jsp?socioID="+numero);
        //response.sendRedirect("pideNumeroSocio.jsp?socioIDADestacar="+numero);
        session.setAttribute("socioIDADestacar", numero);
        response.sendRedirect("pideNumeroSocio.jsp");

    } else {
        //out.println("Error de validación!");
        response.sendRedirect("formularioSocio.jsp");
    }
%>


</body>
</html>
