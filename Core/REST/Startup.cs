using System;
using System.Threading.Tasks;
using System.Web.Http;


namespace REST
{
    public class Startup
    {
        public void Configuration()
        {
            // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=316888

            //Setting WebApi
            var lConfig = new HttpConfiguration();

            //Setting routes
            lConfig.MapHttpAttributeRoutes();
            lConfig.Routes.MapHttpRoute(
                  name: "REST",
                  routeTemplate: "api/{controller}/{id}",
                  defaults: new { id = RouteParameter.Optional });


        }
    }
}
