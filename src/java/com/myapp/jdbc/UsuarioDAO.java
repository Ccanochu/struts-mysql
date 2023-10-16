/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.jdbc;

import com.myapp.struts.Formulario;
import com.myapp.jdbc.ConexionBD;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class UsuarioDAO {

    public void insertarUsuario(Formulario usuario) {
        String sql = "INSERT INTO usuarios (email, name, lastname) VALUES (?, ?, ?)";

        try (Connection connection = ConexionBD.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, usuario.getEmail());
            preparedStatement.setString(2, usuario.getNombre());
            preparedStatement.setString(3, usuario.getApellido());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Usuario agregado con éxito.");
            } else {
                System.out.println("No se pudo agregar el usuario.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Formulario> obtenerListaUsuarios() {
        List<Formulario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";

        try (Connection connection = ConexionBD.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String email = resultSet.getString("email");
                String nombre = resultSet.getString("name");
                String apellido = resultSet.getString("lastname");

                Formulario usu = new Formulario(id, email, nombre, apellido);
                listaUsuarios.add(usu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaUsuarios;
    }

    public void eliminarUsuario(int idUsuario) {
        String sql = "DELETE FROM usuarios WHERE id = ?";

        try (Connection connection = ConexionBD.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, idUsuario);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Usuario eliminado con éxito.");
            } else {
                System.out.println("No se pudo eliminar el usuario.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarUsuario(Formulario usuario, int idUsuario) {
        String sqlActualizarUsuario = "UPDATE usuarios SET email=?, name=?, lastname=? WHERE id = ?";

        try (Connection connection = ConexionBD.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(sqlActualizarUsuario)) {

            preparedStatement.setString(1, usuario.getEmail());
            preparedStatement.setString(2, usuario.getNombre());
            preparedStatement.setString(3, usuario.getApellido());

            preparedStatement.setInt(4, idUsuario);

            int filasAfectadas = preparedStatement.executeUpdate();

            if (filasAfectadas > 0) {
                System.out.println("Usuario actualizado.");
            } else {
                System.out.println("No se pudo actualizar el usuario.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Formulario obtenerUsuarioPorId(int idUsuario) {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        Formulario usuario = null;

        try (Connection connection = ConexionBD.obtenerConexion();
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, idUsuario);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String email = resultSet.getString("email");
                    String nombre = resultSet.getString("name");
                    String apellido = resultSet.getString("lastname");

                    usuario = new Formulario(id, email, nombre, apellido);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

}
