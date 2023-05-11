namespace krita.Controllers{

    [Route("usuario")]
    public class UsuarioController : AuthenticatedController
    {
        private readonly ILogger<UsuarioController> _logger;
        private string _baseUrlApi;

        public UsuarioController(ILogger<UsuarioController> logger,AppSettings appSettings)
        {
            _logger = logger;
            _baseUrlApi = appSettings.BaseUrlSettings.LinkRedirectApi;
        }

        [HttpGet("busca")]
        public IActionResult busca()
        {
            return View("Views/Usuario/_ConsultaUsuario.cshtml");
        }

        [HttpPost("buscar")]
        public async Task<IActionResult> Buscar(BuscarViewModel viewModel)
        {
            ApiServices client = new ApiServices(_baseUrlApi, $"usuario/buscar", UsuarioLogado.Token);
            HttpResponseMessage response = await client.Client.PostAsJsonAsync(client.Url, viewModel);
            var respostaBusca = await response?.Content.ReadAsStringAsync();
            var usuarios = JsonConvert.DeserializeObject<List<RespostaBusca>>(respostaBusca);
            var ultimoAcesso = HttpContext.Session.Get("UltimoAcesso");
            var ultimosAcessos = HttpContext.Session.Get<List<RespostaBusca>>("UltimoAcesso");
            

            if(usuarios != null && usuarios.Count() > 0)
            {    
                ultimosAcessos = ultimosAcessos == null 
                    ? usuarios
                    : usuarios.Concat(ultimosAcessos.Where(x => !usuarios.Any(y => y.Id == x.Id))).ToList();

                HttpContext.Session.Set<List<RespostaBusca>>("UltimoAcesso", ultimosAcessos);
            }

            return View("_GridUsuarios", new BuscarViewModel
            {
                RespostaBusca = usuarios
            });
        }
            
        [HttpGet("ultimoacesso")]
        public IActionResult UltimoAcesso()
        {
            var ultimoAcesso = HttpContext.Session.Get<List<RespostaBusca>>("UltimoAcesso");
            return View("Views/Usuario/_GridUltimoAcesso.cshtml", ultimoAcesso);
        }

        [HttpPost("cadastrar")]
        public async Task<IActionResult> Cadastrar(CadastroDto CadastroDto)
        {
            CadastroDto.Senha = "111111";
            CadastroDto.IdUsuarioCadastro = UsuarioLogado.IdUsuario;
            ApiServices client = new ApiServices(_baseUrlApi, $"usuario/cadastrar", UsuarioLogado.Token);
            HttpResponseMessage response = await client.Client.PostAsJsonAsync(client.Url, CadastroDto);

            if (response.IsSuccessStatusCode)
                return Ok("Usuario cadastrado com sucesso");

            var mensagem = await response?.Content.ReadAsStringAsync();
            return BadRequest(mensagem);
        }   

        [HttpPost("bloquear")]
        public async Task<IActionResult> Bloquear(BloquearDto bloquearDto)
        {
            bloquearDto.IdUsuarioUltimaAlteracao = UsuarioLogado.IdUsuario;
            ApiServices client;
            if(bloquearDto.Bloqueado == 1){
                client = new ApiServices(_baseUrlApi, $"usuario/{bloquearDto.Id}/bloquear", UsuarioLogado.Token);
            }
            else{
                client = new ApiServices(_baseUrlApi, $"usuario/{bloquearDto.Id}/desbloquear", UsuarioLogado.Token);
            }
            HttpResponseMessage response = await client.Client.PutAsJsonAsync(client.Url, bloquearDto.IdUsuarioUltimaAlteracao);
            return RedirectToAction("Busca","Usuario");            
        }
    
        [HttpPost("editar")]
        public async Task<IActionResult> Editar(EditarUsuarioDto editarUsuarioDto)
        {
            editarUsuarioDto.UsuarioUltimaAlteracao = UsuarioLogado.IdUsuario;
            ApiServices client = new ApiServices(_baseUrlApi, $"Usuario/{editarUsuarioDto.Id}/editar", UsuarioLogado.Token);
            HttpResponseMessage response = await client.Client.PutAsJsonAsync(client.Url, editarUsuarioDto);

            return RedirectToAction("Busca", "Usuario");
        }
    }
}
