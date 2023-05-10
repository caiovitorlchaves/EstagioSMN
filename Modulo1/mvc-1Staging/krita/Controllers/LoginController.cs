namespace krita.Controllers
{
    [Route("login")]
    public class LoginController : Controller
    {
        private IEmailHandler _emailHandler;
        private CriptografiaSettings _chaveCriptografia;
        private string _baseUrlApi;
        private string _baseUrlMvc;

        public LoginController(IEmailHandler emailHandler, AppSettings appSettings)
        {
            _emailHandler = emailHandler;
            _chaveCriptografia = appSettings.Criptografia;
            _baseUrlMvc = appSettings.BaseUrlSettings.LinkRedirectMvc;
            _baseUrlApi = appSettings.BaseUrlSettings.LinkRedirectApi;
        }

        [HttpGet]
        public IActionResult Login()
        {
            var session = HttpContext.Session.Get<string>("Token");
            if (session != null)
                return RedirectToAction("Index", "Home");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LoginPost(LoginViewModel loginView)
        {
            ApiServices client = new ApiServices(_baseUrlApi, "usuario/login");
            HttpResponseMessage response = await client.Client.PostAsJsonAsync(client.Url, loginView);

            if (response.IsSuccessStatusCode)
            {
                var token = await response.DeserializeObject<LoginDto>();
                HttpContext.Session.Set<string>("Token", token.Token);
                Session session = HttpContext.GetSession();
                client.Close();
                return RedirectToAction("Index", "Home");
            }

            var mensagem = await response?.Content.ReadAsStringAsync();
            return BadRequest(mensagem);
        }

        [HttpGet("esqueci-senha")]
        public IActionResult EsqueciSenha([FromQuery] string email)
        {
            var secureQuery = new SecureQueryString(email);
            var emailDescriptografado = secureQuery[_chaveCriptografia.Chave];
            return View("EsqueciSenha", emailDescriptografado);
        }

        [HttpGet("enviar")]
        public async Task<IActionResult> Enviar(string email)
        {
            var criptografandoEmail = new SecureQueryString();
            
            criptografandoEmail[_chaveCriptografia.Chave] = email;

            ApiServices client = new ApiServices(_baseUrlApi, $"usuario/verificarEmail?Email={email}");
            HttpResponseMessage response = await client.Client.GetAsync(client.Url);
            
            if (response.IsSuccessStatusCode)
            {
                var resposta = await response?.Content.ReadAsStringAsync();
                await _emailHandler.EnviarEmail(new EmailParametro
                {
                    CaminhoHTML = "Templates/MensagemEmail.html",
                    EmailDestino = email,
                    NomeRemetente = "Krita SMN",
                    AssuntoEmail = "Confirmação necessária"
                }, new
                {
                    Usuario = JsonConvert.DeserializeObject<Usuario>(resposta).Apelido,
                    Link = $"{_baseUrlMvc}/login/esqueci-senha?Email={criptografandoEmail.ToString()}"
                });
                return Ok();
            }
            return BadRequest(response.Content.ReadAsStringAsync().Result);
        }

        [HttpPost("nova-senha")]
        public async Task<IActionResult> NovaSenha(NovaSenhaViewModel novaSenhaViewModel)
        {
            if (novaSenhaViewModel.SenhaNova != novaSenhaViewModel.SenhaNovaRepetida)
                return RedirectToAction("Login", "Login");

            NovaSenhaDto novaSenhaDto = new NovaSenhaDto()
            {
                Email = novaSenhaViewModel.Email,
                Senha = novaSenhaViewModel.SenhaNova
            };

            ApiServices client = new ApiServices(_baseUrlApi, $"usuario/esqueci-senha");
            HttpResponseMessage response = await client.Client.PostAsJsonAsync(client.Url, novaSenhaDto);
            return View("Login");
        }

        [HttpGet("logout")]
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Login", "Login");
        }

        [HttpPost("SenhaTrocada")]
        public async Task<IActionResult> SenhaTrocada(SenhaTrocadaDto senhaTrocadaDto)
        {
            ApiServices client = new ApiServices(_baseUrlApi, "usuario/trocar-senha");
            HttpResponseMessage response = await client.Client.PostAsJsonAsync(client.Url, senhaTrocadaDto);

            if (response.IsSuccessStatusCode)
            {
                client.Close();
                return RedirectToAction("Login", "Login");
            }
            else
            {
                return BadRequest(response.Content.ReadAsStringAsync().Result);
            }
        }
    }
}
