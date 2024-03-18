using System.Text.RegularExpressions;
using VtcSolution.Application.Common.Interfaces;
using VtcSolution.Domain.Entities;

namespace VtcSolution.Application.Customers;

public class CreateCustomerCommandValidator : AbstractValidator<CreateCustomerCommand>
{
    private readonly IRepository<Customer> _repository;

    public CreateCustomerCommandValidator(IRepository<Customer> repository)
    {
        _repository = repository;
        RuleFor(cmd => cmd)
            .MustAsync(PhoneNumberShouldBeUnique)
            .WithMessage("Phone number must be unique.");
        RuleFor(command => command.FirstName)
            .NotEmpty().WithMessage("First name is required.")
            .Length(2, 50)
            .WithMessage("First name must be between 2 and 50 characters.");

        RuleFor(command => command.LastName)
            .NotEmpty()
            .WithMessage("Last name is required.")
            .Length(2, 50).WithMessage("Last name must be between 2 and 50 characters.");

        RuleFor(command => command.Email)
            .NotEmpty()
            .WithMessage("Email is required.")
            .EmailAddress()
            .WithMessage("A valid email is required.");

        RuleFor(command => command.CountryCode)
            .NotEmpty()
            .WithMessage("Country code is required.")
            .Matches(new Regex(@"^\+[1-9]{1}[0-9]{1,2}$")).WithMessage("Country code must be in the format +xxx.");

        RuleFor(command => command.Phone)
            .NotEmpty().
            WithMessage("Phone number is required.")
            .Matches(new Regex(@"^[0-9]{4,13}$")).WithMessage("Phone number must be in international format and start with a country code.");
    }

    private async Task<bool> PhoneNumberShouldBeUnique(CreateCustomerCommand request, CancellationToken cancellationToken)
    {
        return !await _repository.GetAll().AnyAsync(c => c.Phone!.Number == request.Phone && c.Phone.CountryCode == request.CountryCode, cancellationToken);
    }
}
