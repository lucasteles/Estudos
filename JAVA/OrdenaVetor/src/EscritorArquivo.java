import java.io.*;
import javax.swing.*;

/**
 * Escreve inteiros e strings num arquivo texto
 */
class EscritorArquivo {
    File nomeArquivo;
    JFileChooser caixaDeDialogo;
    PrintWriter saida;
    
    /**
     * Cria um objeto que escreve saída para arquivo
     * @param nome O nome do arquivo 
     */
    EscritorArquivo(String nome){
        nomeArquivo = new File(nome);
        abrirArquivo(nomeArquivo);
    }
    
    /**
     * Cria um objeto EscritorArquivo, mostra uma caixa de dialogo para o usuario
     * para que este possa escolher o nome do arquivo destino
     */
    EscritorArquivo(){
        caixaDeDialogo = new JFileChooser();
        int res = caixaDeDialogo.showSaveDialog(null);
        if (res == JFileChooser.APPROVE_OPTION){
            nomeArquivo = caixaDeDialogo.getSelectedFile();
            abrirArquivo(nomeArquivo);
        }        
    }
    
    private void abrirArquivo(File file){
        try {
            saida = new PrintWriter(file);            
        } catch (IOException e){
            e.printStackTrace();
        }
    }
    
    /**
     * Escreve um inteiro na saida. Atenção: não deixa espaço após o int
     * @param i o inteiro a escrever
     */
    void print(int i){
            saida.print(i);                
    }
    
    /**
     * Escreve um inteiro no arquivo de saida e pula linha
     * @param i o Inteiro a escrever
     */
    void println(int i){
            saida.println(i);
    }
    
    /**
     * Escreve uma string no arquivo de saída
     * @param s a string a escrever
     */
    void print(String s){
            saida.print(s);
    }
    
    /**
     * Fechar o arquivo. Se o arquivo não for fechado após a escrita, podem restar dados sem ter sido escritos
     */
    void fechar(){
            saida.flush();
            saida.close();
    }

}