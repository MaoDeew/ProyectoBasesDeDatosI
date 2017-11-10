package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class administrador_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <script type=\"text/javascript\" src=\"scriptValidacion.js\"></script>\n");
      out.write("        <script src=\"alertify/alertify.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/estilo1.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/fonts.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"alertify/css/alertify.min.css\"/>\n");
      out.write("        <title>Proyecto</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <nav> \t\n");
      out.write("\n");
      out.write("            <div align=\"center\" id=\"menu\">\n");
      out.write("                <a href=\"home.html\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-home\"></span> Inicio\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"somos.html\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-users\"></span> Portal Empresa\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"productos.html\" class=\"button menu\" id=\"PortalAdmin\">\n");
      out.write("                    <span class=\"icon-users\"></span> Portal Administradores\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"fundacion.html\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-users\"></span> Portal Vendedores\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"contactenos.html\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-mail\"></span> Contacto\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        \n");
      out.write("        <div align=\"center\" id=\"tablaRegistro\">\n");
      out.write("            <table border=\"0\" cellspacing=\"1\" cellpadding=\"5\">\n");
      out.write("                <tr bgcolor=\"#7f8c8d\" style=\"color: black;\" ><td colspan=\"2\" align=\"center\"><h3>Acceso Administradores</h3></td></tr>\n");
      out.write("                <tr bgcolor=\"#7f8c8d\">\n");
      out.write("                    <td>Usuario:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"nombre\" onkeypress=\"return justLetters(event);\" onpaste=\"alertify.error('No se puede pegar'); return false\"/></td>\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("                <tr bgcolor=\"#7f8c8d\">\n");
      out.write("                    <td>Contraseña:</td>\n");
      out.write("                    <td><input type=\"text\" name=\"direccion\" onpaste=\"alertify.error('No se puede pegar');return false\"/> </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <tr bgcolor=\"#7f8c8d\">\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"hidden\" name=\"action\" value=\"registrar\"/>\n");
      out.write("                        <input type=\"submit\" value=\"Iniciar Sesión\" class=\"boton\" >\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
