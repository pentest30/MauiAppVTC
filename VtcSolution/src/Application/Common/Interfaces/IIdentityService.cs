using VtcSolution.Application.Common.Models;

namespace VtcSolution.Application.Common.Interfaces;

public interface IIdentityService
{
    Task<string?> GetUserNameAsync(string userId);

    Task<bool> IsInRoleAsync(string userId, string role);
    Task<bool> AddRolesAsync(string email, string role);

    Task<bool> AuthorizeAsync(string userId, string policyName);

    Task<(Result Result, string UserId)> CreateUserAsync(string userName, string password);
    Task<(Result Result, string UserId)> CreateUserAsync(string userName,string email, string password);
    Task<Result> DeleteUserAsync(string userId);
    Task<string> GeneratePassword(string userName, string email);
    Task<string?> Authenticate(string userName);

}
