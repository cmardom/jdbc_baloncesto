package org.iesvdm.gestibank.dao;

import org.iesvdm.gestibank.model.Cliente;

import java.sql.*;
import java.util.Optional;

public class ClienteDAOImpl extends AbstractDAOImpl implements ClienteDAO{
    @Override
    public void create (Cliente cliente){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultSet rsGenKeys = null;

        try{
            conn = connectDB();
            ps = conn.prepareStatement("INSERT INTO cliente (nombre_completo, direccion, telefono, fecha_nacimiento) VALUES (?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);

            int idx = 1;
            ps.setString(idx++, cliente.getNombre_completo());
            ps.setString(idx++, cliente.getDireccion());
            ps.setString(idx++, cliente.getDireccion());
            ps.setString(idx++, cliente.getTelefono());
            ps.setDate(idx++, (Date) cliente.getFecha_nacimiento());

            int rows = ps.executeUpdate();
            if (rows == 0){
                System.out.println("INSERT de cliente con 0 filas insertadas.");
            }

            rsGenKeys = ps.getGeneratedKeys();

            if (rsGenKeys.next()){
                cliente.setIdentificador(rsGenKeys.getInt(1));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }
    }


    @Override
    public Optional<Cliente> find(int id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("SELECT * FROM cliente WHERE clienteID = ?");

            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                Cliente cliente = new Cliente();

                cliente.setIdentificador(rs.getInt("identificador"));
                cliente.setNombre_completo(rs.getString("nombre_completo"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setTelefono(rs.getString("telefono"));
                cliente.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));

                return Optional.of(cliente);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

        return Optional.empty();

    }

    @Override
    public void update(Cliente cliente) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();


            ps = conn.prepareStatement("UPDATE cliente SET nombre_completo = ?, direccion = ?, telefono = ?, fecha_nacimiento = ?  WHERE identificador = ?");
            int idx = 1;
            ps.setString(idx++, cliente.getNombre_completo());
            ps.setString(idx++, cliente.getDireccion());
            ps.setString(idx++, cliente.getDireccion());
            ps.setString(idx++, cliente.getTelefono());
            ps.setDate(idx++, (Date) cliente.getFecha_nacimiento());

            int rows = ps.executeUpdate();

            if (rows == 0)
                System.out.println("Update de cliente con 0 registros actualizados.");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }

    @Override
    public void delete(int identificador) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = connectDB();

            ps = conn.prepareStatement("DELETE FROM cliente WHERE identificador = ?");
            int idx = 1;
            ps.setInt(idx, identificador);

            int rows = ps.executeUpdate();

            if (rows == 0)
                System.out.println("Delete de cliente con 0 registros eliminados.");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            closeDb(conn, ps, rs);
        }

    }
}
