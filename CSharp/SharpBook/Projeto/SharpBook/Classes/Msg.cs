using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SharpBook.Classes
{
    public class Msg
    {
        // private 
        private String cMenssage = "";
        
        // public metodos
        public DateTime dData = DateTime.Now;
        public bool lLida = false;
        public String cAssunto = "";
        public Usuario uRemetente    = null;
        

        public Msg()
        { 
        
        }

        public Msg(Usuario tuRemetente, String tcAssunto,String tcMessage)
        { 
            uRemetente    = tuRemetente;
            cAssunto      = tcAssunto;
            cMenssage     = tcMessage;
        }

        public Msg(Usuario tuRemetente, String tcAssunto, String tcMessage, bool tlLida)
        {
            uRemetente      = tuRemetente;
            cAssunto        = tcAssunto;
            cMenssage       = tcMessage;
            SetLida(tlLida);

        }


        public void SetLida(bool tlLida)
        {
            lLida = tlLida;
        }
        public String LerMsg()
        {
            
            return(cMenssage);
        }
        
        public void SetMsg(String cMsg)
        {
            cMenssage = cMsg;
        }
        
        public String LerAssunto()
        {
            return (cAssunto);
        }


    }
}
