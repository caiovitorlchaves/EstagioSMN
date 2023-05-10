namespace Krita.Web.Controllers
{
    [Route("error")]
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            return View("Error");
        }
    }
}
