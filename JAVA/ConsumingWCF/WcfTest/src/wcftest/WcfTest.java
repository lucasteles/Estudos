/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wcftest;


import com.microsoft.schemas._2003._10.serialization.arrays.ArrayOfstring;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;

import javax.xml.bind.PropertyException;
import org.datacontract.schemas._2004._07.wcfservice1.CompositeType;
import org.tempuri.IService1;
import org.datacontract.schemas._2004._07.wcfservice1.ObjectFactory; 
import org.tempuri.Service1;



/**
 *
 * @author telesl
 */
public class WcfTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws PropertyException, JAXBException {
        
        System.out.print("oi\n");
        Service1 service = new Service1();
        IService1 port = service.getBasicHttpBindingIService1();
        
        //Put data
        port.putData("Teste java "); // insere no WS
        
        // getData
        ArrayOfstring data = port.getData(); //busca no WS
        System.out.print(data.getString()); 
        System.out.print("\n");
        
        
        
         // using composite type 
        // esse tipo foi importado no webservice, logo foi criado no C# e importado pra ca via WSDL com auxilio do jax-ws     
        ObjectFactory CTFactory = new ObjectFactory(); // cria factory do contrato      
        CompositeType value = CTFactory.createCompositeType(); // valor complexo a ser usado como parametro pro WS
        
        value.setBoolValue(Boolean.TRUE); // seta o valor pra true. no ws so acrescenta um SUfixo na string nome se for true
        value.setStringValue(CTFactory.createCompositeTypeStringValue("Lucas"));
        
        
        CompositeType ret = port.getDataUsingDataContract( value ); //pega o retono do WS
        
        //printa valor de retorono do objeto complexo 
          System.out.print(ret.getStringValue().getValue());
        
        
    }    
    
}
