using System.Reflection;
using MediatR;
using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Infrastructure.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace VtcSolution.Infrastructure.Data;

public class ApplicationDbContext : IdentityDbContext<ApplicationUser>, IUnitOfWork
{
    private readonly IMediator _mediator;
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options, IMediator mediator) : base(options)
    {
        _mediator = mediator;
    }
    
    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        builder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
    }

    public override async Task<int> SaveChangesAsync( CancellationToken cancellationToken = new CancellationToken())
    {
        await _mediator.DispatchDomainEvents(this);
        return await base.SaveChangesAsync( cancellationToken);
    }
}
