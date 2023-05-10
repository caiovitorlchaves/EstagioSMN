namespace Krita.Controllers
{
    [Route("usuario")]
    public class UsuarioController : Controller
    {
        private readonly IUsuarioRepository _usuarioRepository;

        public UsuarioController
        (
            IUsuarioRepository usuarioRepository
        )
        {
            _usuarioRepository = usuarioRepository;
        }

        [HttpGet("VerificarEmail")]
        public IActionResult VerificarEmail([FromQuery] string email)
        {
            var usuarios = _usuarioRepository.BuscarPorEmail(email);
            if (usuarios == null)
                return BadRequest("Email inválido!");

            return Ok(usuarios);
        }

        [HttpPut("{id}/bloquear")]
        public IActionResult Bloquear(int id, [FromBody] int idUsuarioUltimaAlteracao)
        {
            var linhasAlteradas = _usuarioRepository.Bloquear(id, idUsuarioUltimaAlteracao);
            if (linhasAlteradas == 0)
                return BadRequest("Não foi possível bloquear o usuário");

            return Ok();
        }

        [HttpPut("{id}/desbloquear")]
        public IActionResult Desbloquear(int id, [FromBody] int idUsuarioUltimaAlteracao)
        {
            var linhasAlteradas = _usuarioRepository.Desbloquear(id, idUsuarioUltimaAlteracao);
            if (linhasAlteradas == 0)
                return BadRequest("Não foi possível desbloquear o usuário");
                
            return Ok();
        }

        [HttpPost("buscar")]
        public IActionResult Buscar([FromBody] BuscarUsuarioDto dto)
        {
            var usuarios = _usuarioRepository.Buscar(dto);
            if (usuarios == null)
                return BadRequest("Usuarios não encontrados");
            return Ok(usuarios);
        }
    }
}
