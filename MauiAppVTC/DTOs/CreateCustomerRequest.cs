﻿namespace MauiAppVTC.DTOs;

public class CreateCustomerRequest
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string CountryCode { get; set; }
    public string Phone { get; set; }
}