/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mao
 */
public class RegistrarVendedores extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        HttpSession sesion = request.getSession();
        String usuarioAdmin = sesion.getAttribute("usuarioAdmin").toString();
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String usuarioVendedor = request.getParameter("usuarioVendedor");
        String passwordVendedor = request.getParameter("password");
        
        if (nombre.equals("") || apellido.equals("") || cedula.equals("") || telefono.equals("") || direccion.equals("") || usuarioVendedor.equals("") || passwordVendedor.equals("")) {
            response.sendRedirect("mensaje_error_creacion_vendedores.jsp");
        } else {

            Consultas con = new Consultas();
            if (con.registrarVendedor(nombre, apellido, cedula, telefono, direccion, usuarioVendedor, passwordVendedor, usuarioAdmin)) {
                con.estadisticaVendedorEnCeros(usuarioVendedor);
                con.creacionAgendaVendedor(usuarioVendedor);
                response.sendRedirect("mensaje_creacion_vendedor_correcta.jsp");
            } else {
                response.sendRedirect("mensaje_error_creacion_vendedores.jsp");
            }

        }

        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
