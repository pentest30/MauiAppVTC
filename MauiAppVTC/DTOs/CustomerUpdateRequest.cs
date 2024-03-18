using Newtonsoft.Json;

namespace MauiAppVTC.DTOs;

public class CustomerUpdateRequest
{
    [JsonProperty("customerId")]
    public Guid CustomerId { get; set; }

    [JsonProperty("code")]
    public string Code { get; set; }
}