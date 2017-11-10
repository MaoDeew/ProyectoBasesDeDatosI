<%-- 
    Document   : estadistica_vendedor
    Created on : 16-may-2017, 17:47:32
    Author     : Pachomen
--%>

<%@page import="Objetos.Estadistica2"%>
<%@page import="java.util.LinkedList"%>
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
            LinkedList<Estadistica2> listado= consultas.listadoContratosDepartamentos();
            
        %>
                  <div id="Tabla1">
        <script type="text/javascript" src="../js/canvasjs.min.js"></script>
          <script type="text/javascript">
        window.onload = function () {
        
        
          var ct=2;
          var cc=2;
          
          
          var chart1 = new CanvasJS.Chart("chartContainer1", {
              title:{
                text: "Contratos por Departamento"              
               },
                theme:"theme1",
              
              data: [
              {
                  type: "bar",
                  animationEnabled: true,
                                  
                  dataPoints: [
                  { label: "<%=listado.get(33).getNombreDepartamento() %>", y: <%=listado.get(33).getNumeroContratos() %> },
                  { label: "<%=listado.get(32).getNombreDepartamento() %>", y: <%=listado.get(32).getNumeroContratos() %> },
                  { label: "<%=listado.get(31).getNombreDepartamento() %>", y: <%=listado.get(31).getNumeroContratos() %> },
                  { label: "<%=listado.get(30).getNombreDepartamento() %>", y: <%=listado.get(30).getNumeroContratos() %> },
                  { label: "<%=listado.get(29).getNombreDepartamento() %>", y: <%=listado.get(29).getNumeroContratos() %> },
                  { label: "<%=listado.get(28).getNombreDepartamento() %>", y: <%=listado.get(28).getNumeroContratos() %> },
                  { label: "<%=listado.get(27).getNombreDepartamento() %>", y: <%=listado.get(27).getNumeroContratos() %> },
                  { label: "<%=listado.get(26).getNombreDepartamento() %>", y: <%=listado.get(26).getNumeroContratos() %> },
                  { label: "<%=listado.get(25).getNombreDepartamento() %>", y: <%=listado.get(25).getNumeroContratos() %> },
                  { label: "<%=listado.get(24).getNombreDepartamento() %>", y: <%=listado.get(24).getNumeroContratos() %> },
                  { label: "<%=listado.get(23).getNombreDepartamento() %>", y: <%=listado.get(23).getNumeroContratos() %> },
                  { label: "<%=listado.get(22).getNombreDepartamento() %>", y: <%=listado.get(22).getNumeroContratos() %> },
                  { label: "<%=listado.get(21).getNombreDepartamento() %>", y: <%=listado.get(21).getNumeroContratos() %> },
                  { label: "<%=listado.get(20).getNombreDepartamento() %>", y: <%=listado.get(20).getNumeroContratos() %> },
                  { label: "<%=listado.get(19).getNombreDepartamento() %>", y: <%=listado.get(19).getNumeroContratos() %> },
                  { label: "<%=listado.get(18).getNombreDepartamento() %>", y: <%=listado.get(18).getNumeroContratos() %> },
                  { label: "<%=listado.get(17).getNombreDepartamento() %>", y: <%=listado.get(17).getNumeroContratos() %> },
                  { label: "<%=listado.get(16).getNombreDepartamento() %>", y: <%=listado.get(16).getNumeroContratos() %> },
                  { label: "<%=listado.get(15).getNombreDepartamento() %>", y: <%=listado.get(15).getNumeroContratos() %> },
                  { label: "<%=listado.get(14).getNombreDepartamento() %>", y: <%=listado.get(14).getNumeroContratos() %> },
                  { label: "<%=listado.get(13).getNombreDepartamento() %>", y: <%=listado.get(13).getNumeroContratos() %> },
                  { label: "<%=listado.get(12).getNombreDepartamento() %>", y: <%=listado.get(12).getNumeroContratos() %> },
                  { label: "<%=listado.get(11).getNombreDepartamento() %>", y: <%=listado.get(11).getNumeroContratos() %> },
                  { label: "<%=listado.get(10).getNombreDepartamento() %>", y: <%=listado.get(10).getNumeroContratos() %> },
                  { label: "<%=listado.get(9).getNombreDepartamento() %>", y: <%=listado.get(9).getNumeroContratos() %> },
                  { label: "<%=listado.get(8).getNombreDepartamento() %>", y: <%=listado.get(8).getNumeroContratos() %> },
                  { label: "<%=listado.get(7).getNombreDepartamento() %>", y: <%=listado.get(7).getNumeroContratos() %> },
                  { label: "<%=listado.get(6).getNombreDepartamento() %>", y: <%=listado.get(6).getNumeroContratos() %> },
                  { label: "<%=listado.get(5).getNombreDepartamento() %>", y: <%=listado.get(5).getNumeroContratos() %> },
                  { label: "<%=listado.get(4).getNombreDepartamento() %>", y: <%=listado.get(4).getNumeroContratos() %> },
                  { label: "<%=listado.get(3).getNombreDepartamento() %>", y: <%=listado.get(3).getNumeroContratos() %> },
                  { label: "<%=listado.get(2).getNombreDepartamento() %>", y: <%=listado.get(2).getNumeroContratos() %> },
                  { label: "<%=listado.get(1).getNombreDepartamento() %>", y: <%=listado.get(0).getNumeroContratos() %> },
                  { label: "<%=listado.get(0).getNombreDepartamento() %>", y: <%=listado.get(0).getNumeroContratos() %> },
                  ]
              }
              ]
          });
 
          chart1.render();
          
      };
      
  </script>
  <div id="chartContainer1" style="height: 4500px; width: 100%;"></div>

  </div>
          
    </body>
        <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>
</html>