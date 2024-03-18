using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Infrastructure.Data.Configurations;

public class DriverConfiguration : IEntityTypeConfiguration<Driver>,
    IEntityTypeConfiguration<Vehicle>, IEntityTypeConfiguration<DriverLocation>
{
    public void Configure(EntityTypeBuilder<Driver> builder)
    {
        builder.ToTable("Drivers", SchemaConstants.DriverManagement);
        builder.Property(x => x.Id).HasDefaultValueSql("newsequentialid()");
        builder.OwnsOne(p => p.PhoneNumber);
        builder.HasMany(x=>x.OtpValidations)
            .WithOne(x=>x.Driver)
            .HasForeignKey(x=>x.DriverId)
            .OnDelete(DeleteBehavior.Cascade);
    }

    public void Configure(EntityTypeBuilder<Vehicle> builder)
    {
        builder.ToTable("Vehicles", SchemaConstants.DriverManagement);
        builder.Property(x => x.Id).HasDefaultValueSql("newsequentialid()");
    }

    public void Configure(EntityTypeBuilder<DriverLocation> builder)
    {
        builder.ToTable("DriverLocations", SchemaConstants.DriverManagement);
        builder.Property(x => x.Id).HasDefaultValueSql("newsequentialid()");
    }
}
