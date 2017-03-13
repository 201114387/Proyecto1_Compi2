package Generadores;
import java.io.File;


public class Glexico
{
    public static void main(String[] args)
    {
        String path = "src/Analizadores"; /*aqui falta el nombre del archivo .jflex*/
        Generar_lexico(path);
    }

    public static void Generar_lexico(String path)
    {
            File file = new File(path);
            jflex.Main.generate(file);
    }
	
}