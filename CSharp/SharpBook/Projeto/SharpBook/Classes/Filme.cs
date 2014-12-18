using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SharpBook.Classes
{
    public class Filme 
    {
        public String cNome     = "";
        public String cAtores   = "";
        public String cComen    = "";

        public Filme(String tcNome, String tcAtores, String tcComen) {

            cNome = tcNome;
            cAtores = tcAtores;
            cComen = tcComen;
        
        }
    }
}
