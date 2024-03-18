using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using VtcSolution.Infrastructure.Identity;


public static class IdentityServiceExtensions
{
    public static async Task<string> SignInAndGenerateToken(this SignInManager<ApplicationUser> signInManager, ApplicationUser? userManager, 
        IConfiguration configuration)
    {
        if (userManager == null) return string.Empty;
        await signInManager.SignInAsync(userManager,false);
        return GenerateJwtToken(configuration, userManager);
    }

    private static string GenerateJwtToken( 
        IConfiguration configuration, 
        ApplicationUser user)
    {
        var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]!));
        var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

        var claims = new[]
        {
            new Claim(JwtRegisteredClaimNames.Sub, user.UserName!),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new Claim(ClaimTypes.NameIdentifier, user.Id)
            // Add additional claims as needed
        };

        var token = new JwtSecurityToken(
            issuer: configuration["Jwt:Issuer"],
            audience: configuration["Jwt:Audience"],
            claims: claims,
            expires: DateTime.Now.AddHours(3),
            signingCredentials: credentials);

        return new JwtSecurityTokenHandler().WriteToken(token);
    }
    public static string GeneratePassword(this UserManager<ApplicationUser> userManager, ApplicationUser user, PasswordOptions? opts = null)
    {
        if (opts == null)
        {
            opts = userManager.Options.Password;
        }

        string password = string.Empty;
        Random random = new Random();

        while (!userManager.PasswordValidators[0].ValidateAsync(userManager, user, password).Result.Succeeded)
        {
            password = string.Empty;
            int nonAlphanumeric = 0;

            for (int i = 0; i < opts.RequiredLength; i++)
            {
                char c;

                if (nonAlphanumeric < opts.RequiredUniqueChars)
                {
                    int rnd = random.Next(3);
                    c = rnd switch
                    {
                        0 => (char)random.Next(33, 48),
                        1 => (char)random.Next(58, 65),
                        _ => (char)random.Next(91, 97),
                    };
                    nonAlphanumeric++;
                }
                else
                {
                    c = (char)random.Next(48, 122);
                    if (!char.IsLetterOrDigit(c)) i--;
                }

                password += c;
            }
        }

        return password;
    }
}
