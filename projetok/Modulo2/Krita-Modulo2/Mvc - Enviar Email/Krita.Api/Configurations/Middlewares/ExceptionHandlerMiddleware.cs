namespace Krita.Api.Configurations.Middlewares
{
    public class ExceptionHandlerMiddleware
    {
        private readonly RequestDelegate _next;

        public ExceptionHandlerMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            context.Request.EnableBuffering();

            var requestBody = await ReadBody(context.Request.Body);
            var originalBodyStream = (Stream)null;
            var responseBody = "";
            var exception = (Exception)null;

            try
            {
                originalBodyStream = context.Response.Body;

                using var responseBodyMemoryStream = new MemoryStream();
                context.Response.Body = responseBodyMemoryStream;

                try
                {
                    await _next.Invoke(context);
                }
                catch
                {
                    throw;
                }
                finally
                {
                    responseBody = await ReadBody(context.Response.Body);
                    await responseBodyMemoryStream.CopyToAsync(originalBodyStream);
                }
            }
            catch (Exception ex)
            {
                exception = ex;
                context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                await context.Response.WriteAsJsonAsync(new ResponsePayload(false, false, $"{ex}: Internal Server Error", ex));
            }
            finally
            {
                originalBodyStream?.Dispose();
            }
        }

        private async Task<string> ReadBody(Stream stream)
        {
            var content = "";
            try
            {
                stream.Seek(0, SeekOrigin.Begin);

                var body = await new StreamReader(stream).ReadToEndAsync();
                foreach (var line in body.Split(Environment.NewLine))
                    content += line.Trim();

                stream.Seek(0, SeekOrigin.Begin);
                return content;
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString(), ConsoleColor.White);
                return content;
            }
        }
    }
}
