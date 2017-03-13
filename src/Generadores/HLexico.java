/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Generadores;
import java.io.File;

/**
 *
 * @author robin
 */
public class HLexico {
    public static void main(String[] args)
    {
        String path = "src/Analizadores/H_Lexico.jflex";
        Generar_lexico(path);
    }

    public static void Generar_lexico(String path)
    {
            File file = new File(path);
            jflex.Main.generate(file);
    }
}
