namespace MauiAppVTC.Services;

public interface ILocationService
{
    Task<string> GetAddressFromCoordinates(double latitude, double longitude);
    public string CurrentAddress { get; }
    Task<Location> GetCurrentUserLocationAsync();
}
