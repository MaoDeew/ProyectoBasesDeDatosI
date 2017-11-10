<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

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
        <link rel="stylesheet" type="text/css" href="../css/colores.css">
        <link rel="stylesheet" href="../css/fonts.css"/>
        <link rel="stylesheet" href="../alertify/css/alertify.min.css"/>
        <title>Administrador</title>
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
                    out.print(resultado);

                    %></p>
        </nav>
        
       <div align="center" style="color: white;">
            
            <h1>Bienvenido</h1>
            
            <p>En este aplicativo web, podras ver el registro de tus vendedores, ver cuantos
            contratos han subido al servidor, crear vendedores y revisar las estadisticas
            suficientes para los contratos que han sido subidos al servidos.</p>
            
            <p>Queda recordar, que solo el administrador puede crear vendedores.</p>
            
            <p>Gracias</p>
            
        </div>
        
    </body>
    <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>
    
</html>
