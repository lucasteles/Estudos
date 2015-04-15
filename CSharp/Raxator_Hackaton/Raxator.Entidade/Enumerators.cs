using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Raxator.Entidade
{
    public class Enumerators
    {
        public enum InviteAnswerTYpe
        {
            Waiting = 1,
            Accepted = 2, 
            Rejected = 3
        }

        public enum BillingStatus 
        { 
            Open = 1,
            Closed = 2
        }

        public enum PaymentType 
        { 
            Visa = 1,
            Master = 2,
            Elo = 3
        }

        public enum ButtonDirection
        {
            Left = 1,
            Right = 2,
        }
    }
}
