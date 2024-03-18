using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Application.Common.Models;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Application.Customers;

public class CreateCustomerCommand : IRequest<Guid>
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string CountryCode { get; set; }
    public string Phone { get; set; }

    public CreateCustomerCommand(string firstName, string lastName, string email, string phone, string countryCode)
    {
        FirstName = firstName;
        LastName = lastName;
        Email = email;
        Phone = phone;
        CountryCode = countryCode;
    }
    public class CreateCustomerCommandHandler : IRequestHandler<CreateCustomerCommand, Guid>
    {
        private readonly IRepository<Customer> _repository;
        private readonly ISMSService _smsService;

        public CreateCustomerCommandHandler(IRepository<Customer> repository, ISMSService smsService)
        {
            _repository = repository;
            _smsService = smsService;
        }   
        
        public async Task<Guid> Handle(CreateCustomerCommand request, CancellationToken cancellationToken)
        {
            var entity = new Customer(request.FirstName, request.LastName, request.Email, request.Phone, request.CountryCode);
            var validationOtp = entity.OptValidations.First();
            var smsRequest = new SmsRequest();
            smsRequest.OTPRequest(validationOtp.PhoneNumber!, validationOtp?.Code!);
            if (await _smsService.SendSmsAsync(smsRequest))
            {
                await _repository.AddAsync(entity, cancellationToken);
                await _repository.UnitOfWork.SaveChangesAsync(cancellationToken);
            }
            else
            {
                throw new InvalidOperationException("Error sending sms");
            }

            return entity.Id;
        }
    }
}
