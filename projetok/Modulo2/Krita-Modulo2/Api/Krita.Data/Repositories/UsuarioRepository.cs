namespace Krita.Data.Repositories
{
    public class UsuarioRepository : BaseRepository, IUsuarioRepository
    {
        public UsuarioRepository(Connection connection) : base(connection)
        {

        }

        private enum ProceduresEnum
        {
            KRTSP_InsUsuario,
            KRTSP_SelUsuario
        }

        public int Cadastrar(Usuario usuario)
        {
            SetProcedure(ProceduresEnum.KRTSP_InsUsuario);

            AddParameter("apelido", usuario.Apelido);
            AddParameter("email", usuario.Email);
            AddParameter("senha", usuario.Senha);
            AddParameter("usuarioCadastro", usuario.UsuarioCadastro);

            return ExecuteNonQuery();
        }

        public Usuario BuscarPorEmail(string email)
        {
            SetProcedure(ProceduresEnum.KRTSP_SelUsuario);

            AddParameter("email", email);

            var usuarios = new List<Usuario>();
            var reader = ExecuteReader();

            while (reader.Read())
            {
                usuarios.Add(new Usuario()
                {
                    Id = (int)reader["id"],
                    Apelido = (string)reader["apelido"],
                    Email = (string)reader["email"],
                    Senha = (string)reader["senha"],
                    DataExpiracaoSenha = !string.IsNullOrEmpty(reader["dataExpiracaoSenha"].ToString()) ? (DateTime)reader["dataExpiracaoSenha"] : null,
                    DataBloqueio = !string.IsNullOrEmpty(reader["dataBloqueio"].ToString()) ? (DateTime)reader["dataBloqueio"] : null
                });
            }
            Close();
            
            return usuarios.FirstOrDefault();
        }
    }
}
