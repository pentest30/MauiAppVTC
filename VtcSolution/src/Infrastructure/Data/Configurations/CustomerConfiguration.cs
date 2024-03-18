using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Infrastructure.Data.Configurations;

public class CustomerConfiguration : IEntityTypeConfiguration<Customer>, IEntityTypeConfiguration<OtpValidation>
{
    public void Configure(EntityTypeBuilder<Customer> builder)
    {
        builder.ToTable("Customers", SchemaConstants.CustomerManagement);
        builder.OwnsOne(p => p.Phone);
        builder.HasMany(x=>x.OptValidations)
            .WithOne(x=>x.Customer)
            .HasForeignKey(x=>x.CustomerId)
            .OnDelete(DeleteBehavior.Cascade);
        builder.Property(x => x.Id).HasDefaultValueSql("newsequentialid()");
    }

    public void Configure(EntityTypeBuilder<OtpValidation> builder)
    {
        builder.ToTable("OtpValidations", SchemaConstants.CustomerManagement);
        builder.Property(x => x.Id).HasDefaultValueSql("newsequentialid()");
    }
}
