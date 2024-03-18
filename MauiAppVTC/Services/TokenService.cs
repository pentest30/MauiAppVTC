using System.IdentityModel.Tokens.Jwt;

namespace MauiAppVTC.Services;

public class TokenService : ITokenService
{
    private const string TokenKey = "auth_token";

    public async Task SaveTokenAsync(string token)
    {
        await SecureStorage.SetAsync(TokenKey, token);
    }
    public bool IsTokenExpired(string? token)
    {
        var handler = new JwtSecurityTokenHandler();
        var jwtToken = handler.ReadJwtToken(token);
        var expClaim = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "exp");

        if (expClaim != null && long.TryParse(expClaim.Value, out long expValue))
        {
            var expiration = DateTimeOffset.FromUnixTimeSeconds(expValue);
            return expiration <= DateTimeOffset.UtcNow; // Check if the token is expired
        }
        return true;
    }
    public async Task<string?> GetTokenAsync()
    {
        return await SecureStorage.GetAsync(TokenKey);
    }

    public void RemoveToken()
    {
        SecureStorage.Remove(TokenKey);
    }
}