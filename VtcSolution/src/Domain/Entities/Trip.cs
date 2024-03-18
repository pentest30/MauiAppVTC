namespace VtcSolution.Domain.Entities;

public class Trip : BaseAuditableEntity
{
    public Guid? DriverId { get; set; }
    public Guid? VehicleId { get; set; }
    public Guid? CustomerId { get; set; }
    public DateTime StartTime { get; set; } 
    public DateTime? EndTime { get; set; } 
    public decimal EstimatedCost { get; set; } 
    public decimal? FinalCost { get; set; } 
    public TripStatus Status { get; set; } 
    public double StartLatitude { get; set; }
    public double StartLongitude { get; set; }
    public double DestinationLatitude { get; set; }
    public double DestinationLongitude { get; set; }
    public virtual Driver? Driver { get; set; }
    public virtual Vehicle? Vehicle { get; set; }
    public virtual Customer? Customer { get; set; }
    public Address? StartingAddress { get; set; }
    public Address? FinalAddress { get; set; }
}
