namespace Krita.Core.Dto.Usuario
{
    public class EditarUsuarioDto
    {
        public string Apelido { get; set; }
        public int UsuarioUltimaAlteracao { get; set; }

        public bool IsValid(Notification notification)
        {
            if (string.IsNullOrEmpty(Apelido))
                notification.Add("Apelido está nulo");

            if (!string.IsNullOrEmpty(Apelido) && Apelido.Length > 36)
                notification.Add("Apelido deve ter até 36 caracteres");

            return !notification.Any();
        }
    }
}
