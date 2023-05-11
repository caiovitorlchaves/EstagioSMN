namespace Krita.Core.Settings
{
    public class EmailSettings
    {
        public string Host { get; set; }
        public int Port { get; set; }
        public bool UseDefaultCredentials { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public bool EnableSsl { get; set; }
    }
}
