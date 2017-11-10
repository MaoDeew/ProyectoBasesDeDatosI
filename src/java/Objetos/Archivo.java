/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

/**
 *
 * @author Mao
 */
public class Archivo {
    
    private int idArchivo;
    private String nombre, tipoArchivo, ubicacionArchivo, ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/archivoDesconocido.png";

    public int getIdArchivo() {
        return idArchivo;
    }

    public void setIdArchivo(int idArchivo) {
        this.idArchivo = idArchivo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoArchivo() {
        return tipoArchivo;
    }

    public void setTipoArchivo(String tipoArchivo) {
        this.tipoArchivo = tipoArchivo;
    }

    public String getUbicacionArchivo() {
        return ubicacionArchivo;
    }

    public void setUbicacionArchivo(String ubicacionArchivo) {
        this.ubicacionArchivo = ubicacionArchivo;
    }

    public String getUbicacionIcono() {
        return ubicacionIcono;
    }
    
    public void generarUbicacionIcono(){
    
        if (tipoArchivo.equals("docx")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/docx.png";
        }
        
        if (tipoArchivo.equals("pdf")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/pdf.png";
        }
        
        if (tipoArchivo.equals("xlsx")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/xlsx.png";
        }
        
        if (tipoArchivo.equals("ppt")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/ppt.png";
        }
        
        if (tipoArchivo.equals("rar")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/rar.png";
        }
        
        if (tipoArchivo.equals("zip")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/zip.png";
        }
        
        if (tipoArchivo.equals("txt")) {
            this.ubicacionIcono="http://localhost:9090/Proyecto/iconosArchivos/txt.png";
        }
        
        
        
    }

    
    
}
