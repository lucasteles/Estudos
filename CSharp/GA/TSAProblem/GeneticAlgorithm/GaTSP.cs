using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TSAProblem.GeneticAlgorithm
{
    public class GAEventArgs : EventArgs
    {
        public Bitmap MapImage;
    }

    public delegate void DrawMapHandle(object sender, EventArgs e);
    public class GaTSP
    {
        private List<Genome> lstPopulation;
        private MapTSP objMap;

        public event DrawMapHandle DrawMap;
        protected virtual void OnDrawMap(EventArgs e)
        {
            if (DrawMap != null)
                DrawMap(this, e);
        }

        private GAParams Params;
        private int NumBest2Add = 1;

        private double totalFitness;
        private double shortestRoute;
        public double BestSolution
        {
            get { return shortestRoute; }
        }
        private double longestRoute;
        private int fittestGenome;
        private int generation;
        private Random objRandom;

        public GaTSP(GAParams tParams)
        {
            lstPopulation = new List<Genome>();

            Params = tParams;

            this.fittestGenome = 0;
            this.generation = 0;
            this.shortestRoute = double.MaxValue;
            this.longestRoute = 0;

            objRandom = new Random();

            objMap = new MapTSP(tParams.numberOfCities);
            CreateStartingPopulation();
        }

        private List<int> Mutation(List<int> vector)
        {
            List<int> lstMutated = Copy(vector);

            if (objRandom.NextDouble() > Params.mutationRate) return lstMutated;

            int pos1 = objRandom.Next(0, Params.numberOfCities);
            int pos2 = pos1;

            while (pos1 == pos2)
            {
                pos2 = objRandom.Next(0, Params.numberOfCities);
            }

            int temp = lstMutated[pos1];
            lstMutated[pos1] = lstMutated[pos2];
            lstMutated[pos2] = temp;

            return lstMutated;
        }
        public List<int> MutateSM(List<int> vector)
        {
            List<int> lstMutated = Copy(vector);
            if (objRandom.NextDouble() > Params.mutationRate) return lstMutated;

            int minSpanSize = 3;
            int beg, end;
            beg = end = 0;
            ChooseSection(out beg, out end, lstMutated.Count, minSpanSize);

            int span = end - beg;
            int numberOfSwaprsRequired = span;

            while (numberOfSwaprsRequired!=0)
            {
                int no1 = objRandom.Next(beg, end + 1);
                int no2 = objRandom.Next(beg, end + 1);

                int temp = lstMutated[no1];
                lstMutated[no1] = lstMutated[no2];
                lstMutated[no2] = temp;

                --numberOfSwaprsRequired;
            }

            return lstMutated;
        }
        private void ChooseSection(out int beg, out int end, int maxSpanSize, int minSpanSize)
        {
            int spanSize = objRandom.Next(minSpanSize, maxSpanSize);
            beg = objRandom.Next(0, maxSpanSize - spanSize);
            end = beg + spanSize;
        }
        public List<int> MutateDM(List<int> vector)
        {
            List<int> lstMutated = Copy(vector);
            if (objRandom.NextDouble() > Params.mutationRate) return lstMutated;

            int minSpanSize = 3;
            int beg, end;
            beg = end = 0;
            ChooseSection(out beg, out end, lstMutated.Count, minSpanSize);

            List<int> lstTemp = new List<int>();
            for (int i = beg; i < end; i++)
            {
                lstTemp.Add(lstMutated[beg]);
                lstMutated.RemoveAt(beg);
            }

            int insertLocation = objRandom.Next(0, lstMutated.Count + 1);
            int count=0;
            for (int i = insertLocation; count<lstTemp.Count; i++)
            {
                lstMutated.Insert(i, lstTemp[count]);
                count++;
            }

            return lstMutated;
        }
        public List<int> MutateIM(List<int> vector)
        {
            List<int> lstMutated = Copy(vector);
            if (objRandom.NextDouble() > Params.mutationRate) return lstMutated;

            int randomPoint = objRandom.Next(0, lstMutated.Count);
            int tempNumber = lstMutated[randomPoint];
            lstMutated.RemoveAt(randomPoint);
            int insertAt = objRandom.Next(0, lstMutated.Count);
            lstMutated.Insert(insertAt, tempNumber);

            return lstMutated;
        }
        public List<int> MutateIVM(List<int> vector)
        {
            List<int> lstMutated = Copy(vector);
            if (objRandom.NextDouble() > Params.mutationRate) return lstMutated;

            int beg, end;
            beg = end = 0;
            ChooseSection(out beg, out end, lstMutated.Count, 2);
            List<int> lstTemp = new List<int>();
            for (int i = beg; i < end; i++)
            {
                lstTemp.Add(lstMutated[beg]);
                lstMutated.RemoveAt(beg);
            }
            lstTemp.Reverse();
            int count=0;
            for (int i = beg; i < end; i++)
            {
                lstMutated.Insert(i, lstTemp[count]);
                count++;
            }
            return lstMutated;
        }
        public List<int> MutateDIVM(List<int> vector)
        {
            List<int> lstMutated = Copy(vector);
            if (objRandom.NextDouble() > Params.mutationRate) return lstMutated;

            int beg, end;
            beg = end = 0;
            ChooseSection(out beg, out end, lstMutated.Count, 2);
            List<int> lstTemp = new List<int>();
            for (int i = beg; i < end; i++)
            {
                lstTemp.Add(lstMutated[beg]);
                lstMutated.RemoveAt(beg);
            }

            int numberOfSwaprsRequired = lstTemp.Count;
            while (numberOfSwaprsRequired != 0)
            {
                int no1 = objRandom.Next(0, lstTemp.Count);
                int no2 = objRandom.Next(0,lstTemp.Count);

                int temp = lstTemp[no1];
                lstTemp[no1] = lstTemp[no2];
                lstTemp[no2] = temp;

                --numberOfSwaprsRequired;
            }

            int insertLocation = objRandom.Next(0, lstMutated.Count + 1);
            int count = 0;
            for (int i = insertLocation; count < lstTemp.Count; i++)
            {
                lstMutated.Insert(i, lstTemp[count]);
                count++;
            }

            return lstMutated;
        }


        private void Crossover(List<int> mum, List<int> dad, out List<int> baby1, out List<int> baby2)
        {
            baby1 = Copy(mum);
            baby2 = Copy(dad);
            if (objRandom.NextDouble() > Params.crossoverRate || AreEqual(mum, dad))
            {
                return;
            }

            int beg = objRandom.Next(0, mum.Count - 1);

            int end = beg;

            while (end <= beg)
            {
                end = objRandom.Next(0, mum.Count);
            }

            for (int pos = beg; pos < end + 1; ++pos)
            {
                int gene1 = mum[pos];
                int gene2 = dad[pos];

                if (gene1 != gene2)
                {
                    int posGene1 = baby1.IndexOf(gene1);
                    int posGene2 = baby1.IndexOf(gene2);

                    int temp = baby1[posGene1];
                    baby1[posGene1] = baby1[posGene2];
                    baby1[posGene2] = temp;

                    posGene1 = baby2.IndexOf(gene1);
                    posGene2 = baby2.IndexOf(gene2);

                    temp = baby2[posGene1];
                    baby2[posGene1] = baby2[posGene2];
                    baby2[posGene2] = temp;
                }
            }
        }
        private void CrossoverOBX(List<int> mum, List<int> dad, out List<int> baby1, out List<int> baby2)
        {
            baby1 = Copy(mum);
            baby2 = Copy(dad);
            if (objRandom.NextDouble() > Params.crossoverRate || AreEqual(mum, dad))
            {
                return;
            }

            List<int> lstTempCities = new List<int>();
            List<int> lstPositions = new List<int>();

            int pos = objRandom.Next(0, mum.Count - 1);

            while (pos < mum.Count)
            {
                lstPositions.Add(pos);
                lstTempCities.Add(mum[pos]);
                pos += objRandom.Next(1, mum.Count - pos);
            }

            int cPos = 0;
            for (int cit = 0; cit < baby2.Count; ++cit)
            {
                for (int i = 0; i < lstTempCities.Count; ++i)
                {
                    if (baby2[cit] == lstTempCities[i])
                    {
                        baby2[cit] = lstTempCities[cPos];
                        ++cPos;
                        break;
                    }
                }
            }

            lstTempCities.Clear();
            cPos = 0;

            for (int i = 0; i < lstPositions.Count-1; ++i)
            {
                lstTempCities.Add(dad[lstPositions[i]]);
            }

            for (int cit = 0; cit < baby1.Count; ++cit)
            {
                for (int i = 0; i < lstTempCities.Count; ++i)
                {
                    if (baby1[cit] == lstTempCities[i])
                    {
                        baby1[cit] = lstTempCities[cPos];
                        ++cPos;
                        break;
                    }
                }
            }
        }
        private void CrossoverPBX(List<int> mum, List<int> dad, out List<int> baby1, out List<int> baby2)
        {
            baby1 = Copy(mum);
            baby2 = Copy(dad);
            if (objRandom.NextDouble() > Params.crossoverRate || AreEqual(mum, dad))
            {
                return;
            }

            for (int i = 0; i < mum.Count; i++)
            {
                baby1[i] = baby2[i] = -1;
            }

            int l = baby2.Count;

            List<int> lstPositions = new List<int>();
            int Pos = objRandom.Next(0, mum.Count - 1);

            while (Pos < mum.Count)
            {
                lstPositions.Add(Pos);
                Pos += objRandom.Next(1, mum.Count - Pos);
            }

            for (int pos = 0; pos < lstPositions.Count; ++pos)
            {
                baby1[lstPositions[pos]] = mum[lstPositions[pos]];
                baby2[lstPositions[pos]] = dad[lstPositions[pos]];
            }

            int c1, c2;
            c1 = c2 = 0;

            for (int pos = 0; pos < mum.Count; ++pos)
            {
                while (c2<mum.Count && baby2[c2]>-1)
                {
                    ++c2;
                }
                if (!baby2.Contains(mum[pos]))
                {
                    baby2[c2] = mum[pos];
                }

                while ((c1<mum.Count) && (baby1[c1]>-1))
                {
                    ++c1;
                }

                if (!baby1.Contains(dad[pos]))
                {
                    baby1[c1] = dad[pos];
                }

            }
        }

        private Genome RouletteWheelSelection()
        {
            double slice = objRandom.NextDouble() * (double)totalFitness;
            double total = 0;
            int selectedGenome = 0;

            for (int i = 0; i < Params.populationSize; i++)
            {
                total += lstPopulation[i].Fitness;

                if (total > slice)
                {
                    selectedGenome = i;
                    break;
                }
            }

            return lstPopulation[selectedGenome];
        }

        private void CalculatePopulationFitness()
        {
            totalFitness = 0;
            for (int i = 0; i < Params.populationSize; ++i)
            {
                double tourLength = objMap.GetTourLength(lstPopulation[i].Cities);
                lstPopulation[i].Fitness = tourLength;

                if (tourLength < shortestRoute)
                {
                    shortestRoute = tourLength;
                    fittestGenome = i;
                }
                if (tourLength > longestRoute)
                {
                    longestRoute = tourLength;
                }
            }

            for (int i = 0; i < Params.populationSize; ++i)
            {
                lstPopulation[i].Fitness = longestRoute - lstPopulation[i].Fitness;
                totalFitness += lstPopulation[i].Fitness;
            }
        }

        public void Epoch()
        {
            GAEventArgs objEA = new GAEventArgs();
            objEA.MapImage = objMap.MapImage;
            OnDrawMap(objEA);

            Reset();

            CalculatePopulationFitness();
            //if (shortestRoute <= objMap.BestPossibleRoute)
                //return;

            List<Genome> lstNewPop = new List<Genome>();

            objMap.Draw(lstPopulation[fittestGenome].Cities);

            lstPopulation = lstPopulation.OrderByDescending(x => x.Fitness).ToList();
            for (int i = 0; i < NumBest2Add; i++)
            {
                lstNewPop.Add(lstPopulation[i]);
            }

            while (lstNewPop.Count <= Params.populationSize)
            {
                Genome mum = RouletteWheelSelection();
                Genome dad = RouletteWheelSelection();

                Genome baby1, baby2;
                baby1 = new Genome();
                baby2 = new Genome();
                List<int> baby1List = new List<int>();
                List<int> baby2List = new List<int>();

                CrossoverPBX(mum.Cities, dad.Cities,out baby1List,out baby2List);

                baby1List = MutateIVM(baby1List);
                baby2List = MutateIVM(baby2List);

                baby1.Cities = baby1List;
                baby2.Cities = baby2List;

                lstNewPop.Add(baby1);
                lstNewPop.Add(baby2);
            }

            lstPopulation = Copy(lstNewPop);
            
            ++generation;
        }

        private void CreateStartingPopulation()
        {
            for (int i = 0; i < Params.populationSize; i++)
            {
                Genome objGenome = new Genome(Params.numberOfCities, objRandom);
                lstPopulation.Add(objGenome);
            }
        }

        private void Reset()
        {
            this.fittestGenome = 0;
            this.generation = 0;
            this.shortestRoute = double.MaxValue;
            this.longestRoute = 0;
        }

        private bool AreEqual(List<int> lst1, List<int> lst2)
        {
            if (lst1.Count != lst2.Count) return false;

            for (int i = 0; i < lst1.Count; i++)
            {
                if (lst1[i] != lst2[i]) return false;
            }
            return true;
        }

        private List<int> Copy(List<int> listToCopy)
        {
            List<int> lstReturn = new List<int>();
            for (int i = 0; i < listToCopy.Count; i++)
            {
                lstReturn.Add(listToCopy[i]);
            }
            return lstReturn;
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
