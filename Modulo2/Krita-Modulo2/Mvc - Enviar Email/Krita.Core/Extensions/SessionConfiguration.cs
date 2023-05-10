using Newtonsoft.Json;

namespace Krita.Core.Extensions
{
    public static class SessionConfigurations
    {
        public static Session GetSession(this HttpContext context)
        {
            var getToken = context.Session.GetString("Token");

            if (string.IsNullOrEmpty(getToken))
                return null;

            var session = new Session()
            {
                Token = getToken
            };

            if (!string.IsNullOrEmpty(session.Token))
            {
                session.IdUsuario = DecodeToken.getId(getToken.Trim('\"'));
                session.Email = DecodeToken.GetProperty(getToken.Trim('\"'), PropertyTokenEnum.Email);
                session.Apelido = DecodeToken.GetProperty(getToken.Trim('\"'), PropertyTokenEnum.Apelido);
            }

            return session;
        }

        public static async Task<T> DeserializeObject<T>(this HttpResponseMessage response)
        {
            string json = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<T>(json);
        }
    }
}
