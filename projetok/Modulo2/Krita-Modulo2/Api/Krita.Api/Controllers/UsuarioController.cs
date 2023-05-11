namespace Krita.Api.Controllers
{
    [Route("usuario")]
    public class UsuarioController : Controller
    {
        private readonly IUsuarioRepository _usuarioRepository;
        private readonly Notification _notification;

        public UsuarioController(IUsuarioRepository usuarioRepository, Notification notification)
        {
            _usuarioRepository = usuarioRepository;
            _notification = notification;
        }

        [HttpPost("cadastrar")]
        public IActionResult Cadastrar([FromBody] CadastroDto cadastroDto)
        {
            if (cadastroDto == null)
                return BadRequest("Nenhum dado Enviado");

            if (!cadastroDto.IsValid(_notification))
                return BadRequest(_notification.Get());

            if (string.IsNullOrEmpty(cadastroDto.Email))
                return BadRequest("Email invalido");

            if (string.IsNullOrEmpty(cadastroDto.Apelido))
                return BadRequest("Apelido invalido");

            var usuario = _usuarioRepository.BuscarPorEmail(cadastroDto.Email);

            if (usuario != null)
                return BadRequest("Usuário já cadastrado");

            var cadastro = _usuarioRepository.Cadastrar(new Usuario
            {
                Email = cadastroDto.Email,
                Apelido = cadastroDto.Apelido,
                UsuarioCadastro = cadastroDto.IdUsuarioCadastro,
                Senha = "111111".Criptografar()
            });

            if (cadastro == 0)
                return BadRequest("Usuario não cadastrado");

            return Ok(cadastroDto);
        }
    }
}
