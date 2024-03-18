using Refit;
using VtcSolution.Application.Common.Models;

namespace VtcSolution.Application.Common.Interfaces;

public interface IInfobipApi
{
    [Post("/sms/2/text/advanced")]
    Task<HttpResponseMessage> SendSmsAsync([Body] SmsRequest body);
}
