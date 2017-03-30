using BCC.Canteen.Model;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BCC.Canteen.Validation
{
    public class FeedbackValidator : AbstractValidator<Feedback>
    {
        public FeedbackValidator() : base()
        {
            RuleFor(u => u.Description)
                .NotEmpty()
                .WithMessage("Descrição vazia")
                .Length(1, 512)
                .WithMessage("Descrição muito grande!");

            RuleFor(u => u.Name)
               .NotEmpty()
               .WithMessage("Nome vazia")
               .Length(1, 255)
               .WithMessage("Nome muito grande!");

            RuleFor(u => u.Email)
               .EmailAddress()
               .WithMessage("Email Inválido");
        }
    }
}
