package org.apache.jsp.vendedor;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Controlador.Consultas;

public final class agenda_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <script type=\"text/javascript\" src=\"scriptValidacion.js\"></script>\n");
      out.write("        <script src=\"alertify/alertify.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estiloMenu.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/colores.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/fonts.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../alertify/css/alertify.min.css\"/>\n");
      out.write("        <title>Vendedor</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <nav> \t\n");
      out.write("\n");
      out.write("            <div align=\"center\" id=\"menu\">\n");
      out.write("                <a href=\"vendedor.jsp\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-home\"></span> Inicio\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"contratos.jsp\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-documents\"></span> Contratos\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"agenda.jsp\" class=\"button menu\" id=\"Agenda\">\n");
      out.write("                    <span class=\"icon-clipboard\"></span> Agenda\n");
      out.write("                </a>\n");
      out.write("                \n");
      out.write("                <a href=\"agenda.jsp\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-archive\"></span> Archivos\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"dp_vendedor.jsp\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-info\"></span> Datos Personales\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"../CerrarSesionVendedor\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-log-out\"></span> Cerrar Sesión\n");
      out.write("                </a>\n");
      out.write("                \n");
      out.write("                <p id=\"nombreUsuario\">Bienvenido ");
 

                    HttpSession sesion = request.getSession();
                    String usuario = sesion.getAttribute("usuarioVendedor").toString();
                    Consultas consultas = new Consultas();
                    String resultado =consultas.obtenerNombreUsuarioVendedor(usuario);
                    out.print(resultado);

                    
      out.write("</p>\n");
      out.write("        </nav>\n");
      out.write("        \n");
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
