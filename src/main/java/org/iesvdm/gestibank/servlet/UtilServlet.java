package org.iesvdm.gestibank.servlet;

import jakarta.servlet.http.HttpServletRequest;
import org.iesvdm.gestibank.model.Cliente;

import java.text.SimpleDateFormat;
import java.util.Objects;
import java.util.Optional;
import java.util.Date;

import static java.lang.Integer.parseInt;

public class UtilServlet {
    public static Optional<Cliente> validarCliente(HttpServletRequest request) {

        //CÓDIGO DE VALIDACIÓN
        boolean valida = true;
        int identificador = -1;
        String nombre_completo = null;
        String direccion = null;
        String telefono = null;
        Date fecha_nacimiento = null;
        String fecha_nacimientoStr = request.getParameter("fecha_nacimiento");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


        try {
            Objects.requireNonNull(request.getParameter("nombre_completo"));
            if (request.getParameter("nombre_completo").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            nombre_completo = request.getParameter("nombre_completo");


            Objects.requireNonNull(request.getParameter("direccion"));
            if (request.getParameter("direccion").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            nombre_completo = request.getParameter("direccion");

            Objects.requireNonNull(request.getParameter("telefono"));
            if (request.getParameter("telefono").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            nombre_completo = request.getParameter("telefono");


            Objects.requireNonNull(request.getParameter("fecha_nacimiento"));
            if (request.getParameter("fecha_nacimiento").isBlank()) throw new RuntimeException("Parámetro vacío o todo espacios blancos.");
            fecha_nacimientoStr = request.getParameter("fecha_nacimiento");
            fecha_nacimiento = sdf.parse(fecha_nacimientoStr);

            if(request.getParameter("identificador") != null){
                identificador = parseInt(request.getParameter("identificador"));
            }

            return Optional.of(new Cliente(identificador, nombre_completo, direccion, telefono, fecha_nacimiento));

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //FIN CÓDIGO DE VALIDACIÓN
        return Optional.empty();

    }
}
