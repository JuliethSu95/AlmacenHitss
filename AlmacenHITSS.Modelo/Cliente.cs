using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlmacenHITSS.Modelo
{
    public class Cliente
    {
        public int Id { get; set; }
        public int IdCliente { get; set; }
        public TipoIdentificacion TipoIdentificacion { get; set; }
        public string NumeroIdentificacion { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Telefono { get; set; }
    }
}
