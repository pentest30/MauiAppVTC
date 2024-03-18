using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Domain.Common;

namespace VtcSolution.Infrastructure.Data;

public  class Repository<T> : DbContextRepository<ApplicationDbContext, T>
    where T :  BaseAuditableEntity
{
    public Repository(ApplicationDbContext dbContext, IDateTime dateTimeProvider, ICurrentUserService currentUserService)
        : base(dbContext, dateTimeProvider, currentUserService)
    {
    }
}
