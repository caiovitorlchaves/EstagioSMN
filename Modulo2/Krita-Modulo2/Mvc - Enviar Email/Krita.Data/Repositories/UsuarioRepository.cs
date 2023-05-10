namespace Krita.Data.Repositories
{
    public class UsuarioRepository : BaseRepository, IUsuarioRepository
    {
        public UsuarioRepository(Connection connection) : base(connection)
        {

        }

        private enum Procedures
        {
            KRTSP_SelUsuario,
            KRTSP_UpdUsuario,
            KRTSP_BloquearUsuario,
            KRTSP_TrocarSenha
        }

        public Usuario BuscarPorEmail(string email)
        {
            SetProcedure(Procedures.KRTSP_SelUsuario);

            var usuarios = new List<Usuario>();
            var reader = ExecuteReader();

            while (reader.Read())
            {
                usuarios.Add(new Usuario()
                {
                    Email = (string)reader["email"],
                    DataBloqueio = !string.IsNullOrEmpty(reader["dataBloqueio"].ToString()) ? (DateTime)reader["dataBloqueio"] : null
                });
            }
            Close();

            return usuarios.FirstOrDefault();
        }
    }
}
