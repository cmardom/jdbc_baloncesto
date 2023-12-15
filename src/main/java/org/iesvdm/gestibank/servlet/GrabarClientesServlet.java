package org.iesvdm.gestibank.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import jakarta.servlet.annotation.WebServlet;

public class GrabarClientesServlet extends HttpServlet {


    private ClienteDAO clienteDAO = new ClienteDAOImpl();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/formularioClienteB.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher dispatcher = null;

        Optional<Cliente> optionalCliente = UtilServlet.validarCliente(request);


        if (optionalCliente.isPresent()) {

            Cliente cliente = optionalCliente.get();

            this.clienteDAO.create(cliente);

            List<Cliente> listado = this.clienteDAO.getAll();

            request.setAttribute("listado", listado);

            request.setAttribute("newClienteID", cliente.getClienteID() );

            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/listadoClientesB.jsp");
        } else {

            request.setAttribute("error", "Error de validación!");
            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/formularioClienteB.jsp");
        }

        dispatcher.forward(request,response);

    }

}