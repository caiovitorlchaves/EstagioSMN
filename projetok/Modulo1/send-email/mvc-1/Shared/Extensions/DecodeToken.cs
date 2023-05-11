namespace Shared.Extensions
{
    public static class DecodeToken
    {
        public static int GetId(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var readToken = handler.ReadToken(token) as JwtSecurityToken;

            var idUsuario = readToken.Claims.ToList()[0].Value;

            return int.Parse(idUsuario);
        }
    }
}
