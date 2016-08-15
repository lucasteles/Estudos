using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreAdressParserB
{
    public class LojaModel
    {
        public string Id { get; set; }

        public string Cep { get; set; }
        public string UF { get; set; }
        public string Cidade { get; set; }
        public string Bairro { get; set; }
        public string Pais { get; set; }
        public string Rua { get; set; }

        public string Endereco { get; set; }

        public string Numero { get; set; }
        public double Lat { get; set; }
        public double Long { get; set; }


        public string TipoEstabelecimento { get; set; }
        public string ServicosDisponiveis { get; set; }
        public string ServicosAtendidos { get; set; }


        public string Complemento { get; set; }
        public string Empresa { get; set; }
        public IList<string> Horarios { get; set; }


    }
}
