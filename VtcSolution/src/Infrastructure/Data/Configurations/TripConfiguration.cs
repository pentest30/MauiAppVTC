using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Infrastructure.Data.Configurations;

public class TripConfiguration : IEntityTypeConfiguration<Trip>
{
    public void Configure(EntityTypeBuilder<Trip> builder)
    {
        builder.ToTable("Trips", SchemaConstants.TripManagement);
        builder.OwnsOne(p => p.StartingAddress);
        builder.OwnsOne(p => p.FinalAddress);
        builder.Property(x => x.Id).HasDefaultValueSql("newsequentialid()");
    }
}
