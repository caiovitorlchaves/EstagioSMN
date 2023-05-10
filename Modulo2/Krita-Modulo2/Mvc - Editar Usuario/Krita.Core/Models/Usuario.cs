namespace Krita.Core.Models
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Apelido { get; set; }
        public string Email { get; set; }
        public string Senha { get; set; }
        public DateTime DataExpiracaoSenha { get; set; }
        public DateTime? DataBloqueio { get; set; }
        public int UsuarioCadastro { get; set; }
        public DateTime DataCadastro { get; set; }
        public int? UsuarioUltimaAlteracao { get; set; }
        public DateTime? DataUltimaAlteracao { get; set; }

        public bool IsValid(Notification notification)
        {
            if (!string.IsNullOrEmpty(Apelido) && Apelido.Length > 36)
                notification.Add("Apelido deve ter até 36 caracteres");

            if (!string.IsNullOrEmpty(Email) && Email.Length > 100)
                notification.Add("Email deve ter até 100 caracteres");

            if (!string.IsNullOrEmpty(Senha) && Senha.Length > 35)
                notification.Add("Senha deve ter até 35 caracteres");

            return !notification.Any();
        }
    }
}
