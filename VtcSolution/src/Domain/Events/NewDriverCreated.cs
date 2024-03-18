namespace VtcSolution.Domain.Events;

public class NewDriverCreated : BaseEvent
{
    public NewDriverCreated(Driver driver)
    {
        Driver = driver;
    }
    public Driver? Driver { get; set; }
}
