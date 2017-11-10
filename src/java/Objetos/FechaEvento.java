/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objetos;

import Controlador.Consultas;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author Mao
 */
public class FechaEvento {
    
    
    private String usuarioVendedor;
    Consultas consultas;

    public FechaEvento(String usuarioVendedor) {
        this.usuarioVendedor = usuarioVendedor;
        consultas = new Consultas();
    }

    public int obtenerDia(int diaComparar, int mesComparar, int yearComparar){
    
    LinkedList<Evento> listadoEventos = consultas.listadoEventos(usuarioVendedor);
        

        for (int k = 0; k < listadoEventos.size(); k++) {
            Evento evento = listadoEventos.get(k);
            String fechaEvento = evento.getFechaEvento();
            String[] fechaSplit = fechaEvento.split("-");
            int yearEvento = Integer.parseInt(fechaSplit[0]);
            int mesEvento = Integer.parseInt(fechaSplit[1]) - 1;
            int diaEvento = Integer.parseInt(fechaSplit[2]);
            
            if (diaComparar==diaEvento && mesComparar==mesEvento && yearComparar==yearEvento) {
                return diaEvento;
            }
        }
    return -1;
    }
    
  public int obtenerMes(int diaComparar, int mesComparar, int yearComparar){
    
    LinkedList<Evento> listadoEventos = consultas.listadoEventos(usuarioVendedor);
        

        for (int k = 0; k < listadoEventos.size(); k++) {
            Evento evento = listadoEventos.get(k);
            String fechaEvento = evento.getFechaEvento();
            String[] fechaSplit = fechaEvento.split("-");
            int yearEvento = Integer.parseInt(fechaSplit[0]);
            int mesEvento = Integer.parseInt(fechaSplit[1]) - 1;
            int diaEvento = Integer.parseInt(fechaSplit[2]);
            
            if (diaComparar==diaEvento && mesComparar==mesEvento && yearComparar==yearEvento) {
                return mesEvento;
            }
        }
    return -1;
    }
    
    public int obtenerYear(int diaComparar, int mesComparar, int yearComparar){
    
    LinkedList<Evento> listadoEventos = consultas.listadoEventos(usuarioVendedor);
        

        for (int k = 0; k < listadoEventos.size(); k++) {
            Evento evento = listadoEventos.get(k);
            String fechaEvento = evento.getFechaEvento();
            String[] fechaSplit = fechaEvento.split("-");
            int yearEvento = Integer.parseInt(fechaSplit[0]);
            int mesEvento = Integer.parseInt(fechaSplit[1]) - 1;
            int diaEvento = Integer.parseInt(fechaSplit[2]);
            
            if (diaComparar==diaEvento && mesComparar==mesEvento && yearComparar==yearEvento) {
                return yearEvento;
            }
        }
    return -1;
    }
            

 
}

