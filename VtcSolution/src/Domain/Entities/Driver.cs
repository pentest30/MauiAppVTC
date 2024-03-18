namespace VtcSolution.Domain.Entities;
public class Driver : BaseAuditableEntity
{
    public Driver()
    {
        Vehicles = new List<Vehicle>();
        Locations = new List<DriverLocation>();
        OtpValidations = new List<OtpValidation>();
    }
    public Driver(string firstName, string lastName,  string email, PhoneNumber phoneNumber)
    {
        FirstName = firstName;
        LastName = lastName;
        AdhereAt = DateTime.Now.Date;
        Email = email;
        PhoneNumber = phoneNumber;
        Status = Status.Pending;
        Vehicles = new List<Vehicle>();
        Locations = new List<DriverLocation>();
        OtpValidations = new List<OtpValidation>();
        AddDomainEvent(new NewDriverCreated(this));
    }

    public string? FirstName { get; set; } 
    public string? LastName { get; set; } 
    public DateTime AdhereAt { get; set; } 
    public Status Status { get; set; } 
    
    public byte[]? DrivingPermitAttachment { get; set; }
    public string? Email { get; set; } 
    public PhoneNumber? PhoneNumber { get; set; }
    public List<Vehicle> Vehicles { get; set; }
    public List<DriverLocation> Locations { get; set; }
    public List<OtpValidation> OtpValidations { get; set; }
}

