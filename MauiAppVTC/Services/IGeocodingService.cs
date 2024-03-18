using Refit;

namespace MauiAppVTC.Services;

public interface IGeocodingService
{
    [Get("/reverse?format=json&lat={latitude}&lon={longitude}")]
    Task<HttpResponseMessage> GetAddressFromCoordinates(double latitude, double longitude);
}