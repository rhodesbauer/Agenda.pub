using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Models.General;
using Exceptions;
using System.Data.Entity;

namespace BACKEND.dal
{
    /// <summary>
    /// SSC
    /// Class will handle operations where the User is the main subject
    /// </summary>
    internal class User
    {
        /// <summary>
        /// Will not use singleton with this since I think we may have the need to operate multiple users in the future.
        /// </summary>
        private tblUser _user { get; set; }
        /// <summary>
        /// Regulates if a tblUser is loaded
        /// </summary>
        private Boolean _flag { get; set; }
        
        /// <summary>
        /// In order to allow the injection of the context instead of setting it externaly and also to ensure singleton on the context.
        /// </summary>
        private FinnancialEntities _context;
        internal FinnancialEntities Context { get { if (_context == null) return new FinnancialEntities(); else return _context; } private set { _context = value; } }

        /// <summary>
        /// Public constructor, will make use of a new context if it is not set intentionaly
        /// </summary>
        /// <param name="pFlag">Flag to control if the use of the 'empty' contructor is deliberate or acidental</param>
        public User (Boolean pFlag = false) 
        {
            _flag = pFlag;
            if (!pFlag)
                ///TODO: Replace with logging
                throw new NotImplementedException("Empty constructor");
            else
            {
                _user = new tblUser();
                _context = new FinnancialEntities();
            }
        }

        /// <summary>
        /// Constructor that populates a object User to be saved or changed
        /// </summary>
        /// <param name="pComments"></param>
        /// <param name="pDateCreated"></param>
        /// <param name="pDateIssued"></param>
        /// <param name="pDateModified"></param>
        /// <param name="pEmail"></param>
        /// <param name="pMobile"></param>
        /// <param name="pName"></param>
        /// <param name="pProvider"></param>
        /// <param name="pSession"></param>
        /// <param name="pID"></param>
        public User(FinnancialEntities pContext , string pComments, DateTime pDateCreated, DateTime pDateIssued, DateTime pDateModified, string pEmail, string pMobile, string pName, string pProvider, Guid pSession, string pToken, Guid? pID)
        {
            ///Creates a new instance in case is not created yet (most probable since the property is private)
            if (_user == null) _user = new tblUser();

            Context = pContext;
            _user.Comments = pComments;
            _user.dateCreated = pDateCreated;
            _user.dateIssued = pDateIssued;
            _user.dateModified = pDateModified;
            _user.Email = pEmail;
            _user.Mobile = pMobile;
            _user.Name = pName;
            _user.Provider = pProvider;
            _user.Session = pSession;
            _user.Token = pToken;
            if (pID != null) _user.ID = (Guid)pID;

            _flag = true;
        }

        public User(FinnancialEntities pContext, tblUser pUser) { _user = pUser; Context = pContext; _flag = true; }

        internal void loadContext(FinnancialEntities pContext) => Context = pContext;
        internal void setUser(tblUser pUser) { _user = pUser; _flag = true; }

        /// <summary>
        /// Set's the ID, add to the context, save changes and return the ID generated
        /// It generates the ID to not let the responsability to the DB that should be interchangeable
        /// </summary>
        /// <returns>the ID</returns>
        internal Guid newUser() { _user.ID = Guid.NewGuid(); _context.tblUser.Add(_user); _context.SaveChanges(); return _user.ID; }

        internal void saveUser() 
        {
            //No pun intended
            //var lUser = _context.tblUser.Find(_user.ID);
            //lUser = _user;
            _context.Entry(_context.tblUser.Find(_user.ID)).CurrentValues.SetValues(_user);
            _context.SaveChanges();
        }

        internal tblUser findUser(Guid pID) => _context.tblUser.Find(pID);
        internal tblUser findUser(string pEmail)
        {
            try
            {
                return _context.tblUser.Single(x => x.Email.Equals(pEmail));
            }
            catch (Exception e)
            {
                if (e.Message.Equals("Sequence contains no elements"))
                    throw new NotFoundException();
                else
                    throw new UnknowException(e.Message, e.InnerException);
            }

        }

        internal tblUser findUserBySession(Guid pSession) => _context.tblUser.Single(x => x.Session.Equals(pSession));

        internal void deleteUser(Guid pID) 
        {
            _context.tblUser.Remove(findUser(pID));
            _context.SaveChanges();
        }

        /// <summary>
        /// Transforms a tblUser into an mdlUser
        /// </summary>
        /// <param name="pUser"></param>
        /// <returns></returns>
        internal mdlUser parseModel (tblUser pUser)
        {
            mdlUser lUser = new mdlUser();
            lUser.Comments = pUser.Comments;
            lUser.dateCreated = pUser.dateCreated;
            lUser.dateIssued = pUser.dateIssued;
            lUser.dateModified = pUser.dateModified;
            lUser.Email = pUser.Email;
            lUser.ID = pUser.ID;
            lUser.Mobile = pUser.Mobile;
            lUser.Name = pUser.Name;
            lUser.Provider = pUser.Provider;
            lUser.Session = pUser.Session;
            lUser.Token = pUser.Token;

            return lUser;
        }
    }
}
