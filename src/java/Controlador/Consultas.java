/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Objetos.Categoria;
import Objetos.Vendedor;
import Objetos.Archivo;
import Objetos.Contrato;
import Objetos.ContratoGuardado;
import Objetos.Departamento;
import Objetos.Estadistica1;
import Objetos.Estadistica2;
import Objetos.Evento;
import Objetos.Tipo;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.LinkedList;

/**
 *
 * @author Mao
 */
public class Consultas extends Conexion{
    
    
    public boolean autenticarAdministrador(String usuario, String password){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="SELECT * FROM Administrador WHERE usuario=? AND password=md5(?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            if (rs.absolute(1)) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return false;
    }
     
    public boolean autenticarVendedor(String usuario, String password){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="SELECT * FROM Vendedor WHERE usuario=? AND password=md5(?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, password);
            rs = pst.executeQuery();
            
            if (rs.absolute(1)) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return false;
    }
    
    public boolean registrarVendedor(String nombre, String apellido, String cedula,String telefono, String direccion,
            String usuarioVendedor, String password,String usuarioAdmin){
    
        PreparedStatement pst=null;
        Date fechaCreacion = new Date();
        SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
        String fechaVisualizada = formatoFecha.format(fechaCreacion);
        try {
            String consulta = "INSERT INTO Vendedor (nombre,apellido,cedula,telefono,direccion,usuario,password,id_administrador,fechaLogin) VALUES(?,?,?,?,?,?,md5(?),(SELECT id_administrador FROM Administrador WHERE usuario=?),?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, apellido);
            pst.setString(3, cedula);
            pst.setString(4, telefono);
            pst.setString(5, direccion);
            pst.setString(6, usuarioVendedor);
            pst.setString(7, password);
            pst.setString(8, usuarioAdmin);
            pst.setString(9, fechaVisualizada);
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }
        
        return false;
    }
    
    public String obtenerNombreUsuarioAdministrador(String usuario){
    PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="SELECT nombre FROM Administrador WHERE usuario=?"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            rs = pst.executeQuery();

                while (rs.next()) {                    
                    String resultado = rs.getString("nombre");
                    return resultado;
                }


        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return "vacio";
    }
    
    public String obtenerNombreUsuarioVendedor(String usuario){
    PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="SELECT nombre FROM Vendedor WHERE usuario=?"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            rs = pst.executeQuery();

                while (rs.next()) {                    
                    String resultado = rs.getString("nombre");
                    return resultado;
                }


        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return "vacio";
    }
    
    public LinkedList<Vendedor> listadoVendedores(String usuarioAdmin){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Vendedor> lista = new LinkedList<>();
        try {
            
            String consulta ="SELECT * FROM Vendedor "
                    + "WHERE id_administrador=(SELECT id_administrador FROM Administrador WHERE usuario=?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioAdmin);
            rs = pst.executeQuery();
            while (rs.next()) {
                Vendedor vendedor = new Vendedor();
                vendedor.setIdVendedor(rs.getInt("id_vendedor"));
                vendedor.setNombre(rs.getString("nombre"));
                vendedor.setApellido(rs.getString("apellido"));
                vendedor.setCedula(rs.getString("cedula"));
                vendedor.setDireccion(rs.getString("direccion"));
                vendedor.setTelefono(rs.getString("telefono"));
                vendedor.setUsuario(rs.getString("usuario"));
                vendedor.setFechaLogIn(rs.getDate("fechaLogin").toString());
                lista.add(vendedor);
                
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public boolean fechaLogInVendedor(String fechaLogIn, String usuario){
    
        PreparedStatement pst = null;
        
        try {
            String consulta = "UPDATE Vendedor SET fechaLogIn=? WHERE usuario=?"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, fechaLogIn);
            pst.setString(2, usuario);
            
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }finally {

            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                
                if (pst!= null) {
                    pst.close();
                }
                
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
            
            
        
        }
        
        return false;
    
    }
    
    public boolean estadisticaVendedorEnCeros(String usuarioVendedor){
    
        PreparedStatement pst=null;
        
        try {
            String consulta = "INSERT INTO EstadisticaVendedor (numero_contratos,numero_contratos_tramite,numero_contratos_completados,numero_contratos_favoritos,id_vendedor) VALUES(0,0,0,0,(SELECT id_vendedor FROM Vendedor WHERE usuario=?))"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }
        
        return false;
    }
    
    public boolean subirArchivo(String nombreArchivo, String extensionArchivo , String ubicacionArchivo ,String usuarioVendedor){
    
        PreparedStatement pst=null;
        
        try {
            String consulta = "INSERT INTO Documento (nombre,tipo_archivo,ubicacion,id_vendedor) VALUES (?,?,?,(SELECT id_vendedor FROM Vendedor WHERE usuario=?));"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, nombreArchivo);
            pst.setString(2, extensionArchivo);
            pst.setString(3, ubicacionArchivo);
            pst.setString(4, usuarioVendedor);
            
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }finally {

            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                
                if (pst!= null) {
                    pst.close();
                }
                
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
            
            
        
        }
        
        return false;
    }
    
    public Vendedor datosPersonalesVendedor(String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        Vendedor vendedor = new Vendedor();
        try {
            
            String consulta ="SELECT * FROM Vendedor WHERE usuario=?"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            rs = pst.executeQuery();
            while (rs.next()) {
                
                vendedor.setIdVendedor(rs.getInt("id_vendedor"));
                vendedor.setNombre(rs.getString("nombre"));
                vendedor.setApellido(rs.getString("apellido"));
                vendedor.setCedula(rs.getString("cedula"));
                vendedor.setDireccion(rs.getString("direccion"));
                vendedor.setTelefono(rs.getString("telefono"));
                vendedor.setUsuario(rs.getString("usuario"));
                vendedor.setFechaLogIn(rs.getDate("fechaLogin").toString());
                
                return vendedor;
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return vendedor;
    }
    
    public LinkedList<Archivo> listadoArchivosVendedor(String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Archivo> lista = new LinkedList<>();
        try {
            
            String consulta ="SELECT * FROM Documento "
                    + "WHERE id_vendedor=(SELECT id_vendedor FROM Vendedor WHERE usuario=?)"; //Codigo SQL Query
            
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            rs = pst.executeQuery();
            while (rs.next()) {
                Archivo archivo = new Archivo();
                archivo.setIdArchivo(rs.getInt("id_documento"));
                archivo.setNombre(rs.getString("nombre"));
                archivo.setTipoArchivo(rs.getString("tipo_archivo"));
                archivo.setUbicacionArchivo(rs.getString("ubicacion"));
                archivo.generarUbicacionIcono();
                lista.add(archivo);
                
                
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public boolean creacionAgendaVendedor(String usuarioVendedor){
    
        PreparedStatement pst=null;
       
        try {
            String consulta = "INSERT INTO Agenda (nombre_agenda,id_vendedor) VALUES (\"Agenda Predeterminada\",(SELECT id_vendedor FROM Vendedor WHERE usuario=?))"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }finally {

            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                
                if (pst!= null) {
                    pst.close();
                }
                
            } catch (Exception e) {
                System.err.println("Error: " + e);
            }
            
            
        
        }
        
        return false;
    }

    public boolean obtenerNombreAgenda(String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="select nombre_agenda from Agenda where id_vendedor=(select id_vendedor from Vendedor where usuario=?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            rs = pst.executeQuery();
            
            if (rs.absolute(1)) {
                return true;
                
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return false;
    }
    
    public boolean crearEvento(String usuarioVendedor,String fechaEvento, String titulo , String ubicacion, String descripcion, String hora_evento){
    
        PreparedStatement pst=null;
        
        try {
            String consulta = "INSERT INTO Evento (id_agenda,fecha_evento,titulo,ubicacion,descripcion,hora_evento) VALUES ((select id_agenda from Agenda where id_vendedor=(select id_vendedor from vendedor where usuario=?)),?,?,?,?,?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            pst.setString(2, fechaEvento);
            pst.setString(3, titulo);
            pst.setString(4, ubicacion);
            pst.setString(5, descripcion);
            pst.setString(6, hora_evento);
            
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }
        
        return false;
    }
    
    public LinkedList<Evento> listadoEventos(String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Evento> lista = new LinkedList<>();
        try {
            
            String consulta ="select * from evento where id_agenda=\n" +
                            "(select id_agenda from Agenda where id_vendedor=\n" +
                            "(select id_vendedor from vendedor where usuario=?));";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            rs = pst.executeQuery();
            while (rs.next()) {
                Evento evento = new Evento();
                evento.setIdEvento(rs.getInt("id_evento"));
                evento.setFechaEvento(rs.getString("fecha_evento"));
                evento.setTitulo(rs.getString("titulo"));
                evento.setUbicacion(rs.getString("ubicacion"));
                evento.setDescripcion(rs.getString("descripcion"));
                lista.add(evento);
                
                
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public Evento eventoSeleccionado(String fechaSeleccion, String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            Evento evento = new Evento();
            String consulta ="select * from evento where fecha_evento=? and id_agenda=\n" +
                            "(select id_agenda from Agenda where id_vendedor=\n" +
                            "(select id_vendedor from vendedor where usuario=?)); ";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, fechaSeleccion);
            pst.setString(2, usuarioVendedor);
            rs = pst.executeQuery();
            while (rs.next()) {
                
                evento.setIdEvento(rs.getInt("id_evento"));
                evento.setFechaEvento(rs.getString("fecha_evento"));
                evento.setTitulo(rs.getString("titulo"));
                evento.setUbicacion(rs.getString("ubicacion"));
                evento.setDescripcion(rs.getString("descripcion"));
                evento.setHoraEvento(rs.getString("hora_evento"));
                return evento;
                
                
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return null;
    }
    
    public LinkedList<Categoria> listadoCategorias(){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Categoria> lista = new LinkedList<>();
        try {
            
            String consulta ="SELECT * FROM Categorias ORDER BY categoria";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("id_categoria"));
                categoria.setNombreCategoria(rs.getString("categoria"));
                lista.add(categoria);
                
                
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public LinkedList<Tipo> listadoTipos(){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Tipo> lista = new LinkedList<>();
        try {
            
            String consulta ="SELECT * FROM Tipos ORDER BY tipo";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Tipo tipo = new Tipo();
                tipo.setIdTipo(rs.getInt("id_tipo"));
                tipo.setNombreTipo(rs.getString("tipo"));
                lista.add(tipo);
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public LinkedList<Departamento> listadoDepartamentos(){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Departamento> lista = new LinkedList<>();
        try {
            
            String consulta ="SELECT * FROM Deptos ORDER BY depto";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Departamento departamento = new Departamento();
                departamento.setId(rs.getInt("id_depto"));
                departamento.setNombreDepartamento(rs.getString("depto"));
                lista.add(departamento);
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
    
    public Estadistica1 estadisticaAdministrador(String usuarioAdmin){
        PreparedStatement pst = null;
        ResultSet rs = null;
        Estadistica1 est = new Estadistica1();
        
        try {
            String consultas = "select COUNT(CG.id_estado)Favoritos FROM Vendedor V INNER JOIN ContratoGuardado CG ON V.id_vendedor=CG.id_vendedor INNER JOIN Contratos C ON CG.id_contrato=C.id_contrato where CG.id_estado = ?";
            pst = getConexion().prepareStatement(consultas);
            pst.setInt(1, 1);
            rs = pst.executeQuery();
            if(rs.absolute(1)){
                est.setContratosGuardados(rs.getInt("Favoritos"));
                consultas = "select COUNT(CG.id_estado)Proceso FROM Vendedor V INNER JOIN ContratoGuardado CG ON V.id_vendedor=CG.id_vendedor INNER JOIN Contratos C ON CG.id_contrato=C.id_contrato where CG.id_estado = ?";
                pst.setInt(1, 2);
                rs = pst.executeQuery();
                if(rs.absolute(1)){
                    est.setContratosTramite(rs.getInt(1));
                    consultas = "select COUNT(CG.id_estado)Completado FROM Vendedor V INNER JOIN ContratoGuardado CG ON V.id_vendedor=CG.id_vendedor INNER JOIN Contratos C ON CG.id_contrato=C.id_contrato where CG.id_estado = ?";
                    pst.setInt(1, 3);
                    rs = pst.executeQuery();
                    if(rs.absolute(1)){
                        est.setContratosCompletados(rs.getInt(1));
                        return est;
                    }
                }
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
        }
        return est;
    }
    
    public Estadistica1 estadisticaVendedor(String usuario){
        PreparedStatement pst = null;
        ResultSet rs = null;
        Estadistica1 est = new Estadistica1();
        
        try {
            String consultas = "select COUNT(CG.id_estado)Favoritos FROM Vendedor V INNER JOIN ContratoGuardado CG ON V.id_vendedor=CG.id_vendedor INNER JOIN Contratos C ON CG.id_contrato=C.id_contrato where CG.id_estado = ? AND V.usuario = ?";
            pst = getConexion().prepareStatement(consultas);
            pst.setInt(1, 1);
            pst.setString(2, usuario);
            rs = pst.executeQuery();
            if(rs.absolute(1)){
                est.setContratosGuardados(rs.getInt("Favoritos"));
                consultas = "select COUNT(CG.id_estado)Proceso FROM Vendedor V INNER JOIN ContratoGuardado CG ON V.id_vendedor=CG.id_vendedor INNER JOIN Contratos C ON CG.id_contrato=C.id_contrato where CG.id_estado = ? AND V.usuario = ?";
                pst.setInt(1, 2);
                pst.setString(2, usuario);
                rs = pst.executeQuery();
                if(rs.absolute(1)){
                    est.setContratosTramite(rs.getInt(1));
                    consultas = "select COUNT(CG.id_estado)Completado FROM Vendedor V INNER JOIN ContratoGuardado CG ON V.id_vendedor=CG.id_vendedor INNER JOIN Contratos C ON CG.id_contrato=C.id_contrato where CG.id_estado = ? AND V.usuario = ?";
                    pst.setInt(1, 3);
                    pst.setString(2, usuario);
                    rs = pst.executeQuery();
                    if(rs.absolute(1)){
                        est.setContratosCompletados(rs.getInt(1));
                        return est;
                    }
                }
            }
            rs.close();
            pst.close();
        } catch (Exception e) {
        }
        return est;
    }
    
     public LinkedList<Contrato> listadoBusquedaContratos(String entidad, String categoria, String tipoProceso,
             String departamento, String presupuestoSigno, String valorPresupuesto, String fechaDesde,
             String fechaHasta, int pagina){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Contrato> lista = new LinkedList<>();
        try {
            
            String consulta;
            String condicionEntidad="";
            String condicionCategoria="";
            String condicionTipo="";
            String condicionDepto="";
            String condicionPresupuesto="";
            
            if (!entidad.equals("")) {
            condicionEntidad="and Contratos.idEntidad="+entidad;
        }
        
        if (!categoria.equals("Todos")) {
            condicionCategoria="and Categorias.id_categoria="+categoria;
        }
        
        if (!tipoProceso.equals("Todos")) {
            condicionTipo="and Tipos.id_tipo="+tipoProceso;
        }
        
        if (!departamento.equals("Todos")) {
            condicionDepto="and Deptos.id_depto="+departamento;
        }
        
        if (presupuestoSigno.equals(">") && !valorPresupuesto.equals("")) {
            condicionPresupuesto="and Contratos.presupuesto>"+valorPresupuesto;
        }
        
        if (presupuestoSigno.equals("<") && !valorPresupuesto.equals("")) {
            condicionPresupuesto="and Contratos.presupuesto<"+valorPresupuesto;
        }
        
        if (presupuestoSigno.equals("=") && !valorPresupuesto.equals("")) {
            condicionPresupuesto="and Contratos.presupuesto="+valorPresupuesto;
        }
            
           consulta="select id_contrato, objeto, numero_proceso, presupuesto, fecha_publicacion, hora_publicacion, pagina_web, depto\n" +
                            "from Contratos\n" +
                            "inner join Categorias ON Categorias.id_categoria=Contratos.id_categoria\n" +
                            "inner join Deptos on Deptos.id_depto=Contratos.id_depto\n" +
                            "inner join Tipos on Tipos.id_tipo=Contratos.id_tipo\n" +
                            "where fecha_publicacion BETWEEN ? and ? "+condicionEntidad+""+condicionCategoria+""+condicionTipo+""+condicionDepto+""+condicionPresupuesto+" \n" +
                            "order by fecha_publicacion\n" +
                            "desc limit ?,5;";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, fechaDesde);
            pst.setString(2, fechaHasta);
            pst.setInt(3, pagina);
            rs = pst.executeQuery();
            while (rs.next()) {
                Contrato contrato = new Contrato();
                contrato.setIdContrato(rs.getInt("id_contrato"));
                contrato.setObjeto(rs.getString("objeto"));
                contrato.setNumeroProceso(rs.getString("numero_proceso"));
                contrato.setPresupuesto(rs.getInt("presupuesto"));
                contrato.setFechaPublicacion(rs.getString("fecha_publicacion"));
                contrato.setHoraPublicacion(rs.getString("hora_publicacion"));
                contrato.setPaginaWeb(rs.getString("pagina_web"));
                contrato.setDepartamento(rs.getString("depto"));
                lista.add(contrato);
                
                
            }
            
            rs.close();
            pst.close();

        } catch (Exception e) {
        }
        return lista;
    }
     
     public int sizeBusquedaContratos(String entidad, String categoria, String tipoProceso,
             String departamento, String presupuestoSigno, String valorPresupuesto, String fechaDesde,
             String fechaHasta){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        int size = 0;
        try {
            
            String consulta;
            String condicionEntidad="";
            String condicionCategoria="";
            String condicionTipo="";
            String condicionDepto="";
            String condicionPresupuesto="";
            
            if (!entidad.equals("")) {
            condicionEntidad="and Contratos.idEntidad="+entidad;
        }
        
        if (!categoria.equals("Todos")) {
            condicionCategoria="and Categorias.id_categoria="+categoria;
        }
        
        if (!tipoProceso.equals("Todos")) {
            condicionTipo="and Tipos.id_tipo="+tipoProceso;
        }
        
        if (!departamento.equals("Todos")) {
            condicionDepto="and Deptos.id_depto="+departamento;
        }
        
        if (presupuestoSigno.equals(">") && !valorPresupuesto.equals("")) {
            condicionPresupuesto="and Contratos.presupuesto>"+valorPresupuesto;
        }
        
        if (presupuestoSigno.equals("<") && !valorPresupuesto.equals("")) {
            condicionPresupuesto="and Contratos.presupuesto<"+valorPresupuesto;
        }
        
        if (presupuestoSigno.equals("=") && !valorPresupuesto.equals("")) {
            condicionPresupuesto="and Contratos.presupuesto="+valorPresupuesto;
        }
            
           consulta="select count(id_contrato) size \n" +
                            "from Contratos\n" +
                            "inner join Categorias ON Categorias.id_categoria=Contratos.id_categoria\n" +
                            "inner join Deptos on Deptos.id_depto=Contratos.id_depto\n" +
                            "inner join Tipos on Tipos.id_tipo=Contratos.id_tipo\n" +
                            "where fecha_publicacion BETWEEN ? and ? "+condicionEntidad+""+condicionCategoria+""+condicionTipo+""+condicionDepto+""+condicionPresupuesto+" \n";
                            //Codigo SQL Query
                           
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, fechaDesde);
            pst.setString(2, fechaHasta);
            rs = pst.executeQuery();
            
            while (rs.next()) {
               
                size=rs.getInt("size");
                return size;
            }
            
            
            rs.close();
            pst.close();

        } catch (Exception e) {
        }
        return size;
    }
     
      public boolean buscarContratoGuardado(int idContrato, String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="SELECT * FROM ContratoGuardado WHERE id_contrato=? and id_vendedor=(select id_vendedor from Vendedor where usuario=?)"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setInt(1, idContrato);
            pst.setString(2, usuarioVendedor);
            rs = pst.executeQuery();
            
            if (rs.absolute(1)) {
                return true;
            }

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return false;
    }
     
     public boolean guardarContrato(int idContrato,String usuarioVendedor){
    
        PreparedStatement pst=null;
        
        try {
            String consulta = "insert into ContratoGuardado (id_estado, id_contrato, id_vendedor) values (1,?,(select id_vendedor from vendedor where usuario=?))"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setInt(1, idContrato);
            pst.setString(2, usuarioVendedor);
           
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }
        
        return false;
    }
    
     
     public LinkedList<ContratoGuardado> listadoContratosGuardados(String usuarioVendedor){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<ContratoGuardado> lista = new LinkedList<>();
        try {
            
            String consulta ="select id_contrato_guardado, id_contrato, ContratoGuardado.id_estado, Estado.nombre_estado\n" +
                            "from ContratoGuardado\n" +
                            "inner join Estado ON Estado.id_estado=ContratoGuardado.id_estado\n" +
                            "where id_vendedor=(select id_vendedor from vendedor where usuario=?)";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuarioVendedor);
            rs = pst.executeQuery();
          
            while (rs.next()) {
                ContratoGuardado cg = new ContratoGuardado();
                cg.setIdContratoGuardado(rs.getInt("id_contrato_guardado"));
                cg.setIdContrato(rs.getInt("id_contrato"));
                cg.setIdEstado(rs.getInt("id_estado"));
                cg.setNombreEstado(rs.getString("nombre_estado"));
                lista.add(cg);
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
     
    public boolean actualizarEstadoContratoGuardado(int idNuevoEstado,String usuarioVendedor, int idContratoGuardado){
    
        PreparedStatement pst=null;
        
        try {
            String consulta = "UPDATE ContratoGuardado\n" +
                              "SET id_estado=?\n" +
                              "WHERE id_vendedor=(select id_vendedor from vendedor where usuario=?) and id_contrato_guardado=?;"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            pst.setInt(1, idNuevoEstado);
            pst.setString(2, usuarioVendedor);
            pst.setInt(3, idContratoGuardado);
            
            if (pst.executeUpdate() == 1) {
                return true;
            }
            
        } catch (Exception e) {
        }
        
        return false;
    }
    
     public String[] obtenerContratosPorMes(){
    PreparedStatement pst =null;
        ResultSet rs = null;
        
        try {
            String consulta ="SELECT  (ct1.cuenta1) as Enero ,(ct2.cuenta2) as Febrero, (ct3.cuenta3) as Marzo , (ct4.cuenta4) as Abril, (ct5.cuenta5) as Mayo, (ct6.cuenta6) as Junio,\n" +
"  (ct7.cuenta7) as Julio , (ct8.cuenta8) as Agosto, (ct9.cuenta9) as Septiembre , (ct10.cuenta10) as Octubre , (ct11.cuenta11) as Noviembre , (ct12.cuenta12) as Diciembre from( \n" +
"  (SELECT count(id_contrato) as cuenta1\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-01-01' AND '2017-01-30') as ct1,\n" +
"  (SELECT count(id_contrato) as cuenta2\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-02-01' AND '2017-02-28') as ct2,\n" +
"  (SELECT count(id_contrato) as cuenta3\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-03-01' AND '2017-03-28') as ct3,\n" +
"  (SELECT count(id_contrato) as cuenta4\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-04-01' AND '2017-04-30') as ct4,\n" +
"  (SELECT count(id_contrato) as cuenta5\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-05-01' AND '2017-05-30') as ct5,\n" +
"  (SELECT count(id_contrato) as cuenta6\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-06-01' AND '2017-06-30') as ct6,\n" +
"  (SELECT count(id_contrato) as cuenta7\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-07-01' AND '2017-07-30') as ct7,\n" +
"  (SELECT count(id_contrato) as cuenta8\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-08-01' AND '2017-08-30') as ct8,\n" +
"  (SELECT count(id_contrato) as cuenta9\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-09-01' AND '2017-09-30') as ct9,\n" +
"  (SELECT count(id_contrato) as cuenta10\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-10-01' AND '2017-10-30') as ct10,\n" +
"  (SELECT count(id_contrato) as cuenta11\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-11-01' AND '2017-11-30') as ct11,\n" +
"  (select count(id_contrato) as cuenta12\n" +
"      from contratos\n" +
"      where date(fecha_publicacion) BETWEEN '2017-12-04' AND '2017-12-31') as ct12);"; //Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
               
                while (rs.next()) {                    
                    String enero = rs.getString("Enero");
                    String febrero = rs.getString("Febrero");
                    String marzo = rs.getString("Marzo");
                    String abril = rs.getString("Abril");
                    String mayo = rs.getString("Mayo");
                    String junio = rs.getString("Junio");
                    String julio = rs.getString("Julio");
                    String agosto = rs.getString("Agosto");
                    String septiembre = rs.getString("Septiembre");
                    String octubre = rs.getString("Octubre");
                    String noviembre = rs.getString("Noviembre");
                    String diciembre = rs.getString("Diciembre");
                    String [] year ={enero,febrero,marzo,abril,mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre};
                    return year;
                }


        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
        
        return null;
    }
     
       public LinkedList<Estadistica2> listadoContratosDepartamentos(){
    
        PreparedStatement pst =null;
        ResultSet rs = null;
        LinkedList<Estadistica2> lista = new LinkedList<>();
        try {
            
            String consulta ="SELECT D.depto nombre, COUNT(D.depto) NumContratos\n" +
                            "FROM deptos D\n" +
                            "inner JOIN Contratos C ON D.id_depto=C.id_depto\n" +
                            "GROUP BY D.depto\n" +
                            "order by numContratos desc;";//Codigo SQL Query
            pst = getConexion().prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                
                Estadistica2 e = new Estadistica2();
                e.setNombreDepartamento(rs.getString("nombre"));
                e.setNumeroContratos(rs.getInt("NumContratos"));
                lista.add(e);
            }
            
            rs.close();
            pst.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
     
      
}


