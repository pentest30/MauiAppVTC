using VtcSolution.Application.Common.Models;

namespace VtcSolution.Application.Common.Interfaces;

public interface ISMSService 
{
    Task<bool> SendSmsAsync(SmsRequest request);
}
