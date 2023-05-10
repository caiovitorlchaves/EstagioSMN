namespace Krita.Data
{
    public class Connection : IDisposable
    {
        public readonly SqlConnection connection;

        public Connection(IConfiguration configuration, AppSettings appSettings)
        {
            connection = new SqlConnection(appSettings.ConnectionStrings.Default);
        }

        public void OpenConnection()
        {
            if (connection.State == ConnectionState.Closed)
                connection.Open();
        }

        public void Dispose()
        {
            if (connection.State == ConnectionState.Open)
                connection.Close();
        }
    }
}
