using System.Data;
using System.Data.SqlClient;
using Dapper;
public class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=PREGUNTADOS ; Trusted_Connection=True ;";

    public static List<Categoria> ObtenerCategorias()
    {
        List<Categoria> ListaCategoria = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            ListaCategoria = db.Query<Categoria>(sql).ToList();
        }
        return ListaCategoria;
    }

    public static List<Dificultad> ObtenerDificultad()
    {
        List<Dificultad> ListaDificultad = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Dificultades";
            ListaDificultad = db.Query<Dificultad>(sql).ToList();
        }
        return ListaDificultad;
    }

    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Pregunta> ListaPregunta = null;
         using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Preguntas WHERE (@pdificultad = -1 0R IdDificultad = @pdificultad) AND (@pcategoria = -1 0R IdCategoria = @pcategoria)";
            ListaPregunta = db.Query<Pregunta>(sql, new {dificultad, categoria}).ToList();
        }
        return ListaPregunta;
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta>preguntas)
    {
        List<Respuesta> ListaRespuesta = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Respuestas";
            foreach (Pregunta a in preguntas){
                List<Respuesta>ListaRespuestaPorPregunta = db.Query<Respuesta>(sql, new {@id = a.IdPregunta}).ToList();
                ListaRespuesta.AddRange(ListaRespuestaPorPregunta);
            }
        }
        return ListaRespuesta;
    }
}