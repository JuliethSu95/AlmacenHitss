//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AlmacenHITSS.Persistencia
{
    using System;
    using System.Collections.Generic;
    
    public partial class Venta
    {
        public int IdProductoCliente { get; set; }
        public int IdCliente { get; set; }
        public int IdProducto { get; set; }
        public decimal ValorTotal { get; set; }
        public System.DateTime FechaCompra { get; set; }
    
        public virtual Cliente Cliente { get; set; }
        public virtual Producto Producto { get; set; }
    }
}
