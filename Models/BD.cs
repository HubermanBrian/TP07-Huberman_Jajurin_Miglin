using System.Data;
using System.Data.SqlClient;
using Dapper;
public class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=JJOO ; Trusted_Connection=True ;";

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

    public static ObtenerPreguntas(int dificultad, int categoria)
    {
        string sql = "SELECT * FROM Preguntas WHERE @pdificultad = -1 ";
    }
}