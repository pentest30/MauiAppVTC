using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MauiAppVTC.Models;
using MauiAppVTC.ViewModels;

namespace MauiAppVTC.Pages;

public partial class TripListing : ContentPage
{

    public TripListing(ListingTripsViewModel viewModel)
    {
        InitializeComponent();
        BindingContext = viewModel;
    }
}