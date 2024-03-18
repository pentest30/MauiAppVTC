using CommunityToolkit.Maui;
using MauiAppVTC.Pages;
using MauiAppVTC.Services;
using MauiAppVTC.ViewModels;
using Microsoft.Extensions.Logging;
using Microsoft.Maui.Controls.Compatibility.Hosting;
using Refit;
using SkiaSharp.Views.Maui.Controls.Hosting;
using UraniumUI;

namespace MauiAppVTC;

public static class MauiProgram
{
    public static MauiApp CreateMauiApp()
    {
        var builder = MauiApp.CreateBuilder();
        builder.UseMauiApp<App>()
            .UseUraniumUI()
            .UseUraniumUIMaterial()
            .UseMauiCommunityToolkit()
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                fonts.AddFontAwesomeIconFonts();
            }) 
            //.UseMauiMaps()
            .UseMauiCompatibility()
            .UseSkiaSharp(true)
            .ConfigureFonts(fonts =>
            {
                fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
            });
        builder.Services.AddSingleton<ILocationService, LocationService>();
        builder.Services.AddSingleton<IOpenRouteService, OpenRouteService>();
        builder.Services.AddSingleton<ITokenService, TokenService>();
        builder.Services.AddTransient<MapViewModel>();
        builder.Services.AddTransient<MainPage>(); 
        builder.Services.AddTransient<SIgnUpViewModel>();
        builder.Services.AddTransient<SignUpPage>(); 
        builder.Services.AddTransient<LoginPage>(); 
        builder.Services.AddTransient<LoginViewModel>(); 
        builder.Services.AddTransient<OTPViewModel>();
        builder.Services.AddTransient<CodeValidationPage>(); 
        builder.Services.AddTransient<LoadingPage>(); 
        builder.Services.AddTransient<TripListing>(); 
        builder.Services.AddTransient<ListingTripsViewModel>(); 
        builder.Services.AddRefitClient<ICustomerApi>()
            .ConfigureHttpClient(c =>
            {
                c.BaseAddress = new Uri("https://d911-197-206-178-197.ngrok-free.app/");
            })
            .Services.AddRefitClient<IGeocodingService>()
            .ConfigureHttpClient(c =>
            {
                c.BaseAddress = new Uri("https://nominatim.openstreetmap.org");
            })
            .Services.AddRefitClient<IOpenRouteServiceApi>()
            .ConfigureHttpClient(c =>
            {
                c.BaseAddress = new Uri("https://api.openrouteservice.org");
            });
        
    
#if DEBUG
        builder.Logging.AddDebug();
#endif

        return builder.Build();
    }
}