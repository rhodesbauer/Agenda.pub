using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BACKEND;
using Models.General;
using Models;
using System.Globalization;

namespace REST.CodeBehind.General
{
    public class UserOperations : Operations
    {
        private mdlUser _user;
        private Users _bzUsers;

        #region Constructor
        public UserOperations(string pScope) : base(pScope)
        {
            this._bzUsers = new Users(pScope);

        }
        #endregion

        public bool doesExist(string pName, string pEmail) => _bzUsers.doesExist(pName, pEmail);

        public mdlUser newUser(mdlUser pUser)
        {
            _user = pUser;
            _user.dateCreated = DateTime.Now;
            _user.dateIssued = DateTime.Now;
            _user.dateModified = DateTime.Now;

            var lID = _bzUsers.addNew(_user);
            _user.ID = lID;
            return _user;
        }

        public mdlUser getSingle(string pEmail) => _bzUsers.getSingle(pEmail);
        public mdlUser getSingle(Guid pID) => _bzUsers.getSingle(pID);

        public void deleteUser(mdlUser pUser) => _bzUsers.deleteUser(pUser);

        public void saveUser(mdlUser pUser) => _bzUsers.saveUser(pUser);

        public bool doesMatch(string pHash, string pEmail) => _bzUsers.doesMatch(pHash, pEmail);
    }
}