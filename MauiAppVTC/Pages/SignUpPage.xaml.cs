using MauiAppVTC.ViewModels;

namespace MauiAppVTC.Pages;

public partial class SignUpPage : ContentPage
{
    private readonly IServiceProvider _serviceProvider;

    public SignUpPage(SIgnUpViewModel viewModel, IServiceProvider serviceProvider)
    {
        _serviceProvider = serviceProvider;
        InitializeComponent();
        this.BindingContext = viewModel;
    }

    private async void OnSignInTapped(object? sender, TappedEventArgs e)
    {
        var loginPage = _serviceProvider.GetService<LoginPage>();
        await Navigation.PushAsync(loginPage);
    }
}