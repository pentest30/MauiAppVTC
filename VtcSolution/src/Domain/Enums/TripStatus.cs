namespace VtcSolution.Domain.Enums;

public enum TripStatus
{
    Requested, // When a customer has requested a trip but a driver has not yet accepted it
    Accepted, // A driver has accepted the trip request
    Arrived, // The driver has arrived at the pickup location
    InProgress, // The trip is currently underway
    Completed, // The trip has been completed
    Cancelled // The trip has been cancelled
}
