
package Generadores;
public class GSintactico
{
    public static void main(String[] args)
    {
        String opciones[] = new String[7];

        //selecciona la direccion de destino
        opciones[0] = "-destdir";

        //le damos la direccion, de la carpeta donde se generara el parser.java y el archivo de simbolos
        opciones[1] = "src/Analizadores";

        //selecionamos la opcion de nombre del archivo simbolos
        opciones[2]="-symbols";

        //le asignamos el nombre que queramos que tenga
        opciones[3]="GSimbolos";

        //selecionamos la opcion de la clase parser
        opciones[4]="-parser";

        //le asignamos el nombre que queramos que tenga4
        opciones[5]="GSintactico";

        //le iindicamos donde esta el archivo .cup
        opciones[6]="src/Analizadores/"; /*falta el archivo .cup*/

        try
        {
            java_cup.Main.main(opciones);
        }
        catch(Exception ex)
        {
            System.out.println(ex);
        }
    }
}