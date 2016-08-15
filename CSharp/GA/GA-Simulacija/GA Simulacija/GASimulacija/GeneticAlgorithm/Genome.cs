using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Genetic_Algorithm
{
    public class Genome
    {
        private List<Gene> lstActions;
        public List<Gene> Actions
        {
            set { lstActions = value; }
            get { return lstActions; }
        }
        private double fitness;
        public double Fitness
        {
            set { fitness = value; }
            get { return fitness; }
        }

        public Genome()
        {
            this.fitness = 0;
        }

        public Genome(int numberOfActions,Random objRandom)
        {
            this.fitness = 0;
            this.lstActions = new List<Gene>();
            for (int i = 0; i < numberOfActions; i++)
            {
                this.lstActions.Add(new Gene(objRandom, 10));
            }
        }

    }
}
