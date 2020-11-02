using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace Models.General
{
    /// <summary>
    /// Simple model to hold sesion information
    /// </summary>
    public class mdlSession
    {
        public Guid ID { get; private set; }
        public string Token { get; private set; }
        public mdlUser User { get; private set; }
        public DateTime CreationDate { get; private set; }
        public DateTime ValidUntil { get; private set; }


        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="pToken">This can be the token provided by login or another control string</param>
        /// <param name="pUser">mdlUser object that started this session</param>
        public mdlSession (string pToken, mdlUser pUser)
        {
            ID = Guid.NewGuid();
            CreationDate = DateTime.Now;
            ValidUntil = CreationDate.AddSeconds(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings.Get("DefaultSessionTimeSpan")));
            ///TODO: Placeholder. In the future use this to increase security
            Token = pToken;
            User = pUser;
        }
    }
}
