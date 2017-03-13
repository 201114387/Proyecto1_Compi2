/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto1_compi2;

import static java.awt.Frame.NORMAL;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import javax.swing.JEditorPane;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.filechooser.FileFilter;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 *
 * @author robin
 */
public class Abrir_Guardar extends JFrame{
    
    
    /*================================================
      === Metodo que sirve para Abrir los archivos ===
      ================================================*/
    
    public void Open(JTabbedPane tp){
        String ext = "";
        String tipo = "";
        Boolean bandera = false;
        String[] Opciones = {"Archivo Haskell++","Archivo GraphiK", "Cancelar"};
        int seleccion = JOptionPane.showOptionDialog(null, "Seleccione una Opcion", "Seleccion de archivo", JOptionPane.DEFAULT_OPTION, JOptionPane.QUESTION_MESSAGE, null, Opciones,NORMAL);
        
        /*====== colocamos la extension que se escogio anteriormente =======*/
        if(seleccion == 0)
        {
            ext = "hk";
            tipo = "Haskell++";
            bandera = true;
        }
        else if(seleccion == 1)
        {
            ext = "gk";
            tipo = "Graphik";
            bandera = true;
        }
        
        if(bandera == true){
            String cadena = "";
            String aux = "";
            JFileChooser choser = new JFileChooser("C:\\Users\\robin\\Desktop");
            choser.setFileSelectionMode(JFileChooser.FILES_ONLY);
            FileNameExtensionFilter filtro = new FileNameExtensionFilter(tipo, ext);
            choser.setFileFilter(filtro);
            int seleccion_Open = choser.showOpenDialog(this);

            if(seleccion_Open == JFileChooser.APPROVE_OPTION){
                try {
                    File archivo = choser.getSelectedFile();
                    if(archivo != null){
                        FileReader reader = new FileReader(archivo);
                        BufferedReader buffer = new BufferedReader(reader);
         /*====== esto se realiza para crear una nueva pestaña dentro de JTabbetPane, y se le pasa el nombre del 
                  archivo que se abrio ==========*/
                        Panel_Texto pt = new Panel_Texto();
                        pt.nuevo(tp, choser.getName(archivo));
                        while((aux = buffer.readLine())!= null){
                            cadena = cadena + aux + "\n";
                        }
                        pt.setText(cadena);
                        buffer.close();
                        //rutas.add(jTabbedPane_Pestanas.getTitleAt(jTabbedPane_Pestanas.getSelectedIndex()));
                        //rutas.add(archivo.getPath());
                    }
                } catch (Exception e) {
                }
            }
        }
    }
    
    
    /*=======================================================
      === Metodo que sirve para Guardar_Como los archivos ===
      =======================================================*/
    
    public void guardar_Como(JTabbedPane tp){
        String Extension = "";
        JFileChooser choser_G = new JFileChooser("C:\\Users\\robin\\Desktop");
        choser_G.setFileSelectionMode(JFileChooser.FILES_ONLY);
        FileNameExtensionFilter filtro = new FileNameExtensionFilter("Haskell++", "hk");
        FileNameExtensionFilter filtro2 = new FileNameExtensionFilter("Graphik", "gk");
        choser_G.setFileFilter(filtro);
        choser_G.setFileFilter(filtro2);
        
        /*=========obtenemos el nombre del componente que en este caso es un JEditorPane para lo cual
                   obtenemos desde el ultimo componente que es un ScrollPane hasta el primero que es un
                   JEditorPane. el getViewport metodo de Scroll que obtiene los componentes que tiene
                   dentro del mismo y como solo ese componente tiene se selecciona el que esta en la pos 0
        ============*/
        JScrollPane scroll = (JScrollPane)tp.getSelectedComponent();
        JEditorPane pestana = (JEditorPane)scroll.getViewport().getComponent(0);
        int seleccion_Open = choser_G.showSaveDialog(this);
        if(seleccion_Open == JFileChooser.APPROVE_OPTION){
            /*=== buscamos la extension que fue seleccionada en el filechooser utilizando el getFileFilter en donde getDescription
                  obtiene el nombre del filtro mas no la extension por lo que comparamos la extension que fue obtenido y colocamos 
                  una variable que pueda controlar eso...........*/
            if(choser_G.getFileFilter().getDescription().equalsIgnoreCase("Haskell++")){
                Extension = ".hk";
            }
            else if(choser_G.getFileFilter().getDescription().equalsIgnoreCase("Graphik")){
                Extension = ".gk";
            }
            
            try {
                File guardar = choser_G.getSelectedFile();
                if(guardar != null){
                    FileWriter fw = new FileWriter(guardar+Extension);
                    fw.write(pestana.getText()); 
                    fw.close();
                }
                
                /*==== colocamos el nombre a la pestaña para esto obtenemos el nombre del archivo y su extension, recordando que se 
                       obtuvo el numero de pestaña seleccionada ===*/
                tp.setTitleAt(tp.getSelectedIndex(), choser_G.getName(guardar)+Extension);
                //rutas.add(jTabbedPane_Pestanas.getTitleAt(jTabbedPane_Pestanas.getSelectedIndex()));
                //rutas.add(guardar.getPath()+".lz");
            } catch (Exception e) {
            }
        }
    }
}
