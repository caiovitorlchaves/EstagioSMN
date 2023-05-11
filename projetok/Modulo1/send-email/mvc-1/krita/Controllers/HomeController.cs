namespace krita.Controllers;

public class HomeController : AuthenticatedController
{
	private IEmailHandler _emailHandler;

	public HomeController(IEmailHandler emailHandler)
	{
		_emailHandler = emailHandler;
	}

    public async Task<IActionResult> Index()
    {
        return View();
    }
}
