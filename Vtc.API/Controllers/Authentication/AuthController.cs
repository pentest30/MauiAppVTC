using MediatR;
using Microsoft.AspNetCore.Mvc;
using VtcSolution.Application.Users.Commands;

namespace Vtc.API.Controllers.Authentication;

[Route("api/[controller]")]
[ApiController]

public class AuthController : ControllerBase
{
    private readonly IMediator _mediator;

    public AuthController(IMediator mediator)
    {
        _mediator = mediator;
    }
    [HttpPut("login")] 
    public async Task<IActionResult> Login([FromBody] LoginCommandRequest command)
    {
        try
        {
            var token = await _mediator.Send(command);
            return Ok(token);
        }
        catch (Exception ex)
        {
            // Handle the exception appropriately
            return StatusCode(500, ex.Message);
        }
    }
}

