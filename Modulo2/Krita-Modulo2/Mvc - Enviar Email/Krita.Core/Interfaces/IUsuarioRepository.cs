namespace Krita.Core.Interfaces
{
    public interface IUsuarioRepository
    {
        Usuario BuscarPorEmail(string email);
    }
}
