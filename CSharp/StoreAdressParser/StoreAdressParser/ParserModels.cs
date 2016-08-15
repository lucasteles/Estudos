using System;
using System.Xml.Serialization;
using System.Collections.Generic;
namespace StoreAdressParser
{
    [XmlRoot(ElementName = "horario")]
    public class Horario
    {
        [XmlElement(ElementName = "descricao")]
        public string Descricao { get; set; }
        [XmlElement(ElementName = "hora")]
        public string Hora { get; set; }
    }

    [XmlRoot(ElementName = "horarios")]
    public class Horarios
    {
        [XmlElement(ElementName = "horario")]
        public List<Horario> Horario { get; set; }
    }

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
        [XmlElement(ElementName = "horarios")]
        public Horarios Horarios { get; set; }
        [XmlElement(ElementName = "obs")]
        public string Obs { get; set; }
        [XmlElement(ElementName = "map")]
        public Map Map { get; set; }
        [XmlElement(ElementName = "tipo")]
        public string Tipo { get; set; }
        [XmlElement(ElementName = "servicosTelecomAtend")]
        public string ServicosTelecomAtend { get; set; }
        [XmlElement(ElementName = "servicosProdutosDisp")]
        public string ServicosProdutosDisp { get; set; }
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
