using Microsoft.EntityFrameworkCore;
using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Domain.Common;

namespace VtcSolution.Infrastructure.Data;


public class DbContextRepository<TDbContext,TEntity> : IRepository<TEntity> where TEntity : BaseAuditableEntity
where TDbContext : DbContext, IUnitOfWork
{
    private readonly TDbContext _context;
    private readonly IDateTime _dateTimeService;
    private readonly ICurrentUserService _currentUserService;

    public IUnitOfWork UnitOfWork
    {
        get
        {
            return _context;
        }
    }
    public DbContextRepository(TDbContext context, IDateTime dateTimeService, ICurrentUserService currentUserService)
    {
        _context = context;
        _dateTimeService = dateTimeService;
        _currentUserService = currentUserService;
    }

    public IQueryable<TEntity> Entities { get { return _context.Set<TEntity>(); } }
    protected DbSet<TEntity> DbSet => _context.Set<TEntity>();
    public void Add(TEntity entity)
    {
        entity.CreatedBy = _currentUserService.UserId;
        entity.Created = _dateTimeService.Now;
        DbSet.Add(entity);
    }

    public void Update(TEntity entity)
    {
        entity.LastModifiedBy = _currentUserService.UserId;
        entity.LastModified = _dateTimeService.Now;
        _context.Update(entity);
    }

    public void Delete(TEntity entity)
    { 
        DbSet.Remove(entity);
    }

    public async Task AddAsync(TEntity entity, CancellationToken cancellationToken = default)
    {
        entity.CreatedBy = _currentUserService.UserId;
        entity.Created = _dateTimeService.Now;
        await DbSet.AddAsync(entity, cancellationToken);
    }

    public Task UpdateAsync(TEntity entity, CancellationToken cancellationToken = default)
    {
        entity.LastModifiedBy = _currentUserService.UserId;
        entity.LastModified = _dateTimeService.Now;
        DbSet.Update(entity);
        return Task.CompletedTask;
    }


    public IQueryable<TEntity> GetAll()
    {
        return _context.Set<TEntity>();
    }

    public Task<TEntity?> FirstOrDefaultAsync(IQueryable<TEntity> query)
    {
        return  query.FirstOrDefaultAsync();
    }

    public Task<TEntity?> SingleOrDefaultAsync(IQueryable<TEntity> query)
    {
        return  query.SingleOrDefaultAsync();
    }

    public Task<List<TEntity>> ToListAsync(IQueryable<TEntity> query)
    {
        return query.ToListAsync();
    }
}
