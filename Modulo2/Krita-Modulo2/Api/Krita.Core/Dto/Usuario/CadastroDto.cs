namespace Krita.Core.Dto.Usuario
{
    public class CadastroDto
    {
        public string Apelido { get; set; }
        public string Email { get; set; }
        public int IdUsuarioCadastro { get; set; }

        public bool IsValid(Notification notification)
        {
            if (string.IsNullOrEmpty(Email))
                notification.Add("E-mail inválido!");

            if (string.IsNullOrEmpty(Apelido))
                notification.Add("Apelido não informado!");

            return !notification.Any();
        }
    }
}
