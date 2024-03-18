namespace VtcSolution.Domain.ValueObjects;

public class PhoneNumber : ValueObject
{
    public PhoneNumber(string number, string countryCode)
    {
        Number = number;
        CountryCode = countryCode;
        
    }
    public string Number { get; set; }
    public string CountryCode { get; set; }
    protected override IEnumerable<object> GetEqualityComponents()
    {
        yield return Number;
        yield return CountryCode;
    }
}
