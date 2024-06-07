using AlmacenHITSS.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlmacenHITSS.Negocio
{
    public class GestionProducto
    {
        public void CrearProducto(Modelo.Producto producto)
        {
            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                contexto.CrearProducto(producto.NombreProducto,producto.Cantidad,producto.Precio);
            }

        }
        public Modelo.Producto ConsultarProducto(int idProducto)
        {
            Modelo.Producto producto = new Modelo.Producto();
       
            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                var resultado = contexto.ConsultarProducto(idProducto);
                producto = resultado.ToList().ConvertAll(x => new Modelo.Producto
                {
                  NombreProducto = x.NombreProducto,
                  Cantidad = x.Cantidad,
                  Precio = x.Precio,

                }).FirstOrDefault();
            }

            return producto;


        }

        public List<Modelo.Producto> ObtenerProductos()
        {
            List<Modelo.Producto> lstproducto = new List<Modelo.Producto>();

            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                var resultado = contexto.ObtenerProductos();
                lstproducto = resultado.ToList().ConvertAll(x => new Modelo.Producto
                {
                    NombreProducto = x.NombreProducto,
                    Cantidad = x.Cantidad,
                    Precio = x.Precio,

                });
            }

            return lstproducto;


        }
    }
}
