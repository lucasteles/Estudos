using JsonUtils;
using Newtonsoft.Json;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace StoreAdressParser
{
    class Program
    {

        static volatile IList<string> Proxys;
        
        static volatile int ProxyIndex = 0;
        static volatile int Processed = 0;

        static void Main(string[] args)
        {
            #region "proxys"
            Proxys = new List<string>{
                "",
                "177.101.181.169:80",
                "179.178.165.151:8080",
                "191.53.229.237:8080",
                "179.125.124.239:8080",
                "177.200.82.236:8080",
                "189.38.251.223:8080",
                "177.22.111.113:3128",
                "186.219.0.136:8080",
                "177.87.111.152:8080",
                "187.20.122.171:8080",
                "177.38.206.138:3128",
                "177.157.68.243:8080",
                "138.99.66.63:8080",
                "201.48.251.229:3128",
                "191.242.56.4:8080",
                "131.255.153.255:3128",
                "150.161.21.107:8080",
                "177.135.226.181:80",
                "168.90.43.17:8080",
                "191.37.160.93:8080",
                "201.20.109.42:3128",
                "177.220.179.8:3128",
                "177.36.242.54:8080",
                "177.130.59.66:3128",
                "189.124.153.94:3128",
                "177.43.50.214:80",
                "177.34.49.246:3128",
                "177.87.241.94:8080",
                "177.136.224.19:8080",
                "138.219.177.240:8080",
                "187.109.231.164:8080",
                "200.168.52.170:8080",
                "187.120.3.146:3128",
                "187.86.182.18:8080",
                "187.115.148.141:3128",
                "187.6.249.59:3128",
                "189.70.35.235:8080",
                "187.44.1.54:8080",
                "138.94.20.161:3128",
                "177.75.236.25:8080",
                "177.152.118.194:8081",
                "177.99.208.10:3128",
                "186.235.186.253:3128",
                "189.11.36.213:8080",
                "186.225.33.164:33051",
                "189.90.34.162:33051",
                "177.128.122.134:3305",
                "177.91.86.102:33051",
                "189.90.253.107:33051",
                "177.73.63.214:33051",
                "187.110.225.173:2122",
                "177.131.50.95:33051",
                "191.5.214.16:33051",
                "177.44.196.254:3128",
                "177.152.39.33:33051",
                "201.55.143.250:3128",
                "177.82.219.185:3128",
                "187.20.100.68:8080",
                "177.37.243.251:3128",
                "189.85.20.129:8080",
                "177.19.164.74:3128",
                "186.225.41.201:8080",
                "191.7.200.85:8080",
                "138.0.236.54:8080",
                "179.185.77.205:3128",
                "177.44.188.219:8080",
                "189.100.57.164:3128",
                "179.219.230.80:3128",
                "191.243.66.127:8080",
                "201.33.184.234:8080",
                "177.44.136.226:3128",
                "177.126.89.76:8080",
                "177.23.162.50:3128",
                "177.128.192.113:8089",
                "177.43.75.154:8080",
                "177.136.170.77:80",
                "200.213.158.51:8080",
                "179.232.236.26:3128",
                "177.72.96.89:8000",
                "177.180.10.21:3128",
                "200.139.12.201:80",
                "191.5.92.125:43032",
                "187.87.188.73:43032",
                "177.86.94.162:43032",
                "201.57.249.10:3128",
                "177.39.186.59:8008",
                "187.45.175.210:8000",
                "138.97.229.143:43032",
                "191.5.85.108:43032",
                "191.5.82.152:43032",
                "179.125.86.166:43032",
                "191.5.95.13:43032",
                "187.109.94.232:43032",
                "138.118.76.106:43032",
                "138.204.72.41:43032",
                "179.191.144.55:43032",
                "177.190.114.45:43032",
                "186.237.185.53:43032",
                "177.67.74.203:43032",
                "201.54.169.158:43032",
                "186.216.142.155:4303",
                "177.73.10.178:43032",
                "187.49.141.5:43032",
                "187.45.39.186:43032",
                "177.152.169.157:4303",
                "177.124.191.23:43032",
                "189.59.143.44:8080",
                "177.190.209.10:8080",
                "177.22.123.250:8080",
                "191.33.171.138:8080",
                "200.98.139.205:4444",
                "200.192.248.74:8080",
                "187.33.48.163:8080",
                "191.253.68.151:8080",
                "179.185.119.119:80",
                "177.53.114.205:8080",
                "177.87.79.101:8081",
                "187.255.224.211:80",
                "177.152.165.23:43032",
                "189.5.173.160:80",
                "177.87.241.226:8080",
                "177.43.164.2:3128",
                "177.177.65.172:8080",
                "177.105.175.62:3128",
                "189.45.56.98:3128",
                "177.126.81.50:3128",
                "177.101.97.246:3128",
                "177.43.212.44:3128",
                "201.55.143.1:3128",
                "201.55.144.114:3128",
                "177.184.140.61:8080",
                "189.90.244.154:8080",
                "187.66.166.86:8080",
                "200.9.220.94:3128",
                "138.204.142.53:3128",
                "177.220.173.117:3128",
                "189.78.145.24:8080",
                "177.92.48.79:8888",
                "177.55.253.68:8080",
                "201.22.148.48:3128",
                "187.8.128.53:8080",
                "179.111.221.32:3128",
                "177.39.160.70:8080",
                "186.231.97.128:8888",
                "177.38.207.17:8080",
                "201.49.210.18:8080",
                "177.103.138.75:8081",
                "186.225.52.57:8080",
                "177.75.236.17:8080",
                "177.21.227.133:8080",
                "200.129.71.2:8080",
                "189.84.192.194:8080",
                "177.55.83.193:8080",
                "200.175.157.204:8080",
                "177.98.59.149:8080",
                "177.194.176.17:3128",
                "189.84.113.237:8080",
                "177.85.92.136:3128",
                "179.215.225.205:80",
                "201.54.5.115:8080",
                "177.85.7.139:8080",
                "186.194.47.146:3128",
                "177.43.243.107:8080",
                "187.95.247.237:8080",
                "177.105.183.68:8080",
                "131.0.60.66:8080",
                "200.229.236.122:8080",
                "191.177.201.65:3128",
                "187.84.187.4:80",
                "177.10.149.139:8080",
                "187.44.162.149:8080",
                "187.75.231.100:3128",
                "177.72.81.56:80",
                "191.7.212.210:8080",
                "177.21.98.19:8080",
                "191.242.79.70:80",
                "200.195.167.26:8080",
                "179.185.77.204:3128",
                "191.5.114.138:8080",
                "177.155.184.10:8080",
                "187.35.96.50:3128",
                "201.20.182.28:8080",
                "177.189.243.217:3128",
                "186.227.208.162:8081",
                "177.134.189.112:8080",
                "189.85.29.98:8080",
                "201.47.255.98:8080",
                "143.208.29.2:8080",
                "177.91.179.102:8080",
                "177.91.26.133:8080",
                "177.73.72.208:8080",
                "189.3.237.162:8080",
                "177.8.170.11:80",
                "201.20.182.122:8080",
                "187.60.154.162:3128",
                "187.44.255.10:8080",
                "177.44.196.254:3128",
                "201.57.249.2:3128",
                "177.87.241.226:8080",
                "177.91.23.221:8080",
                "187.109.231.164:8080",
                "177.99.208.10:3128",
                "186.211.9.52:80",
                "187.75.231.100:3128",
                "177.43.212.44:3128",
                "186.235.186.253:3128",
                "186.231.101.199:80",
                "177.105.183.68:8080",
                "177.94.223.204:3128",
                "201.20.108.130:8080",
                "200.150.113.116:8080",
                "187.18.122.211:8080",
                "187.72.190.238:8080",
                "201.48.251.229:3128",
                "189.5.173.160:80",
                "189.11.36.213:8080",
                "201.7.216.85:3128",
                "201.48.251.236:3128",
                "200.237.249.55:80",
                "177.43.75.154:8080",
                "177.84.72.34:3128",
                "189.28.166.79:80",
                "177.101.181.169:80"
            };

            #endregion


           GenerateXML("list.json");


            var all = new List<LojaModel>();
            for (int i = 0; i < args.Length; i=i+2)
            {

                all.AddRange(
                    loadExcel(args[i], args[i + 1])
                    );
            }

            GenerateXML(all);


            Console.Write("Completed...");
            Console.Read();
        }


        static IList<LojaModel> loadExcel(string fileName, string plan)
        {
                       
            FileInfo newFile = new FileInfo(fileName);
            ExcelPackage pck = new ExcelPackage(newFile);
            //Add the Content sheet
            var ws = pck.Workbook.Worksheets.Where(e => e.Name == plan).FirstOrDefault();
            var ret = new List<LojaModel>();
            int rows = 0;


            //conta linhas

            Console.Write(" -> "+Path.GetFileName(fileName) + " (" + plan + ") \n");

            while (ws.Cells[ rows+1, 1].Value != null)
                rows++;

            Processed = 0;
            //Parallel.For(2, rows, row =>
            for (int row = 2; row <= rows; row++)
            {

                Func<int, object> CellVal = (e => ws.Cells[row, e].Value);


                //trata endereço
                var end_full = CellVal(6).ToString();
                var end = end_full.Split(',').ToList();

                if (end.Count() == 1)
                    end.Add("");

                end[1] = end[1].ToUpper().Replace("NUMERO","").Trim();

                if (end[1].Contains("-"))
                {
                    if (end.Count() < 3)
                        end.Add("");

                    end[2] = end[1].Split('-')[1].Trim() + end[2];
                    end[1] = end[1].Split('-')[0].Trim();
                }

                int _;
                if (!int.TryParse(end[1], out _))
                    end[1] = "";

                var search = CellVal(1) + "," + CellVal(2) + "," + CellVal(3) + "," + end[0] + ", " + end[1];
                Console.Write("({1}%) at {2} - {0} \n", search, Processed*100/rows, Proxys[ProxyIndex]);

                var item = GoogleGeoCode(search).FirstOrDefault();
                if (item != null && item.Pais!=null  && item.Pais.ToUpper().Trim() != "BR")
                    item = null;


                if (item == null)
                {
                    item = GoogleGeoCode(end[0]+","+end[1] ).FirstOrDefault();
                    if (item != null && item.Pais != null  && item.Pais.ToUpper().Trim() != "BR")
                        item = null;

                    if (item == null)
                    {
                        item = GoogleGeoCode(CellVal(1) + "," + CellVal(2) + "," + CellVal(3)).FirstOrDefault();

                        double num;
                        if (item!= null && CellVal(10) != null && double.TryParse(CellVal(10).ToString().Replace(".", ","), out num) )
                            item.Lat = num;

                        if (item != null  && CellVal(11) != null && double.TryParse(CellVal(11).ToString().Replace(".", ","), out num))
                            item.Long = num;

                    }                      

                    if (item == null)
                    {                        
                        item = new LojaModel();
                        item.UF = CellVal(1).ToString();
                        item.Cidade = CellVal(2).ToString();
                        item.Bairro = CellVal(3).ToString();
                        item.Cep = (CellVal(7) ?? "").ToString();
                        item.Lat = 0;
                        item.Long = 0;

                        double num;
                        if (CellVal(10) != null && double.TryParse(CellVal(10).ToString().Replace(".", ","), out num))
                            item.Lat = num;

                        if (CellVal(11) != null && double.TryParse(CellVal(11).ToString().Replace(".", ","), out num))
                            item.Long = num;

                    }

                  
                    
                    if (!int.TryParse(end[1], out _ ))
                        end = new List<string> { end[0], "", end[1] + end_full.Substring(end_full.IndexOf(end[1]) + end[1].Length) };

                    //tenta buscar um cep mais preciso caso nao encontre
                    if ((item.Cep == null || item.Cep.Length != 9) && (item.Lat + item.Long != 0))
                    {
                        var cepSearch = GoogleGeoCode(item.Lat.ToString().Replace(",", ".") + ","
                                                + item.Long.ToString().Replace(",", ".")
                                                ).FirstOrDefault();
                        if (cepSearch != null)
                            item.Cep = cepSearch.Cep ?? "";
                                             
                    }


                }


                if (item.Lat == 0 || item.Long == 0)
                {
                    var itemAux = GoogleGeoCode(CellVal(1) + "," + CellVal(2)).FirstOrDefault();
                    if (itemAux != null)
                    {
                        item.Lat = itemAux.Lat;
                        item.Long = itemAux.Long;
                    }
                }

                item.Empresa = CellVal(5).ToString();
                item.Id = CellVal(4).ToString();


                item.TipoEstabelecimento = CellVal(12)?.ToString(); 
                item.ServicosAtendidos = CellVal(13)?.ToString();
                item.ServicosDisponiveis = CellVal(14)?.ToString();

                // nao achou numero ajusta endereço
                if (string.IsNullOrEmpty(item.Numero)  && string.IsNullOrEmpty(end[1]) )
                    item.Numero = end[1];             

                if (string.IsNullOrEmpty(item.Rua))
                    item.Rua = end[0];

                if (string.IsNullOrEmpty(item.UF) || item.UF.Length!=2)
                    item.UF = CellVal(1).ToString();

                if (string.IsNullOrEmpty(item.Cidade))
                    item.Cidade = CellVal(2).ToString();

                if (string.IsNullOrEmpty(item.Bairro))
                    item.Bairro = CellVal(3).ToString();

                if ( (item.Cep == null || item.Cep.Length != 9) && CellVal(7)!=null )
                    item.Cep = CellVal(7).ToString();

                double number;
                if (item.Lat == 0 && CellVal(10) != null && double.TryParse(CellVal(10).ToString().Replace(".",","), out number))
                    item.Lat = number;

                if (item.Long == 0 && CellVal(11) != null && double.TryParse(CellVal(11).ToString().Replace(".", ","), out number))
                    item.Long = number;


                var r = new Regex("\\d{5}-\\d{3}"); // removere cep do endereço
                var comp = string.Empty;

                if (end.Count() >= 3)
                    comp = string.Join(" ", end.ToArray(), 2, end.Count - 2)
                        .Replace(CellVal(2).ToString(), "")
                        .Replace(CellVal(3).ToString(), "")
                        .Replace("(vazio)", "")
                        .Trim();
                       

                comp = r.Replace(comp, "").Replace("-", ""); ;

                item.Complemento = comp;

                item.Horarios = CellVal(8).ToString().Split(',').ToList();

                

                ret.Add(item);

                Processed++;
            };


            return ret;
        }

        static dynamic GetFromApi(string address)
        {
            
            string url = "http://maps.googleapis.com/maps/api/geocode/json?sensor=true&address=";

            dynamic googleResults = null;
            bool error = false;

            try
            {
                var p = Proxys[ProxyIndex].Split(':');

                if (string.IsNullOrEmpty(Proxys[ProxyIndex]))
                    googleResults = new Uri(url + address).GetDynamicJsonObject();
                else
                    googleResults = new Uri(url + address).GetDynamicJsonObject(p[0], int.Parse(p[1]));
            }
            catch{
                error = true;
            }
            


            while (error || googleResults.status == "OVER_QUERY_LIMIT" || googleResults.status == "REQUEST_DENIED" )
            {
                Console.WriteLine("\n** Error ocurred **" + (error? " at "+Proxys[ProxyIndex] : googleResults.status));
                            

                error = false;
                ProxyIndex++;
                             
                               
                
               
                if (ProxyIndex % Proxys.Count() == 0) { ProxyIndex = 0; }

                try
                {
                    var p = Proxys[ProxyIndex].Split(':');
                    googleResults = new Uri(url + address).GetDynamicJsonObject(p[0], int.Parse(p[1]));
                    Console.WriteLine("Sucess... {0} \n", Proxys[ProxyIndex]);
                }
                catch
                {
                    error = true;
                }
            }
            

           
            if (ProxyIndex % Proxys.Count() == 0) { ProxyIndex = 0; }

            return googleResults;
        }

        static IList<LojaModel> GoogleGeoCode(string address)
        {

            dynamic googleResults = GetFromApi(address);

            var ret = new List<LojaModel>();

            Func<dynamic, string, bool> contains = (l, s) => { foreach (var i in l) { if (i == s) return true; } return false; } ;

         


            foreach (var result in googleResults.results)
            {

                var item = new LojaModel();

                

                foreach (var e in result.address_components)
                {
                    if (contains(e.types, "route"))
                        item.Rua = e.long_name;

                    if (contains(e.types, "street_number"))
                        item.Numero = e.long_name.ToString();


                    if (contains(e.types, "postal_code"))
                        item.Cep = e.long_name.ToString();

                    if (contains(e.types, "sublocality_level_1"))
                        item.Bairro = e.long_name;

                    if (contains(e.types, "administrative_area_level_2"))
                        item.Cidade = e.long_name;

                    if (contains(e.types, "administrative_area_level_1"))
                        item.UF = e.short_name;

                    if (contains(e.types, "country"))
                        item.Pais = e.short_name;

                }


                item.Lat = double.Parse( result.geometry.location.lat );
                item.Long = double.Parse(result.geometry.location.lng );

                item.Endereco = result.formatted_address;

               

                ret.Add(item);

            }

            return ret;
        }

        static void GenerateXML(string filename)
        {

            var list = new List<LojaModel>();

            // deserialize JSON directly from a file
            using (var file = File.OpenText(filename)) { 

                var serializer = new JsonSerializer();
                list = (List<LojaModel>)serializer.Deserialize(file, typeof(List<LojaModel>));
            }

            GenerateXML(list);
        }

        static void GenerateXML(IList<LojaModel> list)
        {
             var estados = new Estados();

            Func<string, string> xx = (text => {
              return  string.Concat(
                    text.Normalize(NormalizationForm.FormD)
                    .Where(ch => CharUnicodeInfo.GetUnicodeCategory(ch) !=
                    UnicodeCategory.NonSpacingMark)
                    ).Normalize(NormalizationForm.FormC).ToUpper();
            });

           

            estados.Uf =
                list.GroupBy(e => xx(e.UF).ToUpper())
                    .Select(e => new Uf { _uf = e.Key }).ToList();


            list = list.OrderBy(e => e.UF).ThenBy(e => e.Cidade).ThenBy(e => e.Bairro).ToList();

            
            var serializerj = new JsonSerializer();
            using (var sw = new StreamWriter(@"list.json"))
            using(var w = new JsonTextWriter(sw))
                serializerj.Serialize(w, list);
                    
            


            foreach (var uf in estados.Uf)
            {
               uf.Cidade = list.Where(e => xx(e.UF) == xx(uf._uf))
                            .GroupBy(e=>e.Cidade.ToUpper())
                            .Select(e=>new Cidade() {
                                Nome = e.Key.ToTitleCase()
                            } ).ToList();

                foreach (var cidade in uf.Cidade)
                {
                    cidade.Bairro = list.Where(e => xx(e.Cidade) == xx(cidade.Nome) && xx(e.UF) == xx(uf._uf))
                        .GroupBy(e => e.Bairro.ToUpper())
                          .Select(e => new Bairro()
                          {
                              Nome = e.Key.ToTitleCase()
                          }).ToList();

                    foreach (var bairro in cidade.Bairro)
                    {
                        bairro.Lojas = list
                             .Where(l => l.UF == xx(uf._uf) && xx(l.Cidade) == xx(cidade.Nome) && xx(l.Bairro) == xx(bairro.Nome))
                            .Select(l => new Lojas
                            {
                                Id = l.Id,
                                Empresa = l.Empresa.ToTitleCase(),
                                Endereco = l.Rua.ToTitleCase() + " " + l.Numero,
                                Cep = l.Cep,
                                Tipo = l.TipoEstabelecimento,
                                ServicosTelecomAtend = l.ServicosAtendidos,
                                ServicosProdutosDisp = l.ServicosDisponiveis,
                                Horarios = new Horarios
                                {
                                    Horario = l.Horarios.Select(h =>
                                               new Horario
                                               {
                                                   Descricao = h.Split(':')[0].ToTitleCase(),
                                                   Hora = h.Substring(h.IndexOf(":") + 1).Trim()
                                               }).ToList()
                                },
                                Obs = l.Complemento,
                                Map = new Map { Lat = l.Lat.ToString().Replace(",", "."), Lon = l.Long.ToString().Replace(",", ".") },
                                
                            }).ToList();
                    }
                }
            }



            var serializer = new XmlSerializer(estados.GetType());
            StreamWriter writer = new StreamWriter(@"list.xml");

            serializer.Serialize(writer.BaseStream, estados);



        

        }

    }


    public static class Extensions
    {
        public static string ToTitleCase(this string me)
        {
            var textInfo = new CultureInfo("pt-BR", false).TextInfo;

            if (me == null) { return string.Empty; }

            return textInfo.ToTitleCase(me.ToLower()).Trim();
        }

    }

}
