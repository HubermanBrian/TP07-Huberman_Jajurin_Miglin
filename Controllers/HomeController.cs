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
    }

    public IActionResult Jugar()
    {
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta();
        if(ViewBag.Pregunta!= null){
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta.IdPregunta);
            return View();
        }
        else{
            return View("Fin");
        }

    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        if (preguntas.Count > 0)
        {
            return RedirectToAction ("Jugar");
        }else
        {
            return RedirectToAction ("ConfigurarJuego");
        }
    }

    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.Correcto = Juego.VerificarRespuesta(idPregunta,idRespuesta);
        if(ViewBag.Correcto == false)
        {
            // ViewBag.RespuestaCorrecta = hacer metodo para retornar la respuesta correcta;
        }
    }
}
