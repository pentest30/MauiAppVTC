using System.Windows.Input;
using MauiAppVTC.DTOs;
using MauiAppVTC.Pages;
using MauiAppVTC.Services;

namespace MauiAppVTC.ViewModels;

public class LoginViewModel : BaseViewModel
{
    private readonly ICustomerApi _customerApi;
    private readonly ITokenService _tokenService;
    private string _countryCode;
    private string _phone;
    public ICommand SubmitCommand { get; }
    public ICommand GoToSignUpCommand { get; }
    public LoginViewModel(
        ICustomerApi customerApi, 
        ITokenService tokenService)
    {
        _customerApi = customerApi;
        _tokenService = tokenService;
        SubmitCommand = new Command(async () => { await Login(); });
        GoToSignUpCommand = new Command(async () => { await GoToSignUp(); });
    }

    private async Task GoToSignUp()
    {
        await Shell.Current.GoToAsync($"//{nameof(SignUpPage)}");
    }

    private async Task Login()
    {
        var loginDto = new LoginRequest
        {
            CountryCode = CountryCode,
            PhoneNumber = Phone
        };
        var response = await _customerApi.LoginAsync(loginDto);
        if (response.IsSuccessStatusCode)
        {
            var token = await response.Content.ReadAsStringAsync();
            await _tokenService.SaveTokenAsync(token);
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        }
        else
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Login failed", "OK");
        }
    }

    public string CountryCode
    {
        get => _countryCode;
        set => SetField(ref _countryCode, value);
    }
    public string Phone
    {
        get => _phone;
        set => SetField(ref _phone, value);
    } 
}
