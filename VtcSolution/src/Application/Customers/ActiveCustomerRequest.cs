using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Application.Customers;

public class ActiveCustomerRequest : IRequest<string?>
{
    public Guid CustomerId { get; set; }
    public string? Code { get; set; }
}
public class ActiveCustomerRequestHandler : IRequestHandler<ActiveCustomerRequest, string?>
{
    private readonly IRepository<Customer> _repository;
    private readonly IIdentityService _identityService;

    public ActiveCustomerRequestHandler(
        IRepository<Customer> repository,
        IIdentityService identityService)
    {
        _repository = repository;
        _identityService = identityService;
    }

    public async Task<string?> Handle(ActiveCustomerRequest request, CancellationToken cancellationToken)
    {
        Customer? customer = await GetCustomerAsync(request, cancellationToken);
        if (customer == null) throw new NotFoundException(request.CustomerId.ToString(), "Customer not found");
        customer.Active(request.Code!);
        await _repository.UpdateAsync(customer, cancellationToken);
        await _repository.UnitOfWork.SaveChangesAsync(cancellationToken);
        var token = await _identityService.Authenticate(customer.Email!);
        return token;
    }

    private async Task<Customer?> GetCustomerAsync(ActiveCustomerRequest request, CancellationToken cancellationToken)
    {
        var customer = await _repository.GetAll()
            .Include(x=>x.OptValidations)
            .FirstOrDefaultAsync(c => c.Id == request.CustomerId, cancellationToken: cancellationToken);
        return customer;
    }
}
