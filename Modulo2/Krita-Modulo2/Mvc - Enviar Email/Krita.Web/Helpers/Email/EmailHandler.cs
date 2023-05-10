namespace krita.Helpers.EmailHandler
{
    public class EmailHandler : IEmailHandler
    {
        private EmailSettings _emailSettings { get; set; }
        public SmtpClient _smtpClient { get; set; }

        public EmailHandler(AppSettings appSettings)
        {
            _emailSettings = appSettings.EmailSettings;
            _smtpClient = new SmtpClient()
            {
                Host = _emailSettings.Host,
                Port = _emailSettings.Port,
                UseDefaultCredentials = _emailSettings.UseDefaultCredentials,
                Credentials = new NetworkCredential(_emailSettings.Email, _emailSettings.Password),
                EnableSsl = _emailSettings.EnableSsl
            };
        }

        public async Task EnviarEmail(EmailParametro emailParametros, Object replaces)
        {
            var bodyDinamico = BuildEmail(emailParametros.CaminhoHTML, replaces);

            MailAddress from = new MailAddress(_emailSettings.Email, emailParametros.NomeRemetente, System.Text.Encoding.UTF8);
            MailAddress to = new MailAddress(emailParametros.EmailDestino);
            MailMessage message = new MailMessage(from, to)
            {
                BodyEncoding =  System.Text.Encoding.UTF8,
                Body = bodyDinamico,
                Subject = emailParametros.AssuntoEmail,
                SubjectEncoding = System.Text.Encoding.UTF8,
                IsBodyHtml = true
            };

            await _smtpClient.SendMailAsync(message);
            message.Dispose();
        }

        public string BuildEmail(string Html, Object replaces)
        {
            var body = File.ReadAllText(Html);
            foreach (var prop in replaces.GetType().GetProperties())
                body = body.Replace($"{{{prop.Name}}}", prop.GetValue(replaces)?.ToString());

            return body;
        }
    }
}
