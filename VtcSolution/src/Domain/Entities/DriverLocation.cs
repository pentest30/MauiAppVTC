namespace VtcSolution.Domain.Entities;

public class DriverLocation : BaseEntity
{
    public DriverLocation()
    {
        
    }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
    public DateTime RecordedAt { get; set; } 
    public Guid? DriverId { get; set; }
    public virtual Driver? Driver { get; set; }
}
