using BCC.Canteen.Model;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BCC.Canteen.Validation
{
    public class StoreValidator : AbstractValidator<Store>
    {
        public StoreValidator() : base()
        {
            RuleFor(u => u.Name)
                .NotEmpty()
                .Length(1, 255)
                .WithMessage("Nome Inválido");
        }
    }
}
