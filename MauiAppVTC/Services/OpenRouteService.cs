namespace MauiAppVTC.Services;

public interface IOpenRouteService
{
    Task<string> GetRouteAsync(double startLat, double startLon, double endLat, double endLon);
}

public class OpenRouteService : IOpenRouteService
{
    private readonly IOpenRouteServiceApi _openRouteService;
    public OpenRouteService(IOpenRouteServiceApi openRouteService)
    {
        _openRouteService = openRouteService;
    }
    private static readonly Random _random = new();

    private static string GetRandomApiKey()
    {
        int index = _random.Next(_apiKeys.Length); // Generate a random index
        return _apiKeys[index]; // Return the API key at the random index
    }
    // Define the API key as a static field. You can set this value directly or from your application's configuration.
    private static readonly string [] _apiKeys = {"5b3ce3597851110001cf6248b56ebfdca55544b39a2d1e8e98b92e4e",
        "5b3ce3597851110001cf6248c21ea7c5831043148a621ef221819f3b"};

    public  async Task<string> GetRouteAsync(double startLat, double startLon, double endLat, double endLon)
    {
        // Construct the URL using the static API key
        
        try
        {
            // Send a GET request to the specified URL
            Thread.Sleep(500);
            var apiKey = GetRandomApiKey(); // Ensure you have this method implemented
            var start = $"{startLon},{startLat}";
            var end = $"{endLon},{endLat}";
            var response = await _openRouteService.GetRouteAsync(apiKey, start, end);
            response.EnsureSuccessStatusCode();
            // Read and return the response body as a string
            var content = await response.Content.ReadAsStringAsync();
            return RouteResponseToWKT.ConvertResponseToWKT(content);
        }
        catch (HttpRequestException e)
        {
            Console.WriteLine("\nException Caught!");
            Console.WriteLine("Message :{0} ", e.Message);
            return null;
        }
    }
}