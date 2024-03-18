using MediatR;
using Microsoft.AspNetCore.Mvc;
using VtcSolution.Application.Customers;

namespace Vtc.API.Controllers.Customers;

[Route("api/[controller]")]
[ApiController]
public class CustomersController : ControllerBase
{
    private readonly IMediator _mediator;

    public CustomersController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost]
    public async Task<IActionResult> CreateCustomer([FromBody] CreateCustomerCommand command)
    {
        try
        {
            var customerId = await _mediator.Send(command);
            return Ok(customerId);
        }
        catch (Exception ex)
        {
            // Handle the exception appropriately
            return StatusCode(500, ex.Message);
        }
    }
    [HttpPut("{id:guid}")]
    public async Task<IActionResult> ActiveCustomer([FromRoute] Guid id, [FromBody] ActiveCustomerRequest request)
    {
        try
        {
            request.CustomerId = id;
            var result = await _mediator.Send(request);
            return Ok(result);
        }
        catch (Exception ex)
        {
            // Handle the exception appropriately
            return StatusCode(500, ex.Message);
        }
    }
}
