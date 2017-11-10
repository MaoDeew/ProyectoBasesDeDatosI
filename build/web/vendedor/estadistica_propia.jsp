<%-- 
    Document   : estadistica_propia
    Created on : 16-may-2017, 21:03:18
    Author     : Pachomen
--%>

<%@page import="Objetos.Estadistica1"%>
<%@page import="java.util.Date"%>
<%@page import="Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="alertify/alertify.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/estiloMenu.css">
        <link rel="stylesheet" type="text/css" href="../css/colores.css">
        <link rel="stylesheet" href="../css/fonts.css"/>
        <link rel="stylesheet" href="../css/slider.css"/>
        <link rel="stylesheet" href="../alertify/css/alertify.min.css"/>
        <title>Vendedor</title>
    </head>
    <% try{ %>
    <body>

        <nav> 	

            <div align="center" id="menu">
                <a href="vendedor.jsp" class="button menu">
                    <span class="icon-home"></span> Inicio
                </a>

                <a href="contratos.jsp" class="button menu">
                    <span class="icon-documents"></span> Contratos
                </a>

                <a href="agenda.jsp" class="button menu" id="Agenda">
                    <span class="icon-clipboard"></span> Agenda
                </a>

                <a href="archivos.jsp" class="button menu">
                    <span class="icon-archive"></span> Archivos
                </a>
                
                <a href="estadistica_propia.jsp" class="button menu">
                    <span class="icon-area-graph"></span> Estadisticas
                </a>
                
                <a href="dp_vendedor.jsp" class="button menu" id="DatosPersonales">
                    <span class="icon-info"></span> Datos Personales
                </a>
                
                <a href="../CerrarSesionVendedor" class="button menu">
                    <span class="icon-log-out"></span> Cerrar Sesión
                </a>

                <p id="nombreUsuario">Bienvenido <%
                    

                        HttpSession sesion = request.getSession();

                        String usuario = sesion.getAttribute("usuarioVendedor").toString();
                        Consultas consultas = new Consultas();
                        String resultado = consultas.obtenerNombreUsuarioVendedor(usuario);
                        out.print(resultado);

                    

                    %></p>
                </nav>
        <%
            Estadistica1 est = consultas.estadisticaVendedor(usuario);
        %>
                    <div align="center">
        <script type="text/javascript" src="../js/canvasjs.min.js"></script>
          <script type="text/javascript">
        window.onload = function () {
          var cg=<%out.println(est.getContratosGuardados()); %>;
          var ct=<%out.println(est.getContratosTramite()); %>
          var cc=<%out.println(est.getContratosCompletados()); %>;
          
          var chart = new CanvasJS.Chart("chartContainer", {
              title:{
                text: "Estadistica Vendedor"              
               },
                theme:"theme2",
              
              data: [
              {
                  type: "column",
                  dataPoints: [
                  { label: "Contratos en Favoritos", y: cg },
                  { label: "Contratos en Tramite", y: ct },
                  { label: "Contratos Completados", y: cc }
                  ]
              }
              ]
          });
 
          chart.render();
      }
      
  </script>
  <div id="chartContainer" style="height: 500px; width: 80%;"></div>
    </body>
        <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>
</html>