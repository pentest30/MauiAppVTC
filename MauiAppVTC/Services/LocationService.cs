using Newtonsoft.Json;

namespace MauiAppVTC.Services;

public class LocationService : ILocationService
{
    private readonly IGeocodingService _geocodingService;

    public LocationService(IGeocodingService geocodingService)
    {
        _geocodingService = geocodingService;
    }

    public string CurrentAddress { get; private set; }
    public async Task<Location> GetCurrentUserLocationAsync()
    {
        try
        {
            var status = await Permissions.RequestAsync<Permissions.LocationWhenInUse>();
            if (status != PermissionStatus.Granted)
            {
                // Handle permission denial
                return null;
            }

            var request = new GeolocationRequest(GeolocationAccuracy.Medium, TimeSpan.FromSeconds(10));
            var location = await Geolocation.GetLocationAsync(request);
            return location;
        }
        catch (Exception ex)
        {
            // Handle exceptions
            throw; // Rethrow the exception to be handled elsewhere
        }
    }

    public async Task<string> GetAddressFromCoordinates(double latitude, double longitude)
    {
       
        try
        {
            var response = await _geocodingService.GetAddressFromCoordinates(latitude, longitude);
            if (response.IsSuccessStatusCode)
            {
                var json = await response.Content.ReadAsStringAsync();
                var data = JsonConvert.DeserializeObject<dynamic>(json);

                var address = $"{data.address.road}, {data.address.city}, {data.address.state}";
                return address;
            }
        }
        catch (Exception ex)
        {
            await Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");

            // Handle exceptions
            Console.WriteLine($"Error retrieving address: {ex.Message}");
        }
        return null;
    }
}