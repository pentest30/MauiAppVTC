namespace MauiAppVTC.Models;

public class Activity
{
    public Activity(string date, string activity, string startAddress, string destinationAddress)
    {
        Date = date;
        ActivityName = activity;
        StartAddress = startAddress;
        DestinationAddress = destinationAddress;
    }
    public string Date { get; set; }
    public string ActivityName { get; set; }
    public string StartAddress { get; set; }
    public string DestinationAddress { get; set; }
}