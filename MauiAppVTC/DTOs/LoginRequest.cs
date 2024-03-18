using Newtonsoft.Json;

namespace MauiAppVTC.DTOs;

public class LoginRequest
{
    [JsonProperty("countryCode")]
    public string CountryCode { get; set; }

    [JsonProperty("phoneNumber")]
    public string PhoneNumber { get; set; }
}