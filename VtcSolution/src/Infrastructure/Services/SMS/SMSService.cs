using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Application.Common.Models;

namespace VtcSolution.Infrastructure.Services.SMS;

public class SMSService : ISMSService
{
    private readonly IInfobipApi _infobipApi;

    public SMSService(IInfobipApi infobipApi)
    {
        _infobipApi = infobipApi;
    }

    public async Task<bool> SendSmsAsync(SmsRequest request)
    {
        var response = await _infobipApi.SendSmsAsync(request);
        return response.IsSuccessStatusCode;
    }
}
