using MauiAppVTC.Services;
using MauiAppVTC.ViewModels;

namespace MauiAppVTC.Pages;

public partial class MainPage : UraniumUI.Pages.UraniumContentPage
{
    private readonly MapViewModel _viewModel;
    private readonly ITokenService _tokenService;
    private readonly IServiceProvider _serviceProvider;

    public MainPage(MapViewModel viewModel, ITokenService tokenService, IServiceProvider serviceProvider)
    {
       
        InitializeComponent();
        _viewModel = viewModel;
        _tokenService = tokenService;
        _serviceProvider = serviceProvider;
        BindingContext = viewModel;
    }  
   
    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await _viewModel.InitializeMapAsync(mapView);
       
    }
   
}