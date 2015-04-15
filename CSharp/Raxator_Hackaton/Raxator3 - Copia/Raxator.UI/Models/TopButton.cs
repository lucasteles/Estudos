using Raxator.Entidade;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Raxator.UI.Models
{
    public class TopButton
    {
        public string Link { get; set; }
        public string Text { get; set; }
        public Enumerators.ButtonDirection Direction { get; set; }
    }
}

