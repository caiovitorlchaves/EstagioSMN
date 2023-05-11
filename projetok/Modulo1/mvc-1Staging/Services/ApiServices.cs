namespace Services
{
    public class ApiServices
    {
        public string Url { get; set; }
        public HttpClient Client { get; set; }
        private BaseUrlSettings BaseUrl { get; set; }

        public ApiServices(string url, string endUrl = null, string token = null)
        {
            this.Url = url + endUrl;
            this.Client = new HttpClient();

            if (!string.IsNullOrEmpty(token))
                this.Client.DefaultRequestHeaders.Add("Authorization", "Bearer " + token);
            this.Client.BaseAddress = new Uri(this.Url);
        } 

        public void Close()
        {
            this.Client.Dispose();
        }
    }
}
