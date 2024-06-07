using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AlmacenHITSS.Presentacion.Controllers
{
    public class ClientesController : Controller
    {
        // GET: Clientes
        public ActionResult Index()
        {
            return View(new List<Modelo .Cliente>());
        }

        // GET: Clientes/Details/5
        public ActionResult Details(int id)
        {
            Negocio.GestionCliente gestionCliente = new Negocio.GestionCliente();

            var cliente = gestionCliente.ConsultarClientes(id);

            return View(cliente);

        }

        // GET: Clientes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Clientes/Create
        [HttpPost]
        public ActionResult Create(Modelo.Cliente modelo)
        {
            try
            {
                Negocio.GestionCliente gestionCliente = new Negocio.GestionCliente();

                modelo.TipoIdentificacion = new Modelo.TipoIdentificacion { IdTipoIdentificacion = 1 };

                gestionCliente.CrearCliente(modelo);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Clientes/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Clientes/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Clientes/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
