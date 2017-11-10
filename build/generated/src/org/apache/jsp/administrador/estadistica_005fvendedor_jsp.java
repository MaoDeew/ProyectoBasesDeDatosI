package org.apache.jsp.administrador;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Objetos.Estadistica;
import Controlador.Consultas;

public final class estadistica_005fvendedor_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <script type=\"text/javascript\" src=\"scriptValidacion.js\"></script>\n");
      out.write("        <script src=\"alertify/alertify.min.js\"></script>\n");
      out.write("        \n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/estiloMenu.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/tablaVendedores.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"../css/colores.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/fonts.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../alertify/css/alertify.min.css\"/>\n");
      out.write("        <title>Administrador - Estadistica Vendedores</title>\n");
      out.write("    </head>\n");
      out.write("    ");
 try{ 
      out.write("\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <nav> \t\n");
      out.write("\n");
      out.write("            <div align=\"center\" id=\"menu\">\n");
      out.write("                <a href=\"administrador.jsp\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-home\"></span> Inicio\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"crear_vendedores.jsp\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-users\"></span> Crear Vendedores\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"lista_vendedores.jsp\" class=\"button menu\" id=\"ListadoVendedores\">\n");
      out.write("                    <span class=\"icon-database\"></span> Listado Vendedores\n");
      out.write("                </a>\n");
      out.write("\n");
      out.write("                <a href=\"../estadistica_vendedor\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-log-out\"></span> Estadisticas\n");
      out.write("                </a>\n");
      out.write("                <a href=\"../CerrarSesion\" class=\"button menu\">\n");
      out.write("                    <span class=\"icon-log-out\"></span> Cerrar Sesión\n");
      out.write("                </a>\n");
      out.write("                \n");
      out.write("                <p id=\"nombreUsuario\">Bienvenido ");
 

                    HttpSession sesion = request.getSession();
                    String usuario = sesion.getAttribute("usuarioAdmin").toString();
                    Consultas consultas = new Consultas();
                    String resultado =consultas.obtenerNombreUsuarioAdministrador(usuario);
                    out.println(resultado);
                   
                    
                    
      out.write("</p>\n");
      out.write("        </nav>\n");
      out.write("        ");

            Estadistica est = consultas.estadisticaAdministrador(usuario);
        
      out.write("\n");
      out.write("                    <div align=\"center\">\n");
      out.write("        <script type=\"text/javascript\" src=\"canvasjs.min.js\"></script>\n");
      out.write("          <script type=\"text/javascript\">\n");
      out.write("        window.onload = function () {\n");
      out.write("          var cg=");
out.println(est.getContratosGuardados()); 
      out.write(";\n");
      out.write("          var ct=");
out.println(est.getContratosTramite()); 
      out.write("\n");
      out.write("          var cc=");
out.println(est.getContratosCompletados()); 
      out.write(";\n");
      out.write("          \n");
      out.write("          var chart = new CanvasJS.Chart(\"chartContainer\", {\n");
      out.write("              title:{\n");
      out.write("                text: \"Estadistica Vendedor\"              \n");
      out.write("               },\n");
      out.write("                theme:\"theme1\",\n");
      out.write("              \n");
      out.write("              data: [\n");
      out.write("              {\n");
      out.write("                  type: \"column\",\n");
      out.write("                  dataPoints: [\n");
      out.write("                  { label: \"Contratos Guardado\", y: cg },\n");
      out.write("                  { label: \"Contratos en Tramite\", y: ct },\n");
      out.write("                  { label: \"Contratos Completados\", y: cc }\n");
      out.write("                  ]\n");
      out.write("              }\n");
      out.write("              ]\n");
      out.write("          });\n");
      out.write(" \n");
      out.write("          chart.render();\n");
      out.write("      }\n");
      out.write("      \n");
      out.write("  </script>\n");
      out.write("  <div id=\"chartContainer\" style=\"height: 500px; width: 70%;\"></div>\n");
      out.write("    </body>\n");
      out.write("        ");
  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    
      out.write("\n");
      out.write("</html>");
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
