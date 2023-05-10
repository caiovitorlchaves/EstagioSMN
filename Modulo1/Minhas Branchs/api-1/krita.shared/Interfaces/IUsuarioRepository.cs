namespace Krita.Shared.Interfaces
{
    public interface IUsuarioRepository
    {
        int Desbloquear(int id, int idUsuarioUltimaAlteracao);
        int Bloquear(int id, int idUsuarioUltimaAlteracao);
        ICollection<Usuario> Buscar(BuscarUsuarioDto dto);
        int AlterarSenha(EsqueciSenhaDto esqueciSenha);
        int TrocarSenha(TrocarSenhaDto trocarSenha);
        Usuario BuscarPorId(int id);
        Usuario BuscarPorEmail(string email);
    }
}
