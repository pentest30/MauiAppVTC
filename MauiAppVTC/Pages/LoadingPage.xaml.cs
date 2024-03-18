using MauiAppVTC.Services;

namespace MauiAppVTC.Pages;

public partial class LoadingPage : ContentPage
{
    private readonly ITokenService _tokenService;

    public LoadingPage(ITokenService tokenService)
    {
        _tokenService = tokenService;
        InitializeComponent();
    }

    protected override async void OnNavigatedTo(NavigatedToEventArgs args)
    {
        base.OnNavigatedTo(args);
        var token = await _tokenService.GetTokenAsync();
        if (string.IsNullOrEmpty(token) ||  _tokenService.IsTokenExpired(token))
        {
            await Shell.Current.GoToAsync($"//{nameof(LoginPage)}");
            return;
        }
        await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
    }

   
}