var builder = WebApplication.CreateBuilder(args);

IConfiguration configurations = builder.Configuration;

var appSettings = configurations.Get<AppSettings>();

builder.Services.AddDependencies(appSettings);

var app = builder.Build();

app.UseMiddleware<ExceptionHandlerMiddleware>();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
