namespace Krita.Controllers
{
    [Route("usuario")]
    public class LoginController : Controller
    {
        private readonly IUsuarioRepository _usuarioRepository;

        public LoginController(IUsuarioRepository usuarioRepository)
        {
            _usuarioRepository = usuarioRepository;
        }

        [HttpPost("esqueci-senha")]
        public IActionResult EsqueciSenha([FromBody] EsqueciSenhaDto novaSenha)
        {
            novaSenha.Senha = novaSenha.Senha.Criptografar();

            var resultadoAlteracao = _usuarioRepository.AlterarSenha(novaSenha);
            if (resultadoAlteracao == 0)
                return BadRequest("Erro ao atualizar Senha");

            return Ok();
        }

        [HttpPost("trocar-senha")]
        public IActionResult TrocarSenha([FromBody] TrocarSenhaDto trocarSenhaDto)
        {
            var usuario = _usuarioRepository.BuscarPorEmail(trocarSenhaDto.Email);

            if (usuario == null)
            {
                return BadRequest("E-mail inválido!");
            }

            if (!usuario.Senha.Equals(trocarSenhaDto.SenhaAtual.Criptografar()))
                return BadRequest("Senha atual incorreta.");

            if (usuario.DataBloqueio != null)
                return BadRequest("Usuário bloqueado");

            trocarSenhaDto.NovaSenha = trocarSenhaDto.NovaSenha.Criptografar();

            var qtdLinhasAlteradas = _usuarioRepository.TrocarSenha(trocarSenhaDto);

            if (qtdLinhasAlteradas == 0)
                return BadRequest("Senha não alterada");

            return Ok();
        }
    }
}
