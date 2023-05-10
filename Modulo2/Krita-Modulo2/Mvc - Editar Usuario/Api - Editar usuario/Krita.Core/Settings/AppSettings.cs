namespace Krita.Core.Settings
{
    public class AppSettings
    {
        public ConnectionStrings ConnectionStrings { get; set; }
        public EmailSettings EmailSettings { get; set; }
        public CryptographySettings Criptografia { get; set; }
        public string ChaveToken { get; set; }
        public BaseUrlSettings BaseUrlSettings { get; set; }
    }
}
