public class Juego
{
    private static string username {get;set;}
    private static int puntajeActual {get;set;}
    private static int cantidadPreguntasCorrectas{get;set;}
    private static List<Pregunta> preguntas = new List<Pregunta>();
    private static List<Respuesta> Respuesta = new List<Respuesta>();

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
        Respuesta = BD.ObtenerRespuestas(preguntas);
    }

    public Pregunta ObtenerProximaPregunta()
    {
        Random rnd = new Random();
        int posAzar = rnd.Next(preguntas.Count() + 1);  
        Pregunta PreguntaAzar = preguntas[posAzar];
        return PreguntaAzar;
    }

    public List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> RespuestasPosibles = new List<Respuesta>();  
        RespuestasPosibles.Add(Respuesta[idPregunta]);
        return RespuestasPosibles;
    }

    public bool VerificarRespuesta(int idPregunta, int idRespuesta)
    { //si la pregunta es igual y si tiene un true, buscar en la lista
        if(idRespuesta == )
        {
            puntajeActual += 5;
            cantidadPreguntasCorrectas++;

            return true;
        }else
        {
            return false;
        }
    }

}