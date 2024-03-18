
using MauiAppVTC.Models;

namespace MauiAppVTC.ViewModels;

public class ListingTripsViewModel : BaseViewModel
{
    private List<Activity> _activities;
    public List<Activity> Activities { get => _activities; set => SetField(ref _activities, value);}
    public ListingTripsViewModel()
    {
        Activities= new List<Activity>
        {
            new Activity("20/03", "Randonnée", "178 Wainee St", "353 Haleakala Hwy"),
            new Activity("21/03", "Plage", "340 Kaahumanu St", "147 Kuihelani Hwy"),
            new Activity("22/03", "Exploration", "369 Wainee St", "711 Kuihelani Hwy"),
            new Activity("23/03", "Plage", "402 Front St", "663 Haleakala Hwy"),
            new Activity("24/03", "Kayak", "919 Front St", "495 Kuihelani Hwy"),
            new Activity("25/03", "Snorkeling", "652 Front St", "816 Haleakala Hwy"),
            new Activity("26/03", "Snorkeling", "203 Kaahumanu St", "957 Kuihelani Hwy")
        };
    }
    
}