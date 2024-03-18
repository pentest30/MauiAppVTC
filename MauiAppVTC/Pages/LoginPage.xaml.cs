using MauiAppVTC.ViewModels;

namespace MauiAppVTC.Pages;

public partial class LoginPage : ContentPage
{
   
    public LoginPage( LoginViewModel loginViewModel)
    {
        InitializeComponent();
        BindingContext = loginViewModel;
    }
}