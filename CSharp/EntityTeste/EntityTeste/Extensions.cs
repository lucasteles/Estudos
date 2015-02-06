using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EntityTeste
{
    public static class Extensions
    {
       public static  void GatherFrom<TSelf, TSource>(this TSelf self, TSource source, bool skipNewValueIfNull, string skipProperties = "")
        {
            var sourceAllProperties = source.GetType().GetProperties();

            var selfType = self.GetType();
            foreach (var sourceProperty in sourceAllProperties)
            {
                var selfProperty = selfType.GetProperty(sourceProperty.Name);

                if (selfProperty == null) continue;

                var sourceValue = sourceProperty.GetValue(source, null);

                if (sourceValue == null && skipNewValueIfNull || skipProperties.ToLower().Contains("@" + sourceProperty.Name.ToLower() + "@"))
                {
                    continue;
                }

                selfProperty.SetValue(self, sourceValue, null);
            }
         }

       public static string getErrorString(this FluentValidation.Results.ValidationResult self)
       {
           return String.Join("\n",self.Errors.Select(e => e.ErrorMessage));
       }

    }
}
