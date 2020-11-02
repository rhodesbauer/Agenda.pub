using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.General
{
    public class mdlUser
    {
        public System.Guid ID { get; set; }
        public string Name { get; set; }
        public string Comments { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Provider { get; set; }
        public System.Guid Session { get; set; }
        public string Token { get; set; }
        public System.DateTime dateIssued { get; set; }
        public System.DateTime dateCreated { get; set; }
        public System.DateTime dateModified { get; set; }
    }
}
