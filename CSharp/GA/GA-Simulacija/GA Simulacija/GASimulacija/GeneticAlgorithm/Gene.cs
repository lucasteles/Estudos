using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Genetic_Algorithm
{
    public class Gene
    {
        private ActionType action;
        public ActionType Action
        {
            set { action = value; }
            get { return action; }
        }
        private int duration;
        public int Duration
        {
            set { duration = value; }
            get { return duration; }
        }

        public Gene(Random objRandom,int MAX_ACTION_DURATION)
        {
            action = (ActionType)objRandom.Next(0, 4);
            duration = objRandom.Next(1, MAX_ACTION_DURATION);
        }
    }

    public enum ActionType
    {
        Rotate_Left,
        Rotate_Right,
        Thrust,
        None
    }
}
