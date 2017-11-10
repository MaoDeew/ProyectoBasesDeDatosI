<%-- 
    Document   : index
    Created on : 4/03/2017, 10:30:02 PM
    Author     : Mao
--%>

<%@page import="Objetos.Archivo"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Controlador.Consultas"%>
<%@page import="java.io.*"%>
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
        <link rel="stylesheet" type="text/css" href="../css/tablaVendedores.css">
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
        
        <div style="border: 1px solid; width: 58%">
            <h1 style="font-family: sans-serif;">Subir Archivo</h1>
            
            <form name="formArchivosSubidos" action="archivos.jsp" method="POST" enctype="multipart/form-data">
                <%String mensaje="";
                String ubicacionArchivo="";
         
                String saveFile = new String();
                String contentType = request.getContentType();
                
                if((contentType != null) && (contentType.indexOf("multipart/form-data")>=0)){
                
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    
                    int formDataLength = request.getContentLength();
                    byte dataBytes[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
                    
                    while(totalBytesRead< formDataLength){
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                    }
                    
                    String file = new String(dataBytes);
                
                    saveFile = file.substring(file.indexOf("filename=\"")+10);
                    saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                    saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+1, saveFile.indexOf("\"") );
                    
                    int lastIndex = contentType.lastIndexOf("=");
                    
                    String boundary = contentType.substring(lastIndex+1, contentType.length());
                    
                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    
                    int boundaryLocation = file.indexOf(boundary,pos) - 4;
                    
                    int startPos = ((file.substring(0, pos ).getBytes())).length;
                    int endPos = ((file.substring(0, boundaryLocation).getBytes())).length;
                    
                    String nombreArchivoCompleto = saveFile;
                    try {
                    String extensionArchivo = nombreArchivoCompleto.split("\\.")[1];
                    String nombreArchivo = nombreArchivoCompleto.split("\\.")[0];
                    saveFile = "E:/DocumentosProgramacion/BaseDeDatos/I/Proyecto/web/archivosSubidos/" + saveFile;
                    ubicacionArchivo = "http://localhost:9090/Proyecto/archivosSubidos/"+nombreArchivoCompleto;
                    
                    consultas.subirArchivo(nombreArchivo, extensionArchivo, ubicacionArchivo, usuario);
                    
                    File archivo = new File(saveFile);
                    
                    
                        FileOutputStream fos = new FileOutputStream(archivo);
                        fos.write(dataBytes, startPos, (endPos-startPos));
                        fos.flush();
                        fos.close();
                        
                        
                        mensaje = "Se subio correctamente el archivo al sistema";
                        response.sendRedirect("http://localhost:9090/Proyecto/vendedor/archivos.jsp");
                        
                    } catch (Exception e) {mensaje="No se subio el archivo";}
                    
                  
                }
                
                %>
                <input type="file" name="archivo" value="" style="width: 3000px" />
     
                <input  type="submit" value="Subir Archivo" name="subir" style="width: 200px; position: absolute; left: 25%; top: 189px;"/>
   
            </form>
                <p style="width: 200px; position: absolute; left: 42%; top: 169px; font-family: sans-serif"><% out.println(mensaje);%></p>
            
        </div>
        
                <div style="border: 1px solid">
                    <input type="submit" value="Actualizar" style="width: 250px" onclick="history.go(0)"/>
                    <table>
                        
                        <%    
                            LinkedList<Archivo> lista = consultas.listadoArchivosVendedor(usuario);
                                
                                if(lista.size()==0){
                                    out.println("<h1>Aun no existen archivos subidos al sistema</h1>");
                                }else{
                                   String idEncabezado = "encabezado";
                                    out.println("<tr id= "+idEncabezado+" >");
                                    out.println("<td>Nombre Archivo</td>");
                                    out.println("<td>Tipo de Archivo</td>");
                                    out.println("<td>Extensión Archivo</td>");
                                    out.println("<td>Descargar</td>");
                                    out.println("</tr>");
                                    
                                for (int i = 0; i < lista.size(); i++) {
                                    
                                    
                                    String style="width:55px;height:55px";
                                    String center="center";
                                    
                                    out.println("<tr>");
                                    out.println("<td>" + lista.get(i).getNombre()+ "</td>");
                                    String linkArchivo = lista.get(i).getUbicacionArchivo();
                                    String linkImagen = lista.get(i).getUbicacionIcono();
                                    out.println("<td align="+center+">"+"<img src="+linkImagen+" style="+style+"></td>");
                                    out.println("<td>"+lista.get(i).getTipoArchivo()+"</td>");
                                    out.println("<td>"+"<a href="+linkArchivo+" download>Descargar</a></td>");
                                    
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
