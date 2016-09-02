using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PoC.Owin.OData.WebApiApp.OData.Builder.Attributes
{
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false)]
    public class ODataMethodAttribute : Attribute
    {
        
       public Type ReturnType { get; set;  }
    }
}