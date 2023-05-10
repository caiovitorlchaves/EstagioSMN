namespace Krita.Web.Controllers
{
    [Route("usuario")]
    public class UsuarioController : AuthenticatedController
    {
        private readonly ILogger<UsuarioController> _logger;

        private string _baseUrlApi;

        public UsuarioController(ILogger<UsuarioController> logger, AppSettings appSettings)
        {
            _logger = logger;
            _baseUrlApi = appSettings.BaseUrlSettings.LinkRedirectApi; //Ver essa linha
        }

        [HttpGet("busca")]
        public IActionResult busca()
        {
            return View("Views/Usuario/_GridUsuarios.cshtml");
        }
        
        [HttpPost("editar")]
        public async Task<IActionResult> Editar(EditarUsuarioDto editarUsuarioDto)
        {
            editarUsuarioDto.UsuarioUltimaAlteracao = UsuarioLogado.IdUsuario;
            ApiServices client = new ApiServices(_baseUrlApi, $"Usuario/{editarUsuarioDto.Id}/editar", UsuarioLogado.Token);
            HttpResponseMessage response = await client.Client.PutAsJsonAsync(client.Url, editarUsuarioDto);
            //Ve a questao do ApiService
            return RedirectToAction("Busca", "Usuario");
        }
    }
}
