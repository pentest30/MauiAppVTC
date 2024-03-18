using System.Windows.Input;
using MauiAppVTC.DTOs;
using MauiAppVTC.Pages;
using MauiAppVTC.Services;

namespace MauiAppVTC.ViewModels;

public class SIgnUpViewModel : BaseViewModel
{
    private readonly ICustomerApi _customerApi;
    private readonly OTPViewModel _otpViewModel;
    private string _firstName;
    private string _lastName;
    private string _email;
    private string _countryCode;
    private string _phone;
    public ICommand SubmitCommand { get; }

    public SIgnUpViewModel(ICustomerApi customerApi, OTPViewModel otpViewModel)
    {
        _customerApi = customerApi;
        _otpViewModel = otpViewModel;
        SubmitCommand = new Command(async () => { await RegisterCustomer(); });
    }

    private async Task RegisterCustomer()
    {
        var createCustomerRequest = CreateCustomerRequest();
        var response = await _customerApi.CreateCustomerAsync(createCustomerRequest);
        if (response.IsSuccessStatusCode)
        {
            var customerId = Newtonsoft.Json.JsonConvert.DeserializeObject<Guid>(await response.Content.ReadAsStringAsync());
            _otpViewModel.CustomerId = customerId;
            await Shell.Current.Navigation.PushAsync(new CodeValidationPage(_otpViewModel));
        }
        else
        {
            await Shell.Current.DisplayAlert("Error", "Customer not created", "OK");
        }
    }

    private CreateCustomerRequest CreateCustomerRequest()
    {
        var createCustomerRequest = new CreateCustomerRequest
        {
            FirstName = FirstName,
            LastName = LastName,
            Email = Email,
            CountryCode = CountryCode,
            Phone = Phone
        };
        return createCustomerRequest;
    }

    public string FirstName
    {
        get => _firstName;
        set => SetField(ref _firstName, value);
    }
    public string LastName
    {
        get => _lastName;
        set => SetField(ref _lastName, value);
    }
    public string Email
    {
        get => _email;
        set => SetField(ref _email, value);
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