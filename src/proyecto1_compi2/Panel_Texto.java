/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto1_compi2;

import javax.swing.JEditorPane;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;

/**
 *
 * @author robin
 */
public class Panel_Texto extends JEditorPane{
    
    
    public void nuevo(JTabbedPane tb, String title){
        //this.setWrapStyleWord(true);
        //this.setLineWrap(true);
        JScrollPane jp = new JScrollPane(this);  
        tb.addTab(title ,jp);
        tb.setSelectedIndex(tb.getTabCount()-1); 
    }
    
    
}
