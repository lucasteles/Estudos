using System.Web.OData.Builder;

namespace Study.Owin.OData.WebApiApp.Abstraction
{
    public interface IODataModel
    {
        void OnEdmModelResolver(ODataModelBuilder modelBuilder);
    }

    public interface IODataModel<TModel>
    {
    }
}