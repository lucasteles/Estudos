using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using EntityTeste.Models;

namespace EntityTeste
{
    public partial class Digitar1 : formDigitar
    {
        // apenas para demsntrar como é carregado automaticamente a dao do pedido pelo inbjector
        private IBaseDAO<Pedido> _pedido;

        public Digitar1(IBaseDAO<Pedido> pedido)
        {
            // aqui define que model utilizar no digitar
            setModel<Cliente>();


            //injeta pedido para usar em qualquer coisa
            _pedido = pedido;

            InitializeComponent();
        }
    }
}
