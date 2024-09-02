public class Juego
{
    private static string username {get;set;}
    private static string foto {get;set;}
    private static int dificultad {get;set;}
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

    public int RetornoPuntajeActual()
    {
        int puntos = puntajeActual;
        return puntos;
    }
    private List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    private List<Dificultad> ObtenerDificultades()
    {
        return  BD.ObtenerDificultad();
    }

    public void CargarUsuario(string Username, string Foto)
    {
        username = Username;
        foto = Foto;
    }
    public void CargarDificultad(int Dificultad)
    {
        dificultad = Dificultad;
    }
    public void CargarPartida(int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        if (preguntas.Count > 0)
        {
            Respuesta = BD.ObtenerRespuestas(preguntas);
        }
    }

    public string RetornoUsername()
    {
        string Usuario = username;
        return Usuario;
    }

     public string RetornoFoto()
    {
        string FotoUsuario = foto;
        return FotoUsuario;
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
        int posPregunta = preguntas.IndexOf(idPregunta);
        int posRespuesta = Respuesta.IndexOf(idRespuesta);
        if(preguntas[posPregunta].IdPregunta == Respuesta[posPregunta].IdPregunta && Respuesta[posRespuesta].Correcta == true)
        {
            switch (Dificultad.IdDificultad)
            {
                case 1:
                    puntajeActual++;
                break;
                case 2:
                    puntajeActual += 3;
                break;
                case 3:
                    puntajeActual += 5;
                break;
            }
            cantidadPreguntasCorrectas++;
            return true;
        }else
        {
            return false;
        }
    }

    public string RespuestaCorrecta (int idPregunta, int idRespuesta)
    {
        if(!VerificarRespuesta(idPregunta, idRespuesta))
        {
            int posPregunta = preguntas.IndexOf(idPregunta);
            string correcta = Respuesta[posPregunta].Contenido;
        }
        return correcta;
    }

    public void EliminarId ()
    {
        preguntas.RemoveAt(idPregunta);
        preguntas.RemoveAt(idRespuesta);
    }

}