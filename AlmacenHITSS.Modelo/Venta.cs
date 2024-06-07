using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlmacenHITSS.Modelo
{
    public class Venta
    {
        public int Id { get; set; }
        public int IdProductoCliente { get; set; }
        public Cliente Cliente { get; set; }
        public Producto Producto { get; set; }
        public decimal ValorTotal { get; set; }
        public DateTime FechaCompra { get; set; }
    }
}
