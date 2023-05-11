namespace Krita.Core.Interfaces
{
    public interface IUsuarioRepository
    {
         int Cadastrar(Usuario usuario);
         Usuario BuscarPorEmail(string email);
    }
}
