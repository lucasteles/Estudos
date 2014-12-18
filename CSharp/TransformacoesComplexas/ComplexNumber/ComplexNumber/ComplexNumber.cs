using System;
using System.Collections.Generic;
using System.Text;

namespace CalcComplexNumber
{
    public class ComplexNumber
    {
        public double n0Real = 0;
        public double n0Imaginario = 0;
        public double nReal = 0;
        public double nImaginario = 0;  

        public ComplexNumber()
        { 

        }
        
        public void somar()
        {
            ComplexSomar Calc = new ComplexSomar();
            //CRIA ENVIO PARA A SOMA
            Calc.n0Imaginario = n0Imaginario;
            Calc.nImaginario = nImaginario;
            Calc.n0Real = n0Real;
            Calc.nReal = nReal;

            //EXECUTA A SOMA
            Calc.RetornaSoma();

            //RECEBE A SOMA
            n0Imaginario = Calc.n0Imaginario;
            n0Real = Calc.n0Real;
        }

    }
}
