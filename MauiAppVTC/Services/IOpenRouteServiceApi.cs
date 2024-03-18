using Refit;

namespace MauiAppVTC.Services;

public interface IOpenRouteServiceApi
{
    [Get("/v2/directions/driving-car")]
    Task<HttpResponseMessage> GetRouteAsync(string api_key, string start, string end);
}