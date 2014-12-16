import java.io.*;
import javax.swing.*;
import java.util.Scanner;

/**
 * Lê um arquivo txt que contenha valores inteiros separados por espaços, tabs ou quebras de linha
 */
class LeitorArquivoInt {

    File nomeArquivo;
    JFileChooser caixaDeDialogo;
    InputStream is;
    Scanner scanner;
    
    /**
     * Constroi um leitor de arquivos
     * @param nome o nome do arquivo
     */
    LeitorArquivoInt(String nome){
        nomeArquivo = new File(nome);
        abrirArquivo(nomeArquivo);
    }
    
    /**
     * Pergunta para o usuario o nome do arquivo e constroi um leitor de arquivos
     */
    LeitorArquivoInt(){
        caixaDeDialogo = new JFileChooser();
        int res = caixaDeDialogo.showOpenDialog(null);
        if (res == JFileChooser.APPROVE_OPTION){
            nomeArquivo = caixaDeDialogo.getSelectedFile();
            abrirArquivo(nomeArquivo);
        }
        
    }
    
    private void abrirArquivo(File file){
        System.out.println("Arquivo a ser aberto: " + file.getAbsolutePath());
        try {
        is = new FileInputStream(file);
        scanner = new Scanner(is);
        } catch (IOException ioexc){
            ioexc.printStackTrace();
        }
    }
    
    /**
     * Verifica se os dados do arquivo lido chegaram ao fim ou não
     */    
    boolean terminou(){
        if (is!=null){
            return !scanner.hasNextInt();
        } else {
            System.out.println("Stream do arquivo "+ nomeArquivo.getAbsolutePath() +" não foi inicializado, verifique");
            return true;
        }
    }
    
    /**
     * Le o proximo valor vindo do arquivo
     */
    int obterProximo(){
        if (scanner!=null){      
            if (scanner.hasNextInt()){
                return scanner.nextInt();
            }
        } else { 
            System.out.println("Stream do arquivo "+ nomeArquivo.getAbsolutePath() +" não foi inicializado, verifique");
        }
        return Integer.MIN_VALUE;            
    }        
}