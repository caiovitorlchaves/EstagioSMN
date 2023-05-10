namespace Krita.Api.Controllers
{
    [Route("usuario")]
    public class UsuarioController : AuthenticatedController
    {
        private readonly IUsuarioRepository _usuarioRepository;
        private readonly Notification _notification;

        public UsuarioController(IUsuarioRepository usuarioRepository, Notification notification)
        {
            _usuarioRepository = usuarioRepository;
            _notification = notification;
        }

        [HttpPut("{id}/editar")]
        public IActionResult Editar(int id, [FromBody] EditarUsuarioDto editarUsuarioDto)
        {
            if (editarUsuarioDto == null)
                return BadRequest("Nenhum dado enviado.");

            var usuario = _usuarioRepository.Busca(new BuscarUsuarioDto
            {
                Id = id
            });

            if (usuario == null)
                return BadRequest("Usuário não encontrado.");

            if (usuario.Apelido.Equals(editarUsuarioDto.Apelido))
                return BadRequest("Nada foi alterado.");

            if (!editarUsuarioDto.IsValid(_notification))
                return BadRequest(_notification.Get());

            return Ok(_usuarioRepository.Editar(id, editarUsuarioDto));
        }
    }
}
