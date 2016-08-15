using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Genetic_Algorithm
{
    public class GA
    {
        private double crossOverRate;
        private double mutationRate;
        private int populationSize;
        private int genomeLength;
        private int generation;
        public int Generation
        {
            get { return generation; }
        }

        public int ElitismNumber
        {
            get;
            set;
        }
        private List<Genome> lstGenomes;
        public List<Genome> Genome
        {
            get { return lstGenomes; }
            set { lstGenomes = value; }
        }
        private Random objRandom;

        private double totalFitnessScore = 0;

        public GA(double crossOverRate, double mutationRate, int populationSize,int genomeLength)
        {
            this.lstGenomes = new List<Genome>();
            this.objRandom = new Random();

            this.crossOverRate = crossOverRate;
            this.mutationRate = mutationRate;
            this.populationSize = populationSize;
            this.genomeLength = genomeLength;

            CreateStartPopulation();
        }

        private void CreateStartPopulation()
        {
            for (int i = 0; i < populationSize; i++)
            {
                Genome objNewGenome = new Genome(genomeLength, objRandom);
                lstGenomes.Add(objNewGenome);
            }
        }

        private void UpdateFitnessScore()
        {
            double maxFitness = 0;
            totalFitnessScore = 0;

            for (int i = 0; i < lstGenomes.Count; i++)
            {
                if (lstGenomes[i].Fitness > maxFitness)
                {
                    maxFitness = lstGenomes[i].Fitness;
                }
                totalFitnessScore += lstGenomes[i].Fitness;
            }
        }

        public void Epoch()
        {
            UpdateFitnessScore();

            int newBabies = 0;
            List<Genome> lstNewBabies = new List<Genome>();

            lstGenomes = lstGenomes.OrderByDescending(x => x.Fitness).ToList();
            for (int i = 0; i < ElitismNumber; i++)
            {
                lstNewBabies.Add(lstGenomes[i]);
            }

            while (lstNewBabies.Count < populationSize)
            {
                Genome mum = RouletteWheelSelection();
                Genome dad = RouletteWheelSelection();

                Genome baby1, baby2;
                baby1 = new Genome();
                baby2 = new Genome();

                List<Gene> baby1List, baby2List;
                baby1List = new List<Gene>();
                baby2List = new List<Gene>();

                CrossOverMultiPoint(mum.Actions, dad.Actions, out baby1List, out baby2List);

                baby1List = Mutate(baby1List);
                baby2List = Mutate(baby2List);

                baby1.Actions = baby1List;
                baby2.Actions = baby2List;

                lstNewBabies.Add(baby1);
                lstNewBabies.Add(baby2);
                newBabies += 2;
            }

            lstGenomes = Copy(lstNewBabies);
            generation++;
        }

        private Genome RouletteWheelSelection()
        {
            double slice = objRandom.NextDouble() * (double)totalFitnessScore;
            double total = 0;
            int selectedGenome = 0;

            for (int i = 0; i < populationSize; i++)
            {
                total += lstGenomes[i].Fitness;

                if (total > slice)
                {
                    selectedGenome = i;
                    break;
                }
            }

            return lstGenomes[selectedGenome];
        }

        private List<Gene> Mutate(List<Gene> baby)
        {
            for (int i = 0; i < baby.Count; i++)
            {
                if (objRandom.NextDouble() < mutationRate)
                {
                    baby[i].Action = (ActionType)objRandom.Next(0, 4);
                }

                if (objRandom.NextDouble() < mutationRate / 2)
                {
                    int temp = objRandom.Next(0, 11);
                    if (temp < 5)
                        temp = -1;
                    else
                        temp = 1;

                    baby[i].Duration += temp * 10;
                    if (baby[i].Duration < 0)
                        baby[i].Duration = 0;
                    else if (baby[i].Duration > 10)
                        baby[i].Duration = 10;
                }
            }

            return baby;
        }

        private void CrossOverMultiPoint(List<Gene> mum, List<Gene> dad,
            out List<Gene> baby1,out List<Gene> baby2)
        {
            baby1 = new List<Gene>();
            baby2 = new List<Gene>();

            for (int i = 0; i < mum.Count; i++)
            {
                if (objRandom.NextDouble() < crossOverRate)
                {
                    baby2.Add(mum[i]);
                    baby1.Add(dad[i]);
                }
                else
                {
                    baby1.Add(mum[i]);
                    baby2.Add(dad[i]);
                }
            }
        }

        private List<Genome> Copy(List<Genome> listToCopy)
        {
            List<Genome> lstReturn = new List<Genome>();
            for (int i = 0; i < listToCopy.Count; i++)
            {
                lstReturn.Add(listToCopy[i]);
            }
            return lstReturn;
        }
    }
}
