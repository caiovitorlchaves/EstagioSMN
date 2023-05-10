namespace krita.Controllers;

public class HomeController : AuthenticatedController
{
    private readonly ILogger<HomeController> _logger;
    private IEmailHandler _emailHandler;
    private string _baseUrlApi;
    public HomeController(ILogger<HomeController> logger, IEmailHandler emailHandler, AppSettings appSettings)
    {
        _logger = logger;
        _emailHandler = emailHandler;
        _baseUrlApi = appSettings.BaseUrlSettings.LinkRedirectApi;
    }

    public async Task<IActionResult> Index()
    {
        ApiServices client = new ApiServices(_baseUrlApi);
        HttpResponseMessage response = await client.Client.GetAsync(client.Url); 
        return View();
    }
}
