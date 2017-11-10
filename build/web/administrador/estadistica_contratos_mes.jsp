<%-- 
    Document   : estadistica_vendedor
    Created on : 16-may-2017, 17:47:32
    Author     : Pachomen
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="scriptValidacion.js"></script>
        <script src="alertify/alertify.min.js"></script>
        
        <link rel="stylesheet" type="text/css" href="../css/estiloMenu.css">
        <link rel="stylesheet" type="text/css" href="../css/tablaVendedores.css">
        <link rel="stylesheet" type="text/css" href="../css/colores.css">
        <link rel="stylesheet" href="../css/fonts.css"/>
        <link rel="stylesheet" href="../alertify/css/alertify.min.css"/>
        <title>Administrador - Estadistica</title>
    </head>
    <% try{ %>
    <body>
        
        <nav> 	

            <div align="center" id="menu">
                <a href="administrador.jsp" class="button menu">
                    <span class="icon-home"></span> Inicio
                </a>

                <a href="crear_vendedores.jsp" class="button menu">
                    <span class="icon-users"></span> Crear Vendedores
                </a>

                <a href="lista_vendedores.jsp" class="button menu" id="ListadoVendedores">
                    <span class="icon-database"></span> Listado Vendedores
                </a>

                <a href="estadisticas.jsp" class="button menu">
                    <span class="icon-area-graph"></span> Estadisticas
                </a>
                <a href="../CerrarSesion" class="button menu">
                    <span class="icon-log-out"></span> Cerrar Sesión
                </a>
                
                <p id="nombreUsuario">Bienvenido <% 

                    HttpSession sesion = request.getSession();
                    String usuario = sesion.getAttribute("usuarioAdmin").toString();
                    Consultas consultas = new Consultas();
                    String resultado =consultas.obtenerNombreUsuarioAdministrador(usuario);
                    out.println(resultado);
                   
                    
                    %></p>
        </nav>
        <%
            String[] year = consultas.obtenerContratosPorMes();
            int enero = Integer.parseInt(year[0]);
            int febrero = Integer.parseInt(year[1]);
            int marzo = Integer.parseInt(year[2]);
            int abril = Integer.parseInt(year[3]);
            int mayo = Integer.parseInt(year[4]);
            int junio = Integer.parseInt(year[5]);
            int julio = Integer.parseInt(year[6]);
            int agosto = Integer.parseInt(year[7]);
            int septiembre = Integer.parseInt(year[8]);
            int octubre = Integer.parseInt(year[9]);
            int noviembre = Integer.parseInt(year[10]);
            int diciembre = Integer.parseInt(year[11]);

        %>
                    <div id="Tabla1">
        <script type="text/javascript" src="../js/canvasjs.min.js"></script>
          <script type="text/javascript">
        window.onload = function () {
          var enero=<%=enero %>;
          var febrero=<%=febrero %>;
          var marzo=<%=marzo %>;
          var abril=<%=abril %>;
          var mayo=<%=mayo %>;
          var junio=<%=junio %>;
          var julio=<%=julio %>;
          var agosto=<%=agosto %>;
          var septiembre=<%=septiembre%>;
          var octubre=<%=octubre %>;
          var noviembre=<%=noviembre %>;
          var diciembre=<%=diciembre %>;

          var chart = new CanvasJS.Chart("chartContainer1", {
              title:{
                text: "Estadistica Contratos Por Mes"              
               },
                theme:"theme1",
              
              data: [
              {
                  type: "line",
                  dataPoints: [
                  { label: "Enero", y: enero},
                  { label: "Febrero", y: febrero},
                  { label: "Marzo", y: marzo},
                  { label: "Abril", y: abril},
                  { label: "Mayo", y: mayo},
                  { label: "Junio", y: junio},
                  { label: "Julio", y: julio},
                  { label: "Agosto", y: agosto},
                  { label: "Septiembre", y: septiembre},
                  { label: "Octubre", y: octubre},
                  { label: "Noviembre", y: noviembre},
                  { label: "Diciembre", y: diciembre}
                  
                  ]
              }
              ]
          });
          chart.render();
      };
      
  </script>
  <div id="chartContainer1" style="height: 450px; width: 100%;"></div>
  </div>
          
    </body>
        <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>
</html>