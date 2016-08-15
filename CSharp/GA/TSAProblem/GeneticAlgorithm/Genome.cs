using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TSAProblem.GeneticAlgorithm
{
    public class Genome
    {
        private List<int> cities;
        private double fitness;
        public List<int> Cities
        {
            set { cities = value; }
            get { return cities; }
        }
        public double Fitness
        {
            set { fitness = value; }
            get { return fitness; }
        }

        private Random objRandom;

        public Genome()
        {
            this.fitness = 0;
        }

        public Genome(int numberOfCities,Random objRandom)
        {
            this.fitness = 0;
            this.objRandom = objRandom;
            cities = GrabPermutation(numberOfCities);
        }

        private List<int> GrabPermutation(int limit)
        {
            List<int> lstVecPerm = new List<int>();

            for (int i = 0; i < limit; i++)
            {
                int nextPossibleNumber = objRandom.Next(0, limit);

                while (TestNumber(lstVecPerm, nextPossibleNumber))
                {
                    nextPossibleNumber = objRandom.Next(0, limit);
                }

                lstVecPerm.Add(nextPossibleNumber);
            }
            return lstVecPerm;
        }

        private bool TestNumber(List<int> vector, int NextPossibleNumber)
        {
            return vector.Contains(NextPossibleNumber);
        }
    }
}
