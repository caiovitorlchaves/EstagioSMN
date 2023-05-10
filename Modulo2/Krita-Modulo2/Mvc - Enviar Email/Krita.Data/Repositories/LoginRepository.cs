namespace Krita.Data.Repositories
{
    public class LoginRepository : BaseRepository, ILoginRepository
    {
        public LoginRepository(Connection connection) : base(connection)
        {

        }

        private enum Procedures
        {
            KRTSP_SelUsuario,
            KRTSP_UpdUsuario,
            KRTSP_BloquearUsuario,
            KRTSP_TrocarSenha
        }

        public int AlterarSenha(EsqueciSenhaDto esqueciSenhaDto)
        {
            SetProcedure(Procedures.KRTSP_TrocarSenha);

            AddParameter("email", esqueciSenhaDto.Email);
            AddParameter("novaSenha", esqueciSenhaDto.NovaSenha);

            return ExecuteNonQuery();
        }

        public Usuario BuscarPorEmail(string email)
        {
            SetProcedure(Procedures.KRTSP_SelUsuario);

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
                    DataExpiracaoSenha = !string.IsNullOrEmpty(reader["dataExpiracaoSenha"].ToString()) ? (DateTime)reader["dataExpiracaoSenha"] : default,
                    DataBloqueio = !string.IsNullOrEmpty(reader["dataBloqueio"].ToString()) ? (DateTime)reader["dataBloqueio"] : null
                });
            }
            Close();

            return usuarios.FirstOrDefault();
        }
    }
}
