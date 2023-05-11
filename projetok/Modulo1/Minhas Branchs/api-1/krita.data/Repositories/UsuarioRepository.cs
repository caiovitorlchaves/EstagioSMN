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
            KRTSP_SelUsuario,
            KRTSP_UpdUsuario,
            KRTSP_BloquearUsuario,
            KRTSP_TrocarSenha
        }

        public enum StatusEnum
        {
            Bloqueado = 0,
            NaoBloqueado = 1
        }

        public Usuario BuscarPorId(int id)
        {
            SetProcedure(ProceduresEnum.KRTSP_SelUsuario);

            AddParameter("id", id);

            var reader = ExecuteReader();
            var usuarios = new List<Usuario>();

            while (reader.Read())
            {
                usuarios.Add(new Usuario()
                {
                    Email = (string)reader["email"],
                    Apelido = (string)reader["apelido"],
                    Senha = (string)reader["senha"],
                    DataExpiracaoSenha = (DateTime)reader["dataExpiracaoSenha"],
                    DataBloqueio = !String.IsNullOrEmpty(reader["dataBloqueio"].ToString()) ? (DateTime)reader["dataBloqueio"] : null
                });

            }
            Close();

            return usuarios.FirstOrDefault();
        }

        public int TrocarSenha(TrocarSenhaDto trocarSenha)
        {
            SetProcedure(ProceduresEnum.KRTSP_TrocarSenha);

            AddParameter("email", trocarSenha.Email);
            AddParameter("novaSenha", trocarSenha.NovaSenha);

            return ExecuteNonQuery();
        }

        public ICollection<Usuario> Buscar(BuscarUsuarioDto dto)
        {
            SetProcedure(ProceduresEnum.KRTSP_SelUsuario);

            var usuarios = new List<Usuario>();

            if (dto.Id != null)
                AddParameter("id", dto.Id);

            if (!string.IsNullOrEmpty(dto.Apelido))
                AddParameter("apelido", dto.Apelido);

            if (!string.IsNullOrEmpty(dto.Email))
                AddParameter("email", dto.Email);

            if (dto.Bloqueado.HasValue && dto.Bloqueado.Value == (int)StatusEnum.Bloqueado)
                AddParameter("Bloqueado", StatusEnum.Bloqueado);

            if (dto.Bloqueado.HasValue && dto.Bloqueado.Value == (int)StatusEnum.NaoBloqueado)
                AddParameter("Bloqueado", StatusEnum.NaoBloqueado);

            var reader = ExecuteReader();
            while (reader.Read())
            {
                usuarios.Add(new Usuario()
                {
                    Id = (int)reader["id"],
                    Apelido = (string)reader["apelido"],
                    Email = (string)reader["email"],
                    DataBloqueio = !string.IsNullOrEmpty(reader["dataBloqueio"].ToString()) ? (DateTime)reader["dataBloqueio"] : null
                });
            }

            return usuarios;
        }

        public Usuario BuscarPorEmail(string email)
        {
            SetProcedure(ProceduresEnum.KRTSP_SelUsuario);

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
                    DataExpiracaoSenha = (DateTime)reader["dataExpiracaoSenha"],
                    DataBloqueio = !string.IsNullOrEmpty(reader["dataBloqueio"].ToString()) ? (DateTime)reader["dataBloqueio"] : null
                });
            }
            Close();

            return usuarios.Where(x => x.Email.Equals(email)).FirstOrDefault();
        }

        public int AlterarSenha(EsqueciSenhaDto esqueciSenha)
        {
            SetProcedure(ProceduresEnum.KRTSP_TrocarSenha);

            AddParameter("email", esqueciSenha.Email);
            AddParameter("novaSenha", esqueciSenha.Senha);

            return ExecuteNonQuery();
        }

        public int Bloquear(int id, int idUsuarioUltimaAlteracao)
        {
            SetProcedure(ProceduresEnum.KRTSP_BloquearUsuario);

            AddParameter("id", id);
            AddParameter("usuarioUltimaAlteracao", idUsuarioUltimaAlteracao);
            AddParameter("bloqueado", StatusEnum.NaoBloqueado);

            return ExecuteNonQuery();
        }

        public int Desbloquear(int id, int idUsuarioUltimaAlteracao)
        {
            SetProcedure(ProceduresEnum.KRTSP_BloquearUsuario);

            AddParameter("id", id);
            AddParameter("usuarioUltimaAlteracao", idUsuarioUltimaAlteracao);
            AddParameter("bloqueado", StatusEnum.Bloqueado);

            return ExecuteNonQuery();
        }
    }
}
