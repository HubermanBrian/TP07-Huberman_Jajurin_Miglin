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
        ViewBag.Dificultad = Juego.ObtenerDificultades();
        return View();
    }

    public IActionResult Jugar()
    {
        ViewBag.Pregunta = Juego.ObtenerProximaPregunta();
        ViewBag.NombrePregunta = ViewBag.Pregunta.Enunciado;
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

    public IActionResult InicioSesion(string username, string foto, int dificultad)
    {
        Juego.CargarUsuario(username,foto);
        Juego.CargarDificultad(dificultad);
        ViewBag.Categoria = Juego.ObtenerCategorias();
        return RedirectToAction ("Ruleta");
    }

    public IActionResult Ruleta()
    {
        return View();
    }
    public IActionResult Comenzar(string categoria)
    {   
        Console.WriteLine($"Categoria: {categoria}");
        List<Categoria> categorias = new List<Categoria>(); 
        categorias = Juego.ObtenerCategorias();
        int posCategoria = 0;
        foreach (Categoria a in categorias)
        {
            Console.WriteLine(a.Nombre);
            if(categoria == a.Nombre){
                posCategoria = a.IdCategoria;
            }
        }
        Console.WriteLine(posCategoria);
        Juego.CargarPartida(posCategoria);
        Console.WriteLine(Juego.preguntas.Count);
        
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
        Juego.EliminarId(idPregunta,idRespuesta);
        return View("Respuesta");
    }
}
