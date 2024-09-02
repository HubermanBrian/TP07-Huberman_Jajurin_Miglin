using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using frdgr5.Models;

namespace frdgr5.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.Categoria = Juego.ObtenerCategorias();
        ViewBag.Dificultad = Juego.ObtenerDificultades();
        return View();
    }

    public IActionResult Jugar()
    {
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta();
        ViewBag.Username = Juego.RetornoUsername();
        ViewBag.Foto = Juego.RetornoFoto();
        ViewBag.PuntajeActual = Juego.RetornoPuntajeActual();
        if(ViewBag.Pregunta!= null){
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta.IdPregunta);
            return View();
        }
        else{
            return View("Fin");
        }

    }

    public IActionResult Comenzar(string username, string foto, int dificultad, int categoria)
    {   
        Juego.CargarPartida(username, dificultad, categoria);
        if (Juego.preguntas.Count > 0)
        {
            return RedirectToAction ("Jugar");
        }else
        {
            return RedirectToAction ("ConfigurarJuego");
        }
    }

    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.Username = Juego.RetornoUsername();
        ViewBag.Foto = Juego.RetornoFoto();
        ViewBag.Correcto = Juego.VerificarRespuesta(idPregunta,idRespuesta);
        if(ViewBag.Correcto == true)
        {
            ViewBag.Respuesta = "Respuesta correcta";
        }
        else
        {
            ViewBag.Respuesta = "Respuesta incorrecta";
            ViewBag.RespuestaCorrecta = Juego.RespuestaCorrecta (idPregunta, idRespuesta);
        }
        return View("Respuesta");
    }
}
