package sslserver;

import sslutils.SSLConnection;
import java.io.IOException;
import java.io.PrintStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.security.GeneralSecurityException;
import java.util.Scanner;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLServerSocket;
import javax.net.ssl.SSLServerSocketFactory;

public class SSLServer {
    public static void main(String args[]) throws IOException
    {
        ServerSocket server = null;
        Socket cliente = null;
        try{
            
            int port = 9191;
            server = GetgetSSLServerSocket("server_key_store_file", "root@123", port);
            
            System.out.println("Server iniciado na porta " + port);
            cliente = server.accept();       
            System.out.println("Cliente conectado : " + cliente.getInetAddress().getHostName());
            
            PrintStream clientWriter = new PrintStream(cliente.getOutputStream());
            Scanner clientReader = new Scanner(cliente.getInputStream());
                        
            while(clientReader.hasNextLine()){
                   String texto = clientReader.nextLine();
                   System.out.println("recebido: " + texto);
                                     
                   clientWriter.println(texto.toUpperCase());
            }
        }
        catch(Exception e)
        {
           System.out.print(e);
        }
        finally
        {
            if (cliente != null)
                cliente.close();
            
            if (server != null)
                server.close();
        }

    }
    
    
   static ServerSocket GetgetSSLServerSocket(String keyStoreFile, String keyStoreFilePassword, int port) throws GeneralSecurityException, IOException 
    {
         SSLContext sslContext = SSLConnection.createSSLContext(keyStoreFile, keyStoreFilePassword);
        //SSLContext sslContext = SSLConnections.getSSLContext(keyStoreFile, keyStoreFilePassword);
        SSLServerSocketFactory sslServerSocketFactory = sslContext.getServerSocketFactory();
        SSLServerSocket sslServerSocket = (SSLServerSocket) sslServerSocketFactory.createServerSocket(port);
        return sslServerSocket;
    }
  
   
 
}
