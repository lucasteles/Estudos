using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SharpBook.Classes
{
    class EspMsg : Msg
    {
        public Filme fRecomend = null;

         public EspMsg(Usuario tuRemetente, String tcAssunto,String tcMessage)
        { 
            uRemetente    = tuRemetente;
            cAssunto      = tcAssunto;
            SetMsg( tcMessage );
        }

    }
}
