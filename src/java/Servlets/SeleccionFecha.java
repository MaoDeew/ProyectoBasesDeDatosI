/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Consultas;
import Objetos.Evento;
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
public class SeleccionFecha extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            String fecha = request.getParameter("fechaSeleccionada");
            //out.println(fecha);
            Consultas consultas = new Consultas();
            HttpSession sesion = request.getSession();
            String usuarioVendedor = sesion.getAttribute("usuarioVendedor").toString();
            
            Evento e = consultas.eventoSeleccionado(fecha, usuarioVendedor);
           
           
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            
            out.println("<head>");
            
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/colores.css\">");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"css/tablaVendedores.css\">");
            out.println("<title>Fecha Seleccionada</title>");
            
            out.println("</head>");
            
            out.println("<body>");
            out.println("<div align=\"center\">");
            out.println("<h1 style=\"color:white;\">Fecha Seleccionada </h1>");
            
            out.println("<table>");
            out.println("<tr >");
            out.println("<td>Fecha</td>");
            out.println("<td>"+e.getFechaEvento()+"</td>");
            out.println("</tr>");
            out.println("<tr >");
            out.println("<td>Titulo</td>");
            out.println("<td>"+e.getTitulo()+"</td>");
            out.println("</tr>");
            out.println("<tr >");
            out.println("<td>Ubicación</td>");
            out.println("<td>"+e.getUbicacion()+"</td>");
            out.println("</tr>");
            out.println("<tr >");
            out.println("<td>Descripción</td>");
            out.println("<td>"+e.getDescripcion()+"</td>");
            out.println("</tr>");
            out.println("<tr >");
            out.println("<td>Hora</td>");
            out.println("<td>"+e.getHoraEvento()+"</td>");
            out.println("</tr>");
            out.println("</table>");
            out.println("<p></p>");
            out.println("<a style=\"text-decoration:none; color:white; background: #1668c4; padding: 5px; \" href=\"vendedor/agenda.jsp\">Volver</a>");
            
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        
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
