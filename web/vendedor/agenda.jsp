<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

<%@page import="Objetos.FechaEvento"%>
<%@page import="Objetos.Evento"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Controlador.Consultas"%>
<%@page import="Calendario.Month"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@include file="../calendario/calendarCommon.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <script src="alertify/alertify.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/estiloMenu.css">
        <link rel="stylesheet" type="text/css" href="../css/colores.css">
        <link rel="stylesheet" href="../css/fonts.css"/>
        <link rel="stylesheet" href="../alertify/css/alertify.min.css"/>
        <title>Vendedor</title>
    </head>
    <% try{ 
           
    %>
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
        
        
        <div style="border: 1px solid;">
            
            <h1 style="color: white;">&nbsp;Nombre_Agenda</h1>
            
            
            
        </div>
        
        <div style="border: 1px solid; padding-left: 400px;">
<div id="calendar_main_div">
<table border="1" cellspacing="0" cellpadding="4" id="calendar_table">
  <tr>
    <td align="center" width="100%" colspan="7" class="month_year_header" style="color:white">
        <%=monthName%>, <%=intYear%>
    </td>
  </tr>
  <tr class="week_header_row" style="color: white;">
    <th width="14%" class="th_day_cell day">Domingo</th>
    <th width="14%" class="th_day_cell day">Lunes</th>
    <th width="14%" class="th_day_cell day">Martes</th>
    <th width="14%" class="th_day_cell day">Miercoles</th>
    <th width="14%" class="th_day_cell day">Jueves</th>
    <th width="15%" class="th_day_cell day">Viernes</th>
    <th width="15%" class="th_day_cell day">Sábado</th>
  </tr>
<%

        
%><p><%%></p><% 
  Month aMonth = Month.getMonth( Integer.parseInt(currentMonthString), Integer.parseInt(currentYearString) );
  int [][] days = aMonth.getDays();
  for( int i=0; i<aMonth.getNumberOfWeeks(); i++ ){
      %><tr class="week_data_row" style="color:white" align="center"><%
    for( int j=0; j<7; j++ ){
      if( days[i][j] == 0 ){
        %><td style="background: black" class="empty_day_cell">&nbsp;</td><%
      }
      else{

        // this is "today"
        if( currentDayInt == days[i][j] && currentMonthInt == aMonth.getMonth() && currentYearInt == aMonth.getYear() ){
          %><td style="background: blue;" class="today_cell"><%=days[i][j]%></td><%
              
        }else{ 
                
                FechaEvento fe = new FechaEvento(usuario);
            if(fe.obtenerDia(days[i][j],aMonth.getMonth(), aMonth.getYear()) == days[i][j] && 
                fe.obtenerMes(days[i][j],aMonth.getMonth(), aMonth.getYear()) == aMonth.getMonth() && 
                fe.obtenerYear(days[i][j],aMonth.getMonth(), aMonth.getYear()) == aMonth.getYear() ){



          %><td style="background: chartreuse; color: black" class="event_cell"><%=days[i][j]%></td><%
        }else{

          %>

          <td style="background: black" class="day_cell" id="celdaDia" onclick="seleccion()"><%=days[i][j]%></td>

          <% 
              
              }

              
        
      } // end outer if

        

    } // end for
}

}
    %>
    </tr>

</table>

<%-- end of "calendar_div" --%>
</div>

<!-- navigation links -->
<%-- sorry, i don't know how to get this look without a table --%>
<table id="calendar_nav_table" border="0">
  <tr>
    <td id="prev_link">
      <form method="post">
        <input type="submit" name="PREV" value=" << ">
        <input type="hidden" name="month" value="<%=prevMonth%>">
        <input type="hidden" name="year" value="<%=prevYear%>">
      </form>
    </td>
    <td id="link_to_month_view">
      <form action="calendarMonthPrintView.jsp" method="post">
        <input type="hidden" name="month" value="<%=intMonth%>">
        <input type="hidden" name="year"  value="<%=intYear%>">
      </form>
    </td>
    <td id="next_link">
      <form method="post">
        <input type="submit" name="NEXT" value=" >> ">
        <input type="hidden" name="month" value="<%=nextMonth%>">
        <input type="hidden" name="year" value="<%=nextYear%>">
      </form>
    </td>
  </tr>
</table>
  <!-- navigation links end -->
    </div>
      
      <div style="border: 1px solid; width: 50%; float: left;">
          <h3 style="color: white">&nbsp;Creación del Evento</h3>
          <form id="formularioEvento" action="../CreacionEvento" method="post">
          <table>
                
                <tr>
                    <td style="color: white">Fecha:</td>
                    <td><input name="fecha" type="date"></td>
                </tr>
                
                <tr>
                    <td style="color: white">Titulo:</td>
                    <td><input name="titulo" type="text"></td>
                </tr>
                
                <tr>
                    <td style="color: white">Ubicación: </td>
                    <td><input name="ubicacion" type="text"></td>
                    
                </tr>
                
                <tr>
                    <td style="color: white">Descripción:</td>
                    <td><textarea style="resize: none" name="descripcion" form="formularioEvento" rows="4" cols="50"></textarea></td>
    
                </tr>
                
                <tr>
                    <td style="color: white">Hora:</td>
                    <td><input name="hora" type="time"></td>
                    <td><input type="submit" value="Guardar Evento" /></td>
                </tr>
                
                <tr>
                    <td style="color:white">Evento Creado</td>
                </tr>
                
                </table>
              </form>
          
      </div>

      
      <div style="border: 1px solid; width: 49.5%; float: left;">
          <h3 style="color: white">&nbsp;Evento Seleccionado</h3>
           <form action="../SeleccionFecha" method="POST">
          <table>
                <tr>
                    <td style="color: white">Fecha:</td>
                   
                    <td><select style="width: 370px;" size="1" name="fechaSeleccionada">
                           
                            <%  LinkedList<Evento> listadoEventos = consultas.listadoEventos(usuario);
                                String fechaEvento="";
                             for (int i = 0; i < listadoEventos.size(); i++) {
                                Evento evento = listadoEventos.get(i);
                                 fechaEvento= evento.getFechaEvento();
                               
                %><option id="fechaCombo" value="<%=fechaEvento %>"><% out.println(fechaEvento);%></option><%
                             }

                             
                               
                %>
                        </select></td>

                        <td><input type="submit"  value="Mostrar Evento" /></td> 
                        
                        <tr>
               
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
