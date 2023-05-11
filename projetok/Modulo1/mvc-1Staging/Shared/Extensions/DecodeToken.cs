namespace Shared.Extensions
{
    public static class DecodeToken
    {
        public static JwtSecurityToken handler(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var readToken = handler.ReadToken(token) as JwtSecurityToken;
            return readToken;
        }
        public static int getId(string token)
        {
            var readToken = handler(token);
            var idUsuario = readToken.Claims.ToList()[0].Value;

            if (int.TryParse(idUsuario, out int num))
                return num;
            
            return default;
        }

        public static string getEmail(string token) {
            var readToken = handler(token);
            var Email = readToken.Claims.ToList()[1].Value;

            return Email;
        }

        public static string getApelido(string token) {
            var readToken = handler(token);
            var Apelido = readToken.Claims.ToList()[2].Value;

            return Apelido;
        }
    }
}
