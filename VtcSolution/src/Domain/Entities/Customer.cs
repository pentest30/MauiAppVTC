namespace VtcSolution.Domain.Entities;

public class Customer : BaseAuditableEntity
{
    public Customer()
    {
        OptValidations = new List<OtpValidation>();
    }
    public Customer(string firstName, string lastName, string email, string phone, string countryCode)
    {
        Id = Guid.NewGuid();
        FirstName = firstName;
        LastName = lastName;
        Email = email;
        Phone = new PhoneNumber(phone, countryCode);
        Status = Enums.Status.Pending;
        AdhereAt = DateTime.Now.Date;
        OptValidations = new List<OtpValidation>();
        OptValidations.Add(new OtpValidation().AddCustomerOtpValidation(Id, Phone));
        AddDomainEvent(new NewCustomerEvent(this));
    }
    public void Active(string code)
    {
        var opt = OptValidations.FirstOrDefault(p=>p.Code == code);
        if(opt == null || opt.ExpireAt < DateTime.UtcNow)
        {
            throw new InvalidOperationException("Invalid code");
        }
        Status = Enums.Status.Active;
    }

    public string? FirstName { get; set; }
    private string? LastName { get; set; }
    public string? Email { get; set; }
    public PhoneNumber? Phone { get; set; }
    public string? Address { get; set; }
    public string? City { get; set; }
    public string? Region { get; set; }
    public string? Country { get; set; }
    public string? PostalCode { get; set; }
    public Status? Status { get; set; }
    public DateTime AdhereAt { get; set; }
    public List<OtpValidation> OptValidations { get; set; }
}
