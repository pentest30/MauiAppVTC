namespace VtcSolution.Domain.Entities;

public class Vehicle : BaseEntity
{
    public Vehicle()
    {
    }
    public Vehicle(string make, string model, string color, string registrationNumber, DateTime registrationDate)
    {
        Make = make;
        Model = model;
        Color = color;
        RegistrationNumber = registrationNumber;
        RegistrationDate = registrationDate;
    }

    public string? Make { get; set; } 
    public string? Model { get; set; } 
    public string? Color { get; set; } 
    public string? RegistrationNumber { get; set; } 
    public DateTime RegistrationDate { get; set; } 
    public Guid? DriverId { get; set; } 

    public Driver? Driver { get; set; } 
}
