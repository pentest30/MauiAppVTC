using MauiAppVTC.ViewModels;

namespace MauiAppVTC.Pages;

public partial class CodeValidationPage : ContentPage
{
    public CodeValidationPage(OTPViewModel viewModel)
    {
        InitializeComponent();
        this.BindingContext = viewModel;
        this.digit1.Focus();
        MessagingCenter.Subscribe<OTPViewModel, string>(this, "MoveNext", (sender, param) =>
        {
            switch (param)
            {
                case "Digit1":
                    digit2.Focus();
                    break;
                case "Digit2":
                    digit3.Focus();
                    break;
                case "Digit3":
                    digit4.Focus();
                    break;
                case "Digit4":
                    digit5.Focus();
                    break;
                case "Digit5":
                    digit6.Focus();
                    break;
            }
        });
    }

    private void OnDigitChanged(object? sender, TextChangedEventArgs e)
    {
        throw new NotImplementedException();
    }
}