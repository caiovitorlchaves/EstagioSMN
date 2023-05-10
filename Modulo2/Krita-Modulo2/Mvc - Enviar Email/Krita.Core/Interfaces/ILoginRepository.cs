namespace Krita.Core.Interfaces
{
    public interface ILoginRepository
    {
        int AlterarSenha(EsqueciSenhaDto alterarSenha);
        Usuario BuscarPorEmail(string email);
    }
}
