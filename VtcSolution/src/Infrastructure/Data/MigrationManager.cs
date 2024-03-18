using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace VtcSolution.Infrastructure.Data;

public static class MigrationManager
{
    public static IHost MigrateDatabase<TContext>(this IHost host) where TContext : DbContext
    {
        using var scope = host.Services.CreateScope();
        var services = scope.ServiceProvider;
        var dbContext = services.GetRequiredService<TContext>();
        dbContext.Database.Migrate();

        return host;
    }
}
