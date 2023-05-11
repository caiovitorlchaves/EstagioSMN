namespace Krita.Core.Dto.Usuario
{
    public class EsqueciSenhaDto
    {
        public string Email { get; set; }
        public string NovaSenha { get; set; }
        public string RepitaNovaSenha { get; set; }

        public bool IsValid(Notification notification)
        {
            if (string.IsNullOrEmpty(Email))
                notification.Add("E-mail inválido!");

            if (string.IsNullOrEmpty(NovaSenha))
                notification.Add("Senha não informada!");

            if (!string.IsNullOrEmpty(NovaSenha) && NovaSenha.Length > 15)
                notification.Add("A senha deve ter no máximo 15 dígitos!");

            if (!string.IsNullOrEmpty(NovaSenha) && NovaSenha.Length < 6)
                notification.Add("A senha deve ter no mínimo 6 dígitos!");

            if (NovaSenha != RepitaNovaSenha)
                notification.Add("Senhas devem ser iguais!");

            return !notification.Any();
        }
    }
}
