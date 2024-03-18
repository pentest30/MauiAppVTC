using System.Windows.Input;
using MauiAppVTC.DTOs;
using MauiAppVTC.Pages;
using MauiAppVTC.Services;
namespace MauiAppVTC.ViewModels;

public class OTPViewModel: BaseViewModel
{
    private readonly ICustomerApi _customerApi;
    private readonly ITokenService _tokenService;
    private readonly IServiceProvider _serviceProvider;
    public ICommand VerifyCodeCommand { get; set; }

    public OTPViewModel(
        ICustomerApi customerApi,
        ITokenService tokenService, 
        IServiceProvider serviceProvider)
    {
        _customerApi = customerApi;
        _tokenService = tokenService;
        _serviceProvider = serviceProvider;
        MoveNextCommand = new Command<string>((param) =>
        {
            MessagingCenter.Send(this, "MoveNext", param);
        });
        VerifyCodeCommand = new Command(async () => { await ActivateCustomerAsync(); });
    }
    public ICommand MoveNextCommand { get; set; }
    private string _digit1;
    private string _digit2;
    private string _digit3;
    private string _digit6;
    private Guid _customerId;

    public Guid CustomerId
    {
        get => _customerId;
        set
        {
            if (value.Equals(_customerId)) return;
            _customerId = value;
            OnPropertyChanged();
        }
    }
    public string Digit1
    {
        get => _digit1;
        set
        {
            if (_digit1 != value)
            {
                _digit1 = value;
                OnPropertyChanged(nameof(Digit1));
                if (!string.IsNullOrEmpty(value) && value.Length == 1)
                {
                    MoveNextCommand.Execute("Digit1");
                }
            }
        }
    }
    public string Digit2
    {
        get => _digit2;
        set
        {
            if (_digit2 != value)
            {
                _digit2 = value;
                OnPropertyChanged(nameof(Digit2));
                if (!string.IsNullOrEmpty(value) && value.Length == 1)
                {
                    MoveNextCommand.Execute("Digit2");
                }
            }
        }
    }
    public string Digit3
    {
        get => _digit3;
        set
        {
            if (_digit3 != value)
            {
                _digit3 = value;
                OnPropertyChanged(nameof(Digit3));
                if (!string.IsNullOrEmpty(value) && value.Length == 1)
                {
                    MoveNextCommand.Execute("Digit3");
                }
            }
        }
    }
    private string _digit4;
    public string Digit4
    {
        get => _digit4;
        set
        {
            if (_digit4 != value)
            {
                _digit4 = value;
                OnPropertyChanged(nameof(Digit4));
                if (!string.IsNullOrEmpty(value) && value.Length == 1)
                {
                    MoveNextCommand.Execute("Digit4");
                }
            }
        }
    }
    private string _digit5;
    
    public string Digit5
    {
        get => _digit5;
        set
        {
            if (_digit5 != value)
            {
                _digit5 = value;
                OnPropertyChanged(nameof(Digit5));
                if (!string.IsNullOrEmpty(value) && value.Length == 1)
                {
                    MoveNextCommand.Execute("Digit5");
                }
            }
        }
    }

    public string Digit6
    {
        get => _digit6;
        set
        {
            if (_digit6 != value)
            {
                _digit6 = value;
                OnPropertyChanged(nameof(Digit6));
            }
        }
    }
    private async Task ActivateCustomerAsync()
    {
        var activeCustomerRequest = new CustomerUpdateRequest
        {
            CustomerId = CustomerId,
            Code = Digit1 + Digit2 + Digit3 + Digit4 + Digit5 + Digit6
        };
        var response = await _customerApi.UpdateCustomerAsync(CustomerId,activeCustomerRequest);
        if (response.IsSuccessStatusCode)
        {
            var ct = await response.Content.ReadAsStringAsync();
            await _tokenService.SaveTokenAsync(ct);
            var vm = _serviceProvider.GetService<MainPage>();
            await Application.Current.MainPage.Navigation.PushAsync(vm);
        }
        else
        {
            await Application.Current.MainPage.DisplayAlert("Error", "Customer not activated", "OK");
        }
    }
}