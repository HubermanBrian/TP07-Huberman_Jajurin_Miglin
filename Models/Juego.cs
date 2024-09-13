public static class Juego
{
    private static string username {get;set;}
    private static string foto {get;set;}
    private static int dificultad {get;set;}
    private static int puntajeActual {get;set;}
    private static int cantidadPreguntasCorrectas{get;set;}
    public static List<Pregunta> preguntas = new List<Pregunta>();
    public static List<Respuesta> respuesta = new List<Respuesta>();

    public static void InicializarJuego()
    {
        username = null;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }

    public static int RetornoPuntajeActual()
    {
        int puntos = puntajeActual;
        return puntos;
    }
    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return  BD.ObtenerDificultad();
    }

    public static void CargarUsuario(string Username, string Foto)
    {
        username = Username;
        foto = Foto;
    }
    public static void CargarDificultad(int Dificultad)
    {
        dificultad = Dificultad;
    }
    public static void CargarPartida(int posCategoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, posCategoria);
        if (preguntas.Count() > 0)
        {
            respuesta = BD.ObtenerRespuestas(preguntas);
        }
    }

    public static string RetornoUsername()
    {
        string Usuario = username;
        return Usuario;
    }

     public static string RetornoFoto()
    {
        string FotoUsuario = foto;
        return FotoUsuario;
    }

    public static Pregunta ObtenerProximaPregunta()
    {
        Pregunta PreguntaAzar;
        Random rnd = new Random();
        if(preguntas.Count() > 0)
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

    public static int CantPreguntas(){
        int cant = preguntas.Count();
        return cant;
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> RespuestasPosibles = new List<Respuesta>(); 

        foreach (Respuesta a in respuesta)
        { 
            if(a.IdPregunta == idPregunta){
                RespuestasPosibles.Add(a);
            }
        }
        return RespuestasPosibles;
    }

    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        int posPregunta = preguntas.FindIndex(p => p.IdPregunta == idPregunta);
        int posRespuesta = respuesta.FindIndex(r => r.IdRespuesta == idRespuesta);
        if(respuesta[posRespuesta].Correcta == true)
        {
            switch (dificultad)
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

    public static string RespuestaCorrecta (int idPregunta, int idRespuesta)
    {
        string correcta = " ";
            List<Respuesta> RespuestasPosibles = new List<Respuesta>(); 
            RespuestasPosibles = ObtenerProximasRespuestas(idPregunta);
            foreach (Respuesta a in RespuestasPosibles)
            {
                if(a.Correcta == true)
                {
                    correcta = a.Contenido;
                }
            }
                
        return correcta;
    }
        
    

    public static void EliminarId (int idPregunta, int idRespuesta)
    {
        preguntas.RemoveAt(idPregunta);
    }

}