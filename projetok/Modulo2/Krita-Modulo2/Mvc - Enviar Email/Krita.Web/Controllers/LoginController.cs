namespace Krita.Web.Controllers

{
    [Route("login")]
    public class LoginController : Controller
    {
        private IEmailHandler _emailHandler;
        private BaseUrl _emailLinks { get; set; }

        public LoginController(IEmailHandler emailHandler, AppSettings appSettings)
        {
            _emailHandler = emailHandler;
            _emailLinks = appSettings.BaseUrl;
        }

        [HttpGet("Enviar-email-alterar-senha")]
        public async Task<IActionResult> EnviarEmailTrocarSenha(string email)
        {
            var criptografandoEmail = new SecureQueryString();
            criptografandoEmail["emailSitemauriciojunior.net"] = email;

            ApiServices client = new ApiServices($"usuario/verificarEmail?Email={email}");
            HttpResponseMessage response = await client.Client.GetAsync(client.Url);
            if(response.IsSuccessStatusCode){
                var resposta = await response?.Content.ReadAsStringAsync();
                await _emailHandler.EnviarEmail(new EmailParametro
                {
                    Html = "Templates/EmailAltSenha.html",
                    EmailDestino = email,
                    NomeRemetente = "Krita SMN",
                    AssuntoEmail = "Krita - Redefinição de Senha"
                }, new
                {
                    Usuario = JsonConvert.DeserializeObject<Usuario>(resposta).Apelido,
                    Link = $"{_emailLinks.LinkRedirect}login/esqueci-senha?Email={criptografandoEmail.ToString()}"
                });
            }
            return RedirectToAction("Index", "Login");
        }
    }
}