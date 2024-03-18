using VtcSolution.Domain.ValueObjects;

namespace VtcSolution.Application.Common.Models;

public class SmsRequest
{
    public SmsRequest()
    {

    }
    public Message[]? Messages { get; set; }

    public void OTPRequest(string phone, string otp)
    {
        Messages = new[]
        {
            new Message
            {
                Destinations = new[] { new Destination { To = GetPhoneNumber(phone) } },
                From = "Ila26",
                Text = $"Your validation Code is: {otp}"
            }
        };
    }

    private static string GetPhoneNumber(string phone)
    {
        return phone.Replace("+", "") ;
    }
}

public class Message
{
    public Destination[]? Destinations { get; set; }
    public string? From { get; set; }
    public string? Text { get; set; }
}

public class Destination
{
    public string? To { get; set; }
}
