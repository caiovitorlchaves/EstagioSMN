using Microsoft.AspNetCore.Mvc.Filters;
using Shared.Extensions;
using Shared.Models;

namespace krita.Controllers
{
    public class AuthenticatedController : Controller
    {
        public Session Usuario { get; set; }
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);

            Usuario = HttpContext.GetSession();

            var user = context.HttpContext.Session.Get<Usuario>("Usuario");
            if (user == null)
            {
                context.Result = new RedirectResult("/login");
            }
        }
    }
}
