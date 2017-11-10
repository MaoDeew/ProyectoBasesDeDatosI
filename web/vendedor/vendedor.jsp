<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

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

        <div style="padding-top: 75px;">

            <section class="slider-container">

                <ul id="slider" class="slider-wrapper">

                    <li class="slide-current">
                        <a href="productos.html"><img src="../js/slider/img/1.jpg" alt=""></a>
                    </li>

                    <li>
                        <a href="productos.html"><img src="../js/slider/img/2.jpg" alt=""></a>
                    </li>

                    <li>
                        <a href="productos.html"><img src="../js/slider/img/3.jpg" alt=""></a>
                    </li>

                    <li>
                        <a href="productos.html"><img src="../js/slider/img/4.jpg" alt=""></a>
                    </li>

                    <li>
                        <a href="somos.html"><img src="../js/slider/img/5.jpg" alt=""></a>
                    </li>

                    <li>
                        <a href="productos.html"><img src="../js/slider/img/6.jpg" alt=""></a>
                    </li>
                </ul>

                <ul id="slider-controls" class="slider-controls">
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>

            </section>

            <script src="../js/slider/js/jquery.min.js"></script>
            <script src="../js/slider/js/main.js"></script>


        </div>


    </body>

    <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>

</html>
