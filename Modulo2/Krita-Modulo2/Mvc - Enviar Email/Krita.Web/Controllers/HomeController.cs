namespace Krita.Web.Controllers;

public class HomeController : Controller
{
    private readonly ILoginRepository _loginRepository;
    private readonly AppSettings _appSettings;
    private readonly IEmailHandler _emailHandler;

    public HomeController(ILoginRepository loginRepository, AppSettings appSettings)
    {
        _loginRepository = loginRepository;
        _appSettings = appSettings;
        _emailHandler = emailHandler;
    }
    
    public IActionResult Index()
    {
        return View();
    }
}
