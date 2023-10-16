/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import com.myapp.jdbc.UsuarioDAO;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author PC
 */
public class ProcesarFormularioAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Formulario formulario = (Formulario) form;
        String nombre = formulario.getNombre();
        String apellido = formulario.getApellido();
        String email = formulario.getEmail();

        Formulario usu = new Formulario();

        UsuarioDAO dao = new UsuarioDAO();

        List<Formulario> listaUsuarios;

        String action = request.getParameter("action");
        int idUsuario = -1;

        if (action != null && action.equals("actualizarUsuario")) {
            String idUsuarioString = request.getParameter("idUsuario");
            if (idUsuarioString != null && !idUsuarioString.isEmpty()) {
                idUsuario = Integer.parseInt(idUsuarioString);

                // Actualizar el usuario
                Formulario usuario = new Formulario();
                usuario.setId(idUsuario);
                usuario.setNombre(request.getParameter("nombre"));
                usuario.setApellido(request.getParameter("apellido"));
                usuario.setEmail(request.getParameter("email"));
                dao.actualizarUsuario(usuario, idUsuario);

                listaUsuarios = dao.obtenerListaUsuarios();
                request.setAttribute("listaUsuarios", listaUsuarios);
            }
        } else {
            usu.setEmail(formulario.getEmail());
            usu.setNombre(formulario.getNombre());
            usu.setApellido(formulario.getApellido());
            dao.insertarUsuario(usu);

            listaUsuarios = dao.obtenerListaUsuarios();
            request.setAttribute("listaUsuarios", listaUsuarios);
        }

        if (action != null && action.equals("eliminarUsuario")) {
            idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            dao.eliminarUsuario(idUsuario);

            listaUsuarios = dao.obtenerListaUsuarios();
            request.setAttribute("listaUsuarios", listaUsuarios);

            return new ActionForward("/ProcesarFormulario.do", true);
        }

        return mapping.findForward("success");
    }
}
