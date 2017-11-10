/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Mao
 */
public class Conexion {
    
    private String USERNAME ="root";
    private String PASSWORD ="123mao";
    private String HOST ="localhost";
    private String PORT ="3306";
    private String DATABASE = "proyecto_bases1";
    private String CLASSNAME = "com.mysql.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;

    private Connection con;

    public Conexion() {

        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Conectado con base de datos");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: "+e);
        } catch (SQLException ex) {
            System.err.println("Error SQL: "+ex);
        }
    }
    
    
    public Connection getConexion(){
        return con;
    }

    
    
    
}
