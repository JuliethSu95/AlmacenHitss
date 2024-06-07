using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace AlmacenHITSS.Presentacion.Controllers
{
    public class ProductosController : Controller
    {
        // GET: Productos
        public ActionResult Index()
        {
            Negocio.GestionProducto gestionProducto = new Negocio.GestionProducto();

            var productos = gestionProducto.ObtenerProductos();

            return View(productos);
        }

        // GET: Productos/Details/5
        public ActionResult Details(int id)
        {
            Negocio.GestionProducto gestionProducto = new Negocio.GestionProducto();

            var producto = gestionProducto.ConsultarProducto(id);

            return View(producto);
        }

        // GET: Productos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Productos/Create
        [HttpPost]
        public ActionResult Create(Modelo.Producto modelo)
        {
            try
            {
                Negocio.GestionProducto gestionProducto = new Negocio.GestionProducto();

                gestionProducto.CrearProducto(modelo);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Productos/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Productos/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Modelo.Producto modelo)
        {
            try
            {
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Productos/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Productos/Delete/5
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
