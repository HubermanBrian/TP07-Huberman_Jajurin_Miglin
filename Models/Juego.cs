public class Juego
{
    private static string username {get;set;}
    private static int puntajeActual {get;set;}
    private static int cantidadPreguntasCorrectas{get;set;}
    private static List<Pregunta> preguntas = new List<Pregunta>();
    private static List<Respuesta> preguntas2 = new List<Respuesta>();

    public void InicializarJuego()
    {
        username = null;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }

    public List<Categoria> ObtenerCategorias()
    {
       List<Categoria> categoria = new List<Categoria>();
       categoria = BD.ObtenerCategorias();
        return categoria;
    }

     public List<Dificultad> ObtenerDificultades()
    {
        List<Dificultad> dificultades = new List<Dificultad>();
        dificultades = BD.ObtenerCategorias();
        return  dificultades;
    }
}