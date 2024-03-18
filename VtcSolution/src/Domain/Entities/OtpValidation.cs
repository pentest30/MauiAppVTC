using System.Security.Cryptography;

namespace VtcSolution.Domain.Entities;

public class OtpValidation : BaseEntity
{
    public OtpValidation()
    {
    }
    public OtpValidation AddCustomerOtpValidation(Guid customerId,  PhoneNumber phoneNumber)
    {
        CustomerId = customerId;
        Code = GenerateRandomInteger(99999).ToString("D6");
        PhoneNumber = phoneNumber.CountryCode + phoneNumber.Number;
        CreatedAt = DateTime.UtcNow;
        ExpireAt = CreatedAt.AddMinutes(1);
        return this;
    }
    public OtpValidation AddDriverOtpValidation(Guid driverId, string? code, PhoneNumber phoneNumber)
    {
        DriverId = driverId;
        Code = code;
        PhoneNumber = phoneNumber.CountryCode + phoneNumber.Number;
        CreatedAt = DateTime.UtcNow;
        ExpireAt = CreatedAt.AddMinutes(1);
        return this;
    }

    private static int GenerateRandomInteger(int maxValue)
    {
        if (maxValue < 1)
            throw new ArgumentOutOfRangeException(nameof(maxValue), "maxValue must be greater than 0.");

        int result = 0;
        byte[] intBytes = new byte[4]; // Int32 size is 4 bytes
        do
        {
            RandomNumberGenerator.Fill(intBytes);
            result = BitConverter.ToInt32(intBytes, 0) & int.MaxValue;
        } while (result >= maxValue * (int.MaxValue / maxValue)); // Ensure fair distribution

        return result % maxValue;
    }
    public Customer? Customer { get; set; }
    public Guid? CustomerId { get; set; }
    public Driver? Driver { get; set; }
    public Guid? DriverId { get; set; }
    public string? PhoneNumber { get; private set; }
    public string? Code { get; private set; }
    public DateTime CreatedAt { get; private set; }
    public DateTime ExpireAt { get; private set; }
}
