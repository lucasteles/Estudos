package sslclient;

import sslutils.SSLConnection;
import java.io.IOException;
import java.io.PrintStream;
import java.net.InetAddress;
import java.security.GeneralSecurityException;
import java.util.Scanner;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;


public class SSLClient {     
    public static void main(String[] args) throws IOException, InterruptedException  {
            
            SSLSocket server = null;
            int port = 9191;
            try {
                InetAddress adress = InetAddress.getLocalHost();
                server = getSSLSocket("client_trust_store_file", "root@123", adress, port);
                System.out.println("Conectado no server pela porta" + port);
                
                PrintStream serverWriter = new PrintStream(server.getOutputStream());
                Scanner serverReader =new Scanner(server.getInputStream());
                Scanner input = new Scanner(System.in);
                
                while(true) {
                    
                    System.out.println("digite algo: ");
                    String texto = input.nextLine();
                    serverWriter.println(texto);
                    
                    String response = serverReader.nextLine();
                    System.out.println("server enviou: " + response);
                    
                    Thread.sleep(300L);
                }
            }
            catch(IOException | GeneralSecurityException e)
            {
               System.out.print(e);        
            }
            finally{            
                if (server != null)
                    server.close();
            }
    }
    
    
    static SSLSocket getSSLSocket(String keyStoreFile, String keyStoreFilePassword, InetAddress serverAddress, int serverPort) throws GeneralSecurityException, IOException 
   {        
        SSLContext sslContext = SSLConnection.createSSLContext(keyStoreFile, keyStoreFilePassword);
        SSLSocket sslSocket = (SSLSocket) sslContext.getSocketFactory().createSocket(serverAddress, serverPort);
        sslSocket.startHandshake();
        
        return sslSocket;
    }
}
