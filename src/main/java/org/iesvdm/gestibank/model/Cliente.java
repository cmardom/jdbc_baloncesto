package org.iesvdm.gestibank.model;

import java.util.Date;
import java.util.Objects;

public class Cliente {
    private int identificador;
    private String nombre_completo;
    private String direccion;
    private String telefono;
    private Date fecha_nacimiento;

    public Cliente() {
    }

    public Cliente(int identificador, String nombre_completo, String direccion, String telefono, Date fecha_nacimiento) {
        this.identificador = identificador;
        this.nombre_completo = nombre_completo;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public int getIdentificador() {
        return identificador;
    }

    public void setIdentificador(int identificador) {
        this.identificador = identificador;
    }

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "identificador=" + identificador +
                ", nombre_completo='" + nombre_completo + '\'' +
                ", direccion='" + direccion + '\'' +
                ", telefono='" + telefono + '\'' +
                ", fecha_nacimiento=" + fecha_nacimiento +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cliente cliente = (Cliente) o;
        return identificador == cliente.identificador && Objects.equals(nombre_completo, cliente.nombre_completo) && Objects.equals(direccion, cliente.direccion) && Objects.equals(telefono, cliente.telefono) && Objects.equals(fecha_nacimiento, cliente.fecha_nacimiento);
    }

    @Override
    public int hashCode() {
        return Objects.hash(identificador, nombre_completo, direccion, telefono, fecha_nacimiento);
    }
}
