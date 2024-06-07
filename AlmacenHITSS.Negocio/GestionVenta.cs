using AlmacenHITSS.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlmacenHITSS.Negocio
{
    public class GestionVenta
    {
        public void InsertarVenta(Modelo.Venta venta)
        {
            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                contexto.InsertarVenta(venta.Cliente.IdCliente, venta.Producto.IdProducto, venta.ValorTotal,venta.FechaCompra);
            }

        }
        public List<Modelo.Venta> ConsultarVentas()
        {
            List<Modelo.Venta> lstVenta = new List<Modelo.Venta>();

            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                var resultado = contexto.ConsultarVentas();
                lstVenta = resultado.ToList().ConvertAll(x => new Modelo.Venta
                {
                     Cliente = new Modelo.Cliente { Nombres = x.Nombre, Apellidos = x.Apellidos },
                     Producto = new Modelo.Producto { NombreProducto = x.Producto},
                     ValorTotal = x.Valor,
                     FechaCompra = x.Fecha,
                });
            }

            return lstVenta;


        }
    }
}
