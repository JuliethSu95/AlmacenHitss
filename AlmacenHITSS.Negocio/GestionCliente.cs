using AlmacenHITSS.Modelo;
using AlmacenHITSS.Persistencia;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlmacenHITSS.Negocio
{
    public class GestionCliente
    {
        public void CrearCliente(Modelo.Cliente cliente)
        {
            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                contexto.CrearCliente(cliente.TipoIdentificacion.IdTipoIdentificacion,cliente.NumeroIdentificacion,cliente.Nombres,cliente.Apellidos,cliente.Telefono);
            }

        }
        public Modelo.Cliente ConsultarClientes(int idCliente)
        {
            Modelo.Cliente cliente = new Modelo.Cliente();
            Modelo.TipoIdentificacion identificacion = new Modelo.TipoIdentificacion();
            using (AlmacenIngresoHitssEntities1 contexto = new AlmacenIngresoHitssEntities1())
            {
                var resultado = contexto.ConsultarCliente(idCliente);
               cliente = resultado.ToList().ConvertAll(x=> new Modelo.Cliente
               {                   
                   TipoIdentificacion = new Modelo.TipoIdentificacion { Descripcion = x.Descripcion},
                   NumeroIdentificacion =x.NumeroIdentificacion,
                   Nombres = x.Nombres,
                   Apellidos = x.Apellidos,
                   Telefono = x.Telefono,
               }).FirstOrDefault();
            }

            return cliente;

            
        }
    }
}
