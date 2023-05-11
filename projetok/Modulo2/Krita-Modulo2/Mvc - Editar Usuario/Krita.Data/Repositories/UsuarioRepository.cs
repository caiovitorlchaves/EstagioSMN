namespace Krita.Data.Repositories
{
    public class UsuarioRepository : BaseRepository, IUsuarioRepository
    {
        public UsuarioRepository(Connection connection) : base(connection)
        {

        }

        private enum Procedures
        {
            KRTSP_UpdUsuario,
            KRTSP_SelUsuario
        }

        public Usuario Busca(BuscarUsuarioDto buscarUsuarioDto)
        {
            SetProcedure(Procedures.KRTSP_SelUsuario);

            if (buscarUsuarioDto.Id != null)
                AddParameter("id", buscarUsuarioDto.Id);

            if (!String.IsNullOrEmpty(buscarUsuarioDto.Apelido))
                AddParameter("apelido", buscarUsuarioDto.Apelido);

            if (!String.IsNullOrEmpty(buscarUsuarioDto.Email))
                AddParameter("email", buscarUsuarioDto.Email);

            var usuarios = new List<Usuario>();
            var reader = ExecuteReader();

            while (reader.Read())
            {
                usuarios.Add(new Usuario()
                {
                    Id = (int)reader["id"],
                    Apelido = (string)reader["apelido"],
                    Email = (string)reader["email"]
                });
            }
            Close();

            return usuarios.FirstOrDefault();
        }

        public int Editar(int id, EditarUsuarioDto editarUsuarioDto)
        {
            SetProcedure(Procedures.KRTSP_UpdUsuario);

            AddParameter("id", id);
            AddParameter("apelido", editarUsuarioDto.Apelido);
            AddParameter("usuarioUltimaAlteracao", editarUsuarioDto.UsuarioUltimaAlteracao);

            return ExecuteNonQuery();
        }
    }
}
