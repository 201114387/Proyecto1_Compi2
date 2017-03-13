/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizadores;

/**
 *
 * @author robin
 */
public class THError {
    String lexema,tipo,descripcion;
    int linea,columna;

    public THError(String le, int li, int col, String ti, String des) {
        lexema = le;
        linea = li;
        columna = col;
        tipo = ti;
        descripcion = des;
    }
    
    
}
