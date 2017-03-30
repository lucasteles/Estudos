using BCC.Canteen.Model;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BCC.Canteen.Validation
{
    public class UserValidator : AbstractValidator<User>
    {
        public UserValidator() : base()
        {
            RuleFor(u => u.Email)
                .EmailAddress()
                .WithMessage("Email Inválido");

            RuleFor(u => u.Login)
                .NotEmpty()
                .Length(1, 255)
                .WithMessage("Login inválido");
        }
    }
}
