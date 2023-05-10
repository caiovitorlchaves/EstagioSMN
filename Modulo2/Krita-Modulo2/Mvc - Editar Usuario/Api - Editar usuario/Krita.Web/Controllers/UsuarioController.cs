namespace Krita.Web.Controllers
{
    [Route("usuario")]
    public class UsuarioController : AuthenticatedController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
