namespace Krita.Web.Controllers
{
    [Route("login")]
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
