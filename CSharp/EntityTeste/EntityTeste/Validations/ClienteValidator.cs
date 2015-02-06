using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentValidation;
using EntityTeste.Models;

namespace EntityTeste.Validations
{
    public class ClienteValidator : AbstractValidator<Cliente>
    {
        public ClienteValidator()
        {
            RuleFor(e => e.Name).NotEmpty().WithMessage("O nome deve ser preenchido");
            RuleFor(e => e.Telefone).NotEmpty().WithMessage("O Telefone deve ser preenchido").Length(8, 9).WithMessage("Telefone deve ter entre 8 ou 9 caracteres");
            RuleFor(e => e.peso).GreaterThan(0).WithMessage("Peso deve ser maior que zero");
        }

    }
}
