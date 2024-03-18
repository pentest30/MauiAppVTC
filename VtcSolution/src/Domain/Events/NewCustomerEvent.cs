namespace VtcSolution.Domain.Events;

public class NewCustomerEvent : BaseEvent
{
    public NewCustomerEvent(Customer customer)
    {
        Customer = customer;
    }
    public Customer? Customer { get; set; }
}
