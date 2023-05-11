namespace Krita.Configurations
{
    public static class Criptografia
    {
        public static string Criptografar(this string hash)
        {
            MD5 mD5Hash = MD5.Create();
            byte[] data = mD5Hash.ComputeHash(Encoding.UTF8.GetBytes(hash));

            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                sb.Append(data[i].ToString("x2"));
            }
            return sb.ToString();
        }
    }
}
