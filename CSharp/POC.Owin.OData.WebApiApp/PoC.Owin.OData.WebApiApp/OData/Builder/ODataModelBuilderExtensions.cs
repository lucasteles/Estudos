using Study.Owin.OData.WebApiApp.Abstraction;
using Study.Owin.OData.WebApiApp.Constants;
using System;
using System.Linq;
using System.Reflection;
using System.Web.OData;
using System.Web.OData.Builder;

namespace Study.Owin.OData.WebApiApp.OData.Builder
{
    public static class ODataModelBuilderExtensions
    {
        public static void ResolverEdmModel(this ODataConventionModelBuilder builder)
        {
            var assembly = Assembly.GetExecutingAssembly();
            if (assembly != null)
            {
                var assemblyName = assembly.GetName();
                if (assemblyName != null)
                    builder.Namespace = assemblyName.Name;

                builder.ContainerName = ODataConstants.ContainerName;

                var interfaceType = typeof(IODataModel);
                var assemblyTypes = assembly.GetTypes();

                foreach (var assemblyType in assemblyTypes)
                {
                    if (interfaceType.IsAssignableFrom(assemblyType)
                        && !assemblyType.IsInterface
                        && !assemblyType.IsAbstract
                    )
                    {
                        var modelInstance = Activator.CreateInstance(assemblyType);
                        var method = assemblyType.GetMethod("OnEdmModelResolver");
                        method.Invoke(
                            modelInstance,
                            new object[]
                            {
                                builder
                            }
                        );
                    }
                }
            }
        }

        public static void RegisterOdataEntities(this ODataConventionModelBuilder builder)
        {
            var assemblies = AppDomain.CurrentDomain.GetAssemblies();
            if (assemblies != null
                && assemblies.Length > 0
            )
            {
                var controllerTypes = assemblies.SelectMany(
                    a => a.GetTypes()
                ).Where(
                    t =>
                            t.IsSubclassOf(typeof(ODataController))
                        && t.Name.Contains("Controller")
                        && !t.Equals(typeof(MetadataController))
                );

                if (controllerTypes != null
                    && controllerTypes.Count() > 0
                )
                {
                    foreach (var controllerType in controllerTypes)
                    {
                        Type modelType = null;
                        var ModelInterface = controllerType.GetInterface(typeof(IODataModel<>).Name);

                        if (ModelInterface != null && ModelInterface.IsGenericType)
                            modelType = ModelInterface.GetGenericArguments()[0];

                        if (modelType != null)
                        {
                            var controllerName = controllerType.Name.Substring(0, controllerType.Name.IndexOf("Controller"));
                            MethodInfo method = typeof(ODataConventionModelBuilder).GetMethod("EntitySet");
                            MethodInfo generic = method.MakeGenericMethod(modelType);
                            generic.Invoke(builder, new object[] { controllerName });
                        }
                    }



                }
            }
        }




    }
}