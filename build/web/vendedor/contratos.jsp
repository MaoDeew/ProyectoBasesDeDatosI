    <%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>


<%@page import="Objetos.ContratoGuardado"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Objetos.Contrato"%>
<%@page import="Objetos.Departamento"%>
<%@page import="Objetos.Tipo"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="Objetos.Categoria"%>
<%@page import="java.util.LinkedList"%>
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
        <link rel="stylesheet" href="../css/formularioContrato.css"/>
        <link rel="stylesheet" href="../css/fonts.css"/>
        <link rel="stylesheet" href="../alertify/css/alertify.min.css"/>
        <title>Vendedor</title>
    </head>
    <% try{ %>
    <body>
        
        <nav> 	

            <div align="center" id="menu">
                <a href="vendedor.jsp?pg=0" class="button menu">
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
        
        
        
        <div style="border: 1px solid; width: 49.5%; float: left;">
            
            <%  
                
                
                String entidad="";
                        String categoria="";
                        String tipoProceso="";
                        String departamento="";
                        String presupuestoSigno="";
                        String valorPresupuesto="";
                        String fechaDesde="";
                        String fechaHasta="";
                        int pg=0;
            
               // LinkedList<Contrato> listaBusqueda = consultas.listadoBusquedaContratos(entidad, categoria, tipoProceso, departamento, presupuestoSigno, valorPresupuesto, fechaDesde, fechaHasta, ((pg)*5));         
            
            %>
            
          <h2 style="color: white">&nbsp;Buscador de contratos</h2>
          <form action="?pg=0" method="post">
          <table>
              
                <tr>
                    <td style="color: white; background: #2d343d; ">Entidad (opcional):</td>
                    <td style="background: #2d343d;"><input name="entidad" type="text"></td>
                </tr>
                
                <tr>
                    <td style="color: white; background: #2d343d">Categoria:</td>
                    <td style="background: #2d343d;"><select style="width: 370px;" size="1" name="categorias">
                            <option>Todos</option>
                            <% LinkedList<Categoria> listadoCategorias = consultas.listadoCategorias();
                             for (int i = 0; i < listadoCategorias.size(); i++) {
                                int idCategoria = listadoCategorias.get(i).getId();
                                String nombreCategoria = listadoCategorias.get(i).getNombreCategoria();
                            %><option value="<% out.println(idCategoria); %>"><% out.println(nombreCategoria); %></option><%
                             } %>
                        </select></td>
                        
                </tr>
                
                <tr>
                    <td style="color: white; background: #2d343d;">Tipo de proceso:</td>
                    <td style="background: #2d343d;"><select style="width: 370px;" size="1" name="tipos">
                            <option>Todos</option>
                            <% LinkedList<Tipo> listadoTipos = consultas.listadoTipos();
                             for (int i = 0; i < listadoTipos.size(); i++) {
                                int idTipo = listadoTipos.get(i).getIdTipo();
                                String nombreTipo = listadoTipos.get(i).getNombreTipo();
                            %><option value="<% out.println(idTipo); %>"><% out.println(nombreTipo); %></option><%
                             } %>
                        </select></td>
                        
                </tr>
                
     
                <tr>
                    <td style="color: white; background: #2d343d;">Departamento en ejecución: </td>
                    <td style="background: #2d343d;"><select id="idDepto" style="width: 370px;" size="1" name="deptos">
                            <option>Todos</option>
                            <% LinkedList<Departamento> listadoDepartamentos = consultas.listadoDepartamentos();
                             for (int i = 0; i < listadoDepartamentos.size(); i++) {
                                int idDepartamento = listadoDepartamentos.get(i).getId();
                                String nombreDepartamento = listadoDepartamentos.get(i).getNombreDepartamento();
                            %><option value="<% out.println(idDepartamento); %>"><% out.println(nombreDepartamento); %></option><%
                             } %>
                        </select></td>
                        
                </tr>
                
                <tr>
                    <td style="color: white; background: #2d343d">Presupuesto: </td>
                    <td style="background: #2d343d;"><select style="width: 50px;" size="1" name="presupuestoSigno">
                            <option value=">">></option>
                            <option value="<"><</option>
                            <option value="=">=</option>
                        </select>
                    
                        <input type="text" name="valorPresupuesto" value="" />
                    
                    </td>

                </tr>
                
                <tr style="background: #2d343d;">
                    <td style="color: white">Publicado desde: </td>
                    <td>
                        <input type="date" name="fechaDesde" value="" />
                    </td>

                </tr>
                
                 <tr style="background: #2d343d;">
                    <td style="color: white">Publicado hasta: </td>
                    <td>
                        <input type="date" name="fechaHasta" value="" />
                        <input type="submit" value="Buscar" />
                    </td>

                </tr>
               
                </table>
                        
                        <%
                        entidad = request.getParameter("entidad");
                        categoria = request.getParameter("categorias");
                        tipoProceso = request.getParameter("tipos");
                        departamento = request.getParameter("deptos");
                        presupuestoSigno = request.getParameter("presupuestoSigno");
                        valorPresupuesto = request.getParameter("valorPresupuesto");
                        fechaDesde = request.getParameter("fechaDesde");
                        fechaHasta = request.getParameter("fechaHasta");
                        pg=0;
                        
                       sesion.setAttribute("entidadBusqueda", entidad); 
                sesion.setAttribute("categoriaBusqueda", categoria);
                sesion.setAttribute("tipoProcesoBusqueda", tipoProceso);
                sesion.setAttribute("departamentoBusqueda", departamento);
                sesion.setAttribute("presupuestoSignoBusqueda", presupuestoSigno);
                sesion.setAttribute("valorPresupuestoBusqueda", valorPresupuesto);
                sesion.setAttribute("fechaDesdeBusqueda", fechaDesde);
                sesion.setAttribute("fechaHastaBusqueda", fechaHasta);
                         
                        %>
          </form>
           
      </div>
         
                        
        <div style="width: 49.5%; border: 1px solid; float: left;">
            
            <h2 style="color:white;">Contratos guardados</h2>
            
            <table>
            <% 
            
            
           LinkedList<ContratoGuardado> listaContratosGuardados = consultas.listadoContratosGuardados(usuario);
                                
                                if(listaContratosGuardados.size()==0){
                                    out.println("<h1>Aun no existen contratos guardados al sistema</h1>");
                                }else{
                                   String idEncabezado = "encabezado";
                                   String center="center";
                                    out.println("<tr id= "+idEncabezado+" >");
                                    out.println("<td>ID Contrato Guardado</td>");
                                    out.println("<td>ID Contrato</td>");
                                    out.println("<td>Estado Actual</td>");
                                    out.println("<td>Favoritos</td>");
                                    out.println("<td>En proceso</td>");
                                    out.println("<td>Completado</td>");
                                    out.println("</tr>");
                                    
                                for (int i = 0; i < listaContratosGuardados.size(); i++) {
                                    
                                    
                                    String link="contratos.jsp";
                                    
                                    
                                    String linkImagenFavorito = "http://localhost:9090/Proyecto/iconosEstados/favorito.png";
                                    String linkImagenEnProceso = "http://localhost:9090/Proyecto/iconosEstados/enProceso.png";
                                    String linkImagenCompletado = "http://localhost:9090/Proyecto/iconosEstados/completado.png";
                                    
                                    ContratoGuardado cg = listaContratosGuardados.get(i);
                                    
                                    out.println("<tr>");
                                    out.println("<td align="+center+">" + cg.getIdContratoGuardado()+ "</td>");
                                   out.println("<td align="+center+">"+cg.getIdContrato()+"</td>");
                                    
                                    String style="width:55px;height:55px";
                                    if(cg.getNombreEstado().equals("Favoritos")){
                                        
                                        out.println("<td align="+center+">"+"<img src="+linkImagenFavorito+" style="+style+">"+"</td>");
                                        out.println("<td align="+center+">------</td>");
                                        out.println("<td align="+center+">"+"<a href=\"../CambiarEstadoContratoGuardado?idContratoGuardado="+cg.getIdContratoGuardado()+"&idNuevoEstado="+2+"\">"+"<img src="+linkImagenEnProceso+" style="+style+">"+"</a></td>");
                                        out.println("<td align="+center+">"+"<a href=\"../CambiarEstadoContratoGuardado?idContratoGuardado="+cg.getIdContratoGuardado()+"&idNuevoEstado="+3+"\">"+"<img src="+linkImagenCompletado+" style="+style+">"+"</a></td>");
                                    }
                                    
                                    
                                    if(cg.getNombreEstado().equals("En proceso")){
                                        out.println("<td align="+center+">"+"<img src="+linkImagenEnProceso+" style="+style+">"+"</td>");
                                        out.println("<td align="+center+">"+"<a href=\"../CambiarEstadoContratoGuardado?idContratoGuardado="+cg.getIdContratoGuardado()+"&idNuevoEstado="+1+"\">"+"<img src="+linkImagenFavorito+" style="+style+">"+"</a></td>");
                                        out.println("<td align="+center+">------</td>");
                                        out.println("<td align="+center+">"+"<a href=\"../CambiarEstadoContratoGuardado?idContratoGuardado="+cg.getIdContratoGuardado()+"&idNuevoEstado="+3+"\">"+"<img src="+linkImagenCompletado+" style="+style+">"+"</a></td>");
                                    }
                                    
                                    if(cg.getNombreEstado().equals("Completado")){
                                        out.println("<td align="+center+">"+"<img src="+linkImagenCompletado+" style="+style+">"+"</td>");
                                        out.println("<td align="+center+">"+"<a href=\"../CambiarEstadoContratoGuardado?idContratoGuardado="+cg.getIdContratoGuardado()+"&idNuevoEstado="+1+"\">"+"<img src="+linkImagenFavorito+" style="+style+">"+"</a></td>");
                                        out.println("<td align="+center+">"+"<a href=\"../CambiarEstadoContratoGuardado?idContratoGuardado="+cg.getIdContratoGuardado()+"&idNuevoEstado="+2+"\">"+"<img src="+linkImagenEnProceso+" style="+style+">"+"</a></td>");
                                        out.println("<td align="+center+">------</td>");
                                    }
                                    
                                    
                                    
                                    
                                    
                                    out.println("</tr>");
                                }
                                }

            
            %>
            </table>
            
        </div>
        
        <div style="border: 1px solid; clear: both">

            
            <h3 style="color: white">&nbsp;Resultado Busqueda: </h3>
            
            <div id="paginacion">
            <% 
                
            
                if(request.getParameter("pg")==null){
                    pg=0;
                }else{
                
                pg=Integer.parseInt(request.getParameter("pg"));
                }
                
                //int size=10;
                int size=consultas.sizeBusquedaContratos(entidad, categoria, tipoProceso, departamento, presupuestoSigno, valorPresupuesto, fechaDesde, fechaHasta);
                //int size=consultas.sizeBusquedaContratos("", "Todos", "Todos", "Todos", ">", "", "2016-05-20", "2017-05-20");
                
             if(size!=0){
                
            for(int i=0; i<10; i++){
            %>
            <a style="margin:5px; 
               background: #45484d;
               color:white;
               text-decoration:none;
               padding: 5px;
               display:inline-block;" href="?pg=<%=i+1%>&entidad=<%=entidad %>&categoria=<%=categoria %>&tipoProceso=<%=tipoProceso %>&departamento=<%=departamento %>&presupuestoSigno=<%=presupuestoSigno %>&valorPresupuesto=<%=valorPresupuesto %>&fechaDesde=<%=fechaDesde %>&fechaHasta=<%=fechaHasta %>"><%=i+1%></a>
               
            <% }
                
                
            %>
            <p>Se encontraron: <strong><%=size %></strong> contratos</p>     
            
                <form action="../GuardarContrato" method="POST">
                    <table>
                        
<%
                String idEncabezado = "encabezado";
                                    out.println("<tr id= "+idEncabezado+" >");
                                    out.println("<td>ID-Contrato</td>");
                                    out.println("<td style=\"width: 750px;\">Objeto</td>");
                                    out.println("<td>Descripción</td>");
                                    out.println("<td>Guardar</td>");
                                    out.println("</tr>");
                                    
                                
                                    
                                   
                                    LinkedList<Contrato> listaBusqueda = consultas.listadoBusquedaContratos(entidad, categoria, tipoProceso, departamento, presupuestoSigno, valorPresupuesto, fechaDesde, fechaHasta, ((pg)*5));
                                    //LinkedList<Contrato> listaBusqueda = consultas.listadoBusquedaContratos("", "Todos", "Todos", "Todos", ">", "", "2016-05-20", "2017-05-20", ((pg)*5));
        
                                    
                                for (int i = 0; i < listaBusqueda.size(); i++) {
                                    Contrato c = listaBusqueda.get(i);
                                    NumberFormat conMoneda = NumberFormat.getCurrencyInstance();
                                    int presupuesto = c.getPresupuesto();
                                    String visualizacionPresupuesto = conMoneda.format(presupuesto);
                                    out.println("<tr>");
                                    out.println("<td><p>"+c.getIdContrato()+"</p></td>");
                                    out.println("<td>" + c.getObjeto()+ "</td>");
                                    out.println("<td>"+
            						"<p><strong>Fecha Publicación:</strong> "+c.getFechaPublicacion()+"</p>"+
            						"<p><strong>Hora Publicacion:</strong> "+c.getHoraPublicacion()+"</p>"+
							"<p><strong>Número de Proceso:</strong> "+c.getNumeroProceso()+"</p>"+
            						"<p><strong>Departamento en Ejecución:</strong> "+c.getDepartamento()+"</p>"+
            						"<p><strong>Presupuesto:</strong> "+visualizacionPresupuesto+"</p>"+
                                                        "<p><strong>Pagina Web:</strong> "+"<a href=\""+c.getPaginaWeb()+"\" target=\"_blank\">Link</a>"+"</p>"+
							"</td>");
                                    String blank ="_blank";
                                    //out.println("<input name=\"idContrato\" type=\"hidden\" value=\""+c.getIdContrato()+"\">");
                                    out.println("<td> <a href=\"../GuardarContrato?idContrato="+c.getIdContrato()+"\">Guardar</a> </td>");
                                    //out.println("<td><input type=\"submit\" value=\"Guardar\" /></td>");
                                    out.println("</tr>");
                                
                                }


                %> 
                    </table>
                    </form>
                <div id="resultado" style="padding: 5px; padding-top: 20px;">
                    
                    
                    
                    <p id="idDepartamento"></p>
                    
                </div>
                
                <%


}else{
         if(entidad==null || fechaDesde==null || fechaHasta==null || valorPresupuesto==null){
            out.println("<h3 style=\"color: white\">&nbsp;Aun no ha realizado la busqueda </h3>");
        }else{   
        out.println("<h3 style=\"color: white\">&nbsp;No se encontraron contratos, con esos parametros </h3>");
}
}%></div>
            
            
           
        </div>
        
    </body>
    
    <% }catch (NullPointerException e) {
            response.sendRedirect("../mensaje_error.jsp");
            session.invalidate();
        }%>
    
</html>
