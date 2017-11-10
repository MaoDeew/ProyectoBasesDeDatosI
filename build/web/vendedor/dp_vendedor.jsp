<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

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
        <link rel="stylesheet" href="../css/formularios.css"/>
        <link rel="stylesheet" href="../css/fonts.css"/>
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
                    String resultado =consultas.obtenerNombreUsuarioVendedor(usuario);
                    out.print(resultado);

                    %></p>
        </nav>
        
        <div align="center">
            
            <% Vendedor vendedor = consultas.datosPersonalesVendedor(usuario); %>
           <form>
                <table>
                <h1>Datos Personales</h1>
                <tr>
                    <td style="color: white; font-size: 24px; ">Nombre:</td>
                    <td><input name="nombre" type="text" value="<%out.println(vendedor.getNombre());%>" disabled></td>
                </tr>
                
                <tr>
                    <td style="color: white; font-size: 24px; ">Apellido:</td>
                    <td><input name="apellido" type="text" value="<%out.println(vendedor.getApellido());%>" disabled></td>
                </tr>
                
                <tr>
                    <td style="color: white; font-size: 24px; ">Cedula:</td>
                    <td><input name="cedula" type="text" value="<%out.println(vendedor.getCedula());%>" disabled></td>
                </tr>
                
                <tr>
                    <td style="color: white; font-size: 24px; ">Teléfono:</td>
                    <td><input name="telefono" type="text" value="<%out.println(vendedor.getTelefono());%>" disabled></td>
                </tr>
                
                <tr>
                    <td style="color: white; font-size: 24px; ">Dirección:</td>
                    <td><input name="direccion" type="text" value="<%out.println(vendedor.getDireccion());%>" disabled></td>
                </tr>
                
                </table>
            </form>
            
            
        </div>
        
        
    </body>
    
    <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>
    
</html>
