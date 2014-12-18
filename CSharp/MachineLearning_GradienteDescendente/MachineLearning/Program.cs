using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
namespace MachineLearning
{
    class Program
    {

        const int qtX = 5;


        public static float[,] dados = null;
        public static float[] saidas = null;
        public static double[] thetas = null;

        static void Main(string[] args)
        {
            CarregaDados();



            // taxa de aprendizagem
            double taxa = 0.0000001;

            //erro permitido
            double erro = 0.0001;


            // fator de regularização
            double regularizacao = 10000;

            int qt_iteracoes = 0;
            int max_iteracoes = 100000;

            //cria deltas
            thetas = new double[qtX + 1];
            double[] thetas_tmp = new double[thetas.Length];


            double[] thetas2 = new double[thetas.Length];
            double[] thetas_tmp2 = new double[thetas.Length];

            // inicia deltas com 0
            thetas.SetValue(0, 0);
            thetas2.SetValue(0, 0);

            int M = dados.GetLength(0);

            bool convergiu = false;
            while (!convergiu && qt_iteracoes < max_iteracoes)
            {
                double current_error = 0;
                for (int j = 0; j < thetas.Length; j++)
                {
                    double somaM = 0;
                    for (int i = 0; i < M; i++)
                    {
                        if (j == 0)
                            somaM += (H(thetas, i) - saidas[i]);
                        else
                            somaM += (H(thetas, i) - saidas[i]) * dados[i, j - 1];
                    }

                    double tempTheta;

                    tempTheta = thetas[j] - taxa * ((double)1 / M) * somaM;
                    thetas_tmp[j] = tempTheta;


                    tempTheta = (thetas2[j] * (1 - taxa * ((double)regularizacao / M))) - taxa * ((double)1 / M) * somaM;

                        

                    thetas_tmp2[j] = tempTheta;


                    double variacao = Math.Abs(tempTheta - thetas2[j]);


                    // guarda maior erro

                    double err = (double)(variacao / thetas2[j]);
                    if (err > current_error)
                        current_error = err;


                }


                if (current_error <= erro)
                    convergiu = true;
                else
                {
                    thetas_tmp.CopyTo(thetas, 0);
                    thetas_tmp2.CopyTo(thetas2, 0);
                }

                qt_iteracoes++;

                Console.Clear();
                Console.WriteLine("{0}%", (((double)qt_iteracoes / max_iteracoes * 100.000)));


            }



            Console.Clear();
            #region "show the results"


            StringBuilder output_CR = new StringBuilder();
            StringBuilder output_SR = new StringBuilder();
            
            Console.WriteLine("OK");


            output_CR.AppendLine( string.Format("{0}", qt_iteracoes) );
            output_SR.AppendLine( string.Format("{0}", qt_iteracoes) );

            output_SR.AppendLine("");
            output_CR.AppendLine("");

            for (int i = 0; i < thetas.Length; i++)
                output_SR.AppendLine( string.Format("Theta{0}={1}; ", i, thetas[i]) );

            Console.WriteLine("");
            for (int i = 0; i < thetas2.Length; i++)
                output_CR.AppendLine( string.Format("Theta{0}={1}; ", i, thetas2[i]) );

            output_SR.AppendLine("");
            output_CR.AppendLine("");

            for (int i = 0; i < dados.GetLength(0); i++)
            {
                output_SR.AppendLine( string.Format("h0={0} - y={1}  {2}     erro: {3}", H(thetas, i), saidas[i], (saidas[i] - H(thetas, i) < 0 ? "-" : "+"), (saidas[i] - H(thetas, i))) );

                output_CR.AppendLine( string.Format("h0={0} - y={1}  {2}     erro: {3}", H(thetas2, i), saidas[i], (saidas[i] - H(thetas2, i) < 0 ? "-" : "+"), (saidas[i] - H(thetas2, i))) );

            }
            
            #endregion


            

            System.IO.StreamWriter file;
            file = new System.IO.StreamWriter("output_CR.txt");
            file.WriteLine(output_CR.ToString());
            file.Close();


            file = new System.IO.StreamWriter("output_SR.txt");
            file.WriteLine(output_SR.ToString());
            file.Close();

            Console.ReadKey();
        }

        public static double H(double[] thetas, int lineData)
        {
            double result = 0;
            for (int i = 0; i < thetas.Length; i++)
            {
                if (i == 0)
                    result += thetas[i];
                else
                    result += thetas[i] * dados[lineData, i - 1];
            }
            return result;
        }


        static void CarregaDados()
        {
            string file = @"dados.dat";

            int curent = 0;
            int qtLines = 0;
            var reader = new StreamReader(File.OpenRead(file));
            while (!reader.EndOfStream)
            {
                string aux = reader.ReadLine();
                if (!aux.StartsWith("#") && aux.Trim() != "")
                    qtLines++;
            }


            dados = new float[qtLines, qtX];
            saidas = new float[qtLines];
            reader = new StreamReader(File.OpenRead(file));
            while (!reader.EndOfStream)
            {
                var line = reader.ReadLine();

                if (line.StartsWith("#") || line.Trim() == "")
                    continue;

                var values = line.Split(';');

                int i;
                for (i = 0; i < qtX; i++)
                {
                    dados[curent, i] = float.Parse(values[i]);
                }
                saidas[curent] = float.Parse(values[i]);

                curent++;
            }

        }



    }
}