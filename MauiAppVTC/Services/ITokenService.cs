namespace MauiAppVTC.Services;

public interface ITokenService
{
    Task SaveTokenAsync(string token);
    Task<string?> GetTokenAsync();
    void RemoveToken();
    bool IsTokenExpired(string? token);
}
