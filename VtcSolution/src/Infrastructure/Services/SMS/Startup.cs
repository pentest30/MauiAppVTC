using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Refit;
using VtcSolution.Application.Common.Interfaces;

namespace VtcSolution.Infrastructure.Services.SMS;

internal static class Startup
{
    internal static IServiceCollection AddSmsService(this IServiceCollection serviceCollection, IConfiguration configuration)
    {
        var settings = configuration.GetSection(nameof(InfobipApiSettings)).Get<InfobipApiSettings>();
        serviceCollection.AddRefitClient<IInfobipApi>()
            .ConfigureHttpClient(c =>
            {
                c.BaseAddress = new Uri(settings?.BaseUrl!);
                c.DefaultRequestHeaders.Add("Authorization", settings?.Authorization);
            });
        serviceCollection.AddSingleton<ISMSService, SMSService>();
        return serviceCollection;
    }
}
