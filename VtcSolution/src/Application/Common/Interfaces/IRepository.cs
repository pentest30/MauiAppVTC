using VtcSolution.Domain.Common;

namespace VtcSolution.Application.Common.Interfaces;

public interface IRepository<TEntity> where TEntity : BaseAuditableEntity
{
    IQueryable<TEntity> Entities { get; }
    IUnitOfWork UnitOfWork { get; }
    void Add(TEntity entity);
    void Update(TEntity entity);
    void Delete(TEntity entity);
    Task AddAsync(TEntity entity, CancellationToken cancellationToken = default);
    Task UpdateAsync(TEntity entity, CancellationToken cancellationToken = default);
    IQueryable<TEntity> GetAll();
    Task<TEntity?> FirstOrDefaultAsync(IQueryable<TEntity> query);
    Task<TEntity?> SingleOrDefaultAsync(IQueryable<TEntity> query);
    Task<List<TEntity>> ToListAsync(IQueryable<TEntity> query);
}
