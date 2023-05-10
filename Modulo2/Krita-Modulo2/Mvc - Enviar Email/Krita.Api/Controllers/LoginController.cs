namespace Krita.Api.Controllers
{
    [Route("login")]
    public class LoginController : Controller
    {
        public readonly ILoginRepository _loginRepository;
        public readonly Notification _notification;
        private readonly AppSettings _appSettings;

        public LoginController(
            ILoginRepository loginRepository,
            Notification notification,
            AppSettings appSettings
        )
        {
            _loginRepository = loginRepository;
            _notification = notification;
            _appSettings = appSettings;
        }

        [HttpPut("recuperar-senha")]
        public IActionResult EsqueciSenha([FromBody] EsqueciSenhaDto dto)
        {
            if (dto == null)
                return BadRequest("Parametro inválido!");

            if (!dto.IsValid(_notification))
                return BadRequest(_notification.Get());

            var usuario = _loginRepository.BuscarPorEmail(dto.Email);

            if (usuario == null)
                return BadRequest("Usuário não encontrado!");

            if (usuario.DataBloqueio != null)
                return BadRequest("Usuário bloqueado!");

            dto.NovaSenha = dto.NovaSenha.Criptografar();

            var linhasAlteradas = _loginRepository.AlterarSenha(dto);
            if (linhasAlteradas == 0)
                return BadRequest("Não foi possível alterar a senha!");

            return Ok();
        }

        [HttpPost]
        [AllowAnonymous]
        public IActionResult login([FromBody] LoginDto loginDto)
        {
            if (loginDto == null)
                return BadRequest("Nenhum dado foi envido.");

            if (string.IsNullOrEmpty(loginDto.Email))
                return BadRequest("O email deve ser preenchido");

            var usuario = _loginRepository.BuscarPorEmail(loginDto.Email);

            if (usuario == null || !usuario.Senha.Equals(loginDto.Senha.Criptografar()))
                return BadRequest("Email ou senha incorreta!");

            if (usuario.DataBloqueio.HasValue)
                return BadRequest("Usuário bloqueado!");

            if (usuario.DataExpiracaoSenha <= DateTime.Now.Date)
                return BadRequest("Senha expirada");

            return Ok(TokenService.GenerateToken(usuario, _appSettings.TokenSettings.ChaveToken));
        }
    }
}
