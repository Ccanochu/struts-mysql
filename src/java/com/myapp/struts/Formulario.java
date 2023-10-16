/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author PC
 */
public class Formulario extends ActionForm {

    private int id;
    private String email;
    private String apellido;
    private String nombre;

    public Formulario() {
    }

    public Formulario(int id, String email, String nombre, String apellido) {
        this.id = id;
        this.email = email;

        this.nombre = nombre;
        this.apellido = apellido;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
