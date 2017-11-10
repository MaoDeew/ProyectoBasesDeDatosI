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
        <link rel="stylesheet" type="text/css" href="../css/tablaVendedores.css">
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
                        
                                LinkedList<Vendedor> lista = consultas.listadoVendedores(usuario);
                        %>
                    <div align="center">
                        <h1>Listado Vendedores,  Vendedores=<%out.println(lista.size());%></h1>

                        <table>
                            <%  
                                
                                    if(lista.size()==0){
                                        out.println("<h1>Aun no existen vendedores registrados</h1>");
                                    }else{
                                       String idEncabezado = "encabezado";
                                        out.println("<tr id= "+idEncabezado+" >");
                                        out.println("<td>id Vendedor</td>");
                                        out.println("<td>Usuario</td>");
                                        out.println("<td>Nombre</td>");
                                        out.println("<td>Apellido</td>");
                                        out.println("<td>Telefono</td>");
                                        out.println("<td>Ultimo Inicio de sesión</td>");
                                        out.println("</tr>");

                                    for (int i = 0; i < lista.size(); i++) {
                                        out.println("<tr>");
                                        out.println("<td>" + lista.get(i).getIdVendedor()+ "</td>");
                                        out.println("<td>" + lista.get(i).getUsuario()+ "</td>");
                                        out.println("<td>" + lista.get(i).getNombre() + "</td>");
                                        out.println("<td>" + lista.get(i).getApellido() + "</td>");
                                        out.println("<td>" + lista.get(i).getTelefono() + "</td>");
                                        out.println("<td>" + lista.get(i).getFechaLogIn()+ "</td>");
                                        out.println("</tr>");
                                    }
                                    }
                                
                                
                            %>
                        </table>


                    </div>
        
    </body>
    <%  } catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }

    %>

</html>
