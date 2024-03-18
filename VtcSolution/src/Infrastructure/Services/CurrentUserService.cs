using System.Security.Claims;
using Microsoft.AspNetCore.Http;
using VtcSolution.Application.Common.Interfaces;

namespace VtcSolution.Infrastructure.Services;

public class CurrentUserService : ICurrentUserService
{
    private readonly IHttpContextAccessor _httpContextAccessor;

    public CurrentUserService(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
    }
    public string UserId
    {
        get
        {
            if(_httpContextAccessor?.HttpContext == null) return string.Empty;
                
            var userId = _httpContextAccessor?.HttpContext?.User.FindFirst(ClaimTypes.Sid)?.Value
                         ?? _httpContextAccessor?.HttpContext?.User.FindFirst("sub")?.Value;

            return !string.IsNullOrEmpty(userId) ? userId : string.Empty;
        }
            
    }

    public Guid? CurrentCustomerId
    {
        get
        {
            var customerIdClaim = _httpContextAccessor.HttpContext?.User.FindFirst("CustomerID");
            if (customerIdClaim != null && Guid.TryParse(customerIdClaim.Value, out var customerId))
            {
                return customerId;
            }
            return null;
        }
    }
}
