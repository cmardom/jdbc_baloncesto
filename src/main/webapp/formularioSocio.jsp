<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilos.css" />

  </head>
  <body>
    <h2>Introduzca los datos del nuevo socio:</h2>
    <form method="post" action="grabaSocio.jsp">
      Nº socio <input type="text" name="numero"/></br>
      Nombre <input type="text" name="nombre"/></br>
      Estatura <input type="text" name="estatura"/></br>
      Edad <input type="text" name="edad"/></br>
      Localidad <input type="text" name="localidad"/></br>
      <input type="submit" value="Aceptar">
    </form>


  <%
    String error = (String)session.getAttribute("error"); // devuelve un objeto, hay que castear a String
    if (error != null){
      //si hay error, se muestra el error guardado en la validación
  %>
      <span style= "background-color: red; color:white"> Error: <%=error%></span>
    <%
      session.removeAttribute("error"); //se borra para resetear
    }

    %>
  </body>
</html>