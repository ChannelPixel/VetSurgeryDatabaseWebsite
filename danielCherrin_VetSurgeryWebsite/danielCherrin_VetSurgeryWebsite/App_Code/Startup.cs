using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(danielCherrin_VetSurgeryWebsite.Startup))]
namespace danielCherrin_VetSurgeryWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
