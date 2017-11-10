<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Objetos.Vendedor"%>
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
        <title>Administrador - Listado Vendedores</title>
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
                        
                        %>
                    <div align="center">
                        <h1 style="color: white">Estadisticas</h1>
                        <table>
                            <tr>
                                
                                <td><a style="background: #2980b9" href="estadistica_vendedor.jsp" class="button menu">
                                <span class="icon-area-graph"></span> Contratos Guardados Vendedores
                                    </a> </td>
                                    
                                <td><a style="background: #2980b9" href="estadistica_contratos_mes.jsp" class="button menu">
                                <span class="icon-area-graph"></span> Contratos subidos por mes
                                    </a> </td>
                                    
                                    <td><a style="background: #2980b9" href="estadistica_contratos_depto.jsp" class="button menu">
                                <span class="icon-area-graph"></span> Contratos subidos por departamento
                                    </a> </td>
                            <tr>
                        </table>
                    </div>
        
    </body>
    <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>

</html>
