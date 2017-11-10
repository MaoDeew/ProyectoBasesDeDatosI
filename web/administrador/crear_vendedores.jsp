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
        <script type="text/javascript" src="../js/scriptValidacion.js"></script>
        <script src="../alertify/alertify.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/estiloMenu.css">
        <link rel="stylesheet" type="text/css" href="../css/colores.css">
        <link rel="stylesheet" href="../css/fonts.css"/>
        <link rel="stylesheet" href="../css/formularios.css"/>
        <link rel="stylesheet" href="../alertify/css/alertify.min.css"/>
        <title>Administrador - Crear Vendedores</title>
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
        
        <div align="center">
            
            <form class="formularioRegistroVendedor" action="../RegistrarVendedores" method="post">
                
                <h1>Registro del Vendedor</h1>
                <input name="nombre" type="text" placeholder="Nombre" onkeypress="return justLetters(event);" onpaste="alertify.error('No se puede pegar'); return false">
                <input name="apellido" type="text" placeholder="Apellido" onkeypress="return justLetters(event);" onpaste="alertify.error('No se puede pegar'); return false">
                <input name="cedula" type="text" placeholder="Cedula" onkeypress="return justNumbers(event);" onpaste="alertify.error('No se puede pegar'); return false" >
                <input name="telefono" type="text" placeholder="Teléfono" onkeypress="return justNumbers(event);" onpaste="alertify.error('No se puede pegar'); return false" >
                <input name="direccion" type="text" placeholder="Dirección" onpaste="alertify.error('No se puede pegar'); return false">
                <input name="usuarioVendedor" type="text" placeholder="Usuario" onpaste="alertify.error('No se puede pegar'); return false">
                <input name="password" type="password" placeholder="Contraseña" onpaste="alertify.error('No se puede pegar'); return false">
                <input type="submit" value="Registrar Vendedor">
                
                
            </form>
          
        </div>
        
    </body>
    <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>
</html>
