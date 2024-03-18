using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Application.Users.Commands;

public class LoginCommandRequest : IRequest<string?>
{
    public string? CountryCode { get; set; }
    public string? PhoneNumber { get; set; }
}
public class LoginCommandHandler : IRequestHandler<LoginCommandRequest, string?>
{
    private readonly IRepository<Customer> _repository;
    private readonly IIdentityService _identityService;

    public LoginCommandHandler(IRepository<Customer> repository, IIdentityService identityService)
    {
        _repository = repository;
        _identityService = identityService;
    }
    
    public async Task<string?> Handle(LoginCommandRequest request, CancellationToken cancellationToken)
    {
        var customer = await GetCustomerAsync(request, cancellationToken);
        if (customer == null) throw new NotFoundException(request.PhoneNumber!, "Customer not found");
        // Implement the logic to authenticate the user
        var token = await _identityService.Authenticate(customer.Email!);
        return token;
    }
    private async Task<Customer?> GetCustomerAsync(LoginCommandRequest request, CancellationToken cancellationToken)
    {
        var customer = await _repository.GetAll()
            .Include(x=>x.OptValidations)
            .FirstOrDefaultAsync(c => c.Phone!.CountryCode == request.CountryCode && c.Phone.Number == request.PhoneNumber, cancellationToken: cancellationToken);
        return customer;
    }
}
 
