public class Juego
{
    private static string username {get;set;}
    private static int puntajeActual {get;set;}
    private static int cantidadPreguntasCorrectas{get;set;}
    public static List<Pregunta> preguntas = new List<Pregunta>();
    public static List<Respuesta> Respuesta = new List<Respuesta>();

    public void InicializarJuego()
    {
        username = null;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }

    private List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    private List<Dificultad> ObtenerDificultades()
    {
        return  BD.ObtenerDificultad();
    }

    public void CargarPartida(string username, int dificultad, int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        if (preguntas.Count > 0)
        {
            Respuesta = BD.ObtenerRespuestas(preguntas);
        }
        
    }

    public Pregunta ObtenerProximaPregunta()
    {
        Pregunta PreguntaAzar;
        Random rnd = new Random();
        if(preguntas.Count > 1)
        {
            int posAzar = rnd.Next(preguntas.Count());  
            PreguntaAzar = preguntas[posAzar];
        }
        else
        {
            PreguntaAzar = null;
        }

        return PreguntaAzar;
    }

    public List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> RespuestasPosibles = new List<Respuesta>();  
        RespuestasPosibles.Add(Respuesta[idPregunta]);
        return RespuestasPosibles;
    }

    public bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        if(preguntas[idPregunta].IdPregunta == Respuesta[idPregunta].IdPregunta)
        {
            //switch (Dificultad.IdDificultad)
            //puntajeActual += 5;
            cantidadPreguntasCorrectas++;
            preguntas.RemoveAt(idPregunta);
            preguntas.RemoveAt(idRespuesta);
            return true;
        }else
        {
            return false;
        }
    }

}