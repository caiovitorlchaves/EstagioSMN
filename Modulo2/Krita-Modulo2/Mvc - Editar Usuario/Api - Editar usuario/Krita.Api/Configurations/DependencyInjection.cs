namespace Krita.Api.Configurations
{
    public static class DependencyInjection
    {
        public static void AddDependencies(this IServiceCollection services, AppSettings appSettings)
        {
            services.AddSingleton(appSettings);
            services.AddControllers();
            services.AddEndpointsApiExplorer();
            services.AddSwaggerGen();
            services.AddScoped<Notification>();
            services.AddScoped<Connection>();
            services.AddScoped<IUsuarioRepository, UsuarioRepository>();
            services.AddScoped<ILoginRepository, LoginRepository>();
        }
    }
}
