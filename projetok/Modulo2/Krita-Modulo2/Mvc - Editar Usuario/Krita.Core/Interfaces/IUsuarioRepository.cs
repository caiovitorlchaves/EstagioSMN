namespace Krita.Core.Interfaces
{
    public interface IUsuarioRepository
    {
        int Editar(int id, EditarUsuarioDto editarUsuarioDto);
        Usuario Busca(BuscarUsuarioDto buscarUsuarioDto);
    }
}
