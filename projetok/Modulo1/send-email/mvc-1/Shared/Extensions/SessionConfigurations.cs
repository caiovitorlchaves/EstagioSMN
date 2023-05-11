using Newtonsoft.Json;

namespace Shared.Extensions
{
    public static class SessionConfigurations
    {
        public static Session GetSession(this HttpContext context) 
        {
            var getToken = context.Session.GetString("Token");
            Session session = new Session();
            session.Token = getToken;
            if (string.IsNullOrEmpty(getToken))
                session.IdUsuario = DecodeToken.getId(getToken);

            return session;
        }

        public static async Task<T> DeserializeObject<T>(HttpResponseMessage response)
        {
            string json = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(json);
        }
    }
}
