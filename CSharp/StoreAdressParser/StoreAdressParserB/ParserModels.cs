using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace StoreAdressParserB
{


        [XmlRoot(ElementName = "map")]
        public class Map
        {
            [XmlElement(ElementName = "lat")]
            public string Lat { get; set; }
            [XmlElement(ElementName = "lon")]
            public string Lon { get; set; }
        }

        [XmlRoot(ElementName = "lojas")]
        public class Lojas
        {
            [XmlElement(ElementName = "empresa")]
            public string Empresa { get; set; }
            [XmlElement(ElementName = "endereco")]
            public string Endereco { get; set; }
            [XmlElement(ElementName = "cep")]
            public string Cep { get; set; }
            [XmlElement(ElementName = "horario_seg")]
            public string Horario_seg { get; set; }
            [XmlElement(ElementName = "horario_sab")]
            public string Horario_sab { get; set; }
            [XmlElement(ElementName = "horario_dom")]
            public string Horario_dom { get; set; }
            [XmlElement(ElementName = "obs")]
            public string Obs { get; set; }
            [XmlElement(ElementName = "map")]
            public Map Map { get; set; }
            [XmlAttribute(AttributeName = "id")]
            public string Id { get; set; }
        }

        [XmlRoot(ElementName = "bairro")]
        public class Bairro
        {
            [XmlElement(ElementName = "lojas")]
            public List<Lojas> Lojas { get; set; }
            [XmlAttribute(AttributeName = "nome")]
            public string Nome { get; set; }
        }

        [XmlRoot(ElementName = "cidade")]
        public class Cidade
        {
            [XmlElement(ElementName = "bairro")]
            public List<Bairro> Bairro { get; set; }
            [XmlAttribute(AttributeName = "nome")]
            public string Nome { get; set; }
        }

        [XmlRoot(ElementName = "uf")]
        public class Uf
        {
            [XmlElement(ElementName = "cidade")]
            public List<Cidade> Cidade { get; set; }
            [XmlAttribute(AttributeName = "uf")]
            public string _uf { get; set; }
        }

        [XmlRoot(ElementName = "estados")]
        public class Estados
        {
            [XmlElement(ElementName = "uf")]
            public List<Uf> Uf { get; set; }
        }






}
