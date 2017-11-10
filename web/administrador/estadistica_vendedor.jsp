<%-- 
    Document   : estadistica_vendedor
    Created on : 16-may-2017, 17:47:32
    Author     : Pachomen
--%>

<%@page import="Objetos.Estadistica1"%>
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
        <title>Administrador - Estadistica Vendedores</title>
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
            Estadistica1 est = consultas.estadisticaAdministrador(usuario);
        %>
                    <div id="Tabla1">
        <script type="text/javascript" src="../js/canvasjs.min.js"></script>
          <script type="text/javascript">
        window.onload = function () {
          var cg=<%out.println(est.getContratosGuardados()); %>;
          var ct=<%out.println(est.getContratosTramite()); %>
          var cc=<%out.println(est.getContratosCompletados()); %>;
          
          var chart1 = new CanvasJS.Chart("chartContainer1", {
              title:{
                text: "Estadistica Vendedor"              
               },
                theme:"theme1",
              
              data: [
              {
                  type: "column",
                  dataPoints: [
                  { label: "Contratos Guardado", y: cg },
                  { label: "Contratos en Tramite", y: ct },
                  { label: "Contratos Completados", y: cc }
                  ]
              }
              ]
          });
 
          chart1.render();
          
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