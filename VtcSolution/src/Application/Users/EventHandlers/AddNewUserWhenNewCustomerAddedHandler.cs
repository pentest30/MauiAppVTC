using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Domain.Events;

namespace VtcSolution.Application.Users.EventHandlers;

public class AddNewUserWhenNewCustomerAddedHandler : INotificationHandler<NewCustomerEvent>
{
    private readonly IIdentityService _identityService;

    public AddNewUserWhenNewCustomerAddedHandler(IIdentityService identityService)
    {
        _identityService = identityService;
    }
   
    public async Task Handle(NewCustomerEvent @event, CancellationToken cancellationToken)
    {
        await _identityService.CreateUserAsync(@event.Customer?.Email!, await _identityService.GeneratePassword(@event.Customer?.Phone?.Number!, @event.Customer?.Email!));
        await _identityService.AddRolesAsync(@event.Customer?.Email!, "Customer");
    }
}
