using MauiAppVTC.DTOs;
using Refit;

namespace MauiAppVTC.Services;

public interface ICustomerApi
{
    [Post("/api/Customers")]
    Task<HttpResponseMessage> CreateCustomerAsync([Body] CreateCustomerRequest createCustomerRequest);
    [Put("/api/Customers/{id}")]
    Task<HttpResponseMessage> UpdateCustomerAsync(Guid id, [Body] CustomerUpdateRequest request);
    [Put("/api/Auth/login")]
    Task<HttpResponseMessage> LoginAsync([Body] LoginRequest loginRequest);
}