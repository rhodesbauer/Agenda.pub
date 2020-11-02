using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.General;
using BACKEND.dal;
using System.Data.Entity.Infrastructure;
using Exceptions;
using System.Security.Cryptography;

namespace BACKEND
{
    public class Users : Base
    {
        #region properties
        public mdlUser User { get; private set; }
        private User _dalUser;
        #endregion

        #region Constructor
        public Users (string pScope) : base(pScope) { loadContext(); }

        /// <summary>
        /// This contructor loads a tblUser into the mdlUser propertie to be worked on;
        /// </summary>
        /// <param name="pContext">The context that's going to be used for the operations of this instance</param>
        /// <param name="pID">the ID guid of the user to be loaded.</param>
        public Users (String pScope, Guid pID) : base(pScope)
        {
            loadContext();
            User = _dalUser.parseModel(_dalUser.findUser(pID));
        }

        #endregion

        #region Simple redirects
        public mdlUser getSingle(Guid pID) => _dalUser.parseModel(_dalUser.findUser(pID));
        public mdlUser getSingle(string pEmail) => _dalUser.parseModel(_dalUser.findUser(pEmail));

        public Guid addNew(mdlUser pUser)
        {
            if (pUser != null) User = pUser;
            _dalUser.setUser(new tblUser()
            {
                Comments = User.Comments,
                dateCreated = User.dateCreated,
                dateIssued = User.dateIssued,
                dateModified = User.dateModified,
                Email = User.Email,
                ID = User.ID,
                Mobile = User.Mobile,
                Name = User.Name,
                Provider = User.Provider,
                Session = User.Session,
                Token = Convert.ToBase64String(GenerateSaltedHash(Encoding.UTF8.GetBytes(User.Token), Encoding.UTF8.GetBytes(User.Session.ToString())))
            }) ;
            return _dalUser.newUser();
        }

        /// <summary>
        /// Caution when changing Session and Token since this may cause User unable to login
        /// </summary>
        /// <param name="pUser"></param>
        public void saveUser(mdlUser pUser)
        {
            if (pUser != null) User = pUser;
            _dalUser.setUser(new tblUser()
            {
                Comments = User.Comments,
                dateCreated = User.dateCreated,
                dateIssued = User.dateIssued,
                dateModified = DateTime.Now,
                Email = User.Email,
                ID = User.ID,
                Mobile = User.Mobile,
                Name = User.Name,
                Provider = User.Provider,
                Session = User.Session,
                Token = User.Token
            });
            _dalUser.saveUser();
        }

        public void deleteUser(mdlUser pUser)
        {
            if (pUser != null) User = pUser;
            _dalUser.deleteUser(User.ID);
        }
        #endregion

        private void loadContext()
        {
            _dalUser = new User(true);
            ///The dal class is waiting a FinnancialEntities dbContext, so this is harcoded
            ///TODO: Change to Interface type
            _dalUser.loadContext((FinnancialEntities)Context);
        }

        /// <summary>
        /// Will look for the e-mail, if find will compare the name.
        /// </summary>
        /// <param name="pName"></param>
        /// <param name="pEmail"></param>
        /// <returns>True if found AND the name matches</returns>
        public Boolean doesExist(string pName, string pEmail)
        {
            try
            {
                return getSingle(pEmail).Name.Equals(pName);
            }
            catch (NotFoundException nfe) { return false; }
            catch (UnknowException ue)
            {
                ///TODO: Implement Logging
                return false;
            }
            
        }



        #region User Creation and Validation
        #region Disclaimer
        ///The authentication is not exactly safe, since a intruder that has access to the database can discover hash and salt and log in. 
        ///The point with the following mechanism is to not store user password in a way that others systems that user eventualy uses the same
        ///password get compromised. 
        ///If you want to make this slightly more secure, don't store the simple hash, store the string with the salt already applied, and store
        ///the salt elsewhere, behind some sort of enchryption, in a way that the intruder won't be able to reverse engineer the password.
        ///If an intruder have access to the database, it will have already access to everything important in this system, so I don't see much 
        ///reason to use a too complicated authentication mechanism.
        #endregion

        /// <summary>
        /// Compares the hash value given with the hash value stored
        /// </summary>
        /// <param name="pHash"></param>
        /// <param name="pEmail"></param>
        /// <returns>true if they match</returns>
        public Boolean doesMatch(string pHash, string pEmail)
        {
            var _user = getSingle(pEmail);
            return CompareByteArrays(GenerateSaltedHash(Encoding.UTF8.GetBytes(pHash), Encoding.UTF8.GetBytes(_user.Session.ToString())), 
                                     Convert.FromBase64String(_user.Token));
        }

        #region Thanks to Nick Prozee at https://stackoverflow.com/questions/50298389/generate-password-hash-using-string-salt
        //Encoding.UTF8.GetBytes(string)
        //Convert.ToBase64String
        //Convert.FromBase64String
        /// <summary>
        /// Generates a Hash crossing a text with a given salt
        /// </summary>
        /// <param name="pText"></param>
        /// <param name="pSalt"></param>
        /// <returns></returns>
        private byte[] GenerateSaltedHash(byte[] pText, byte[] pSalt)
        {
            HashAlgorithm algorithm = new SHA256Managed();

            byte[] plainTextWithSaltBytes =
              new byte[pText.Length + pSalt.Length];

            for (int i = 0; i < pText.Length; i++)
            {
                plainTextWithSaltBytes[i] = pText[i];
            }
            for (int i = 0; i < pSalt.Length; i++)
            {
                plainTextWithSaltBytes[pText.Length + i] = pSalt[i];
            }

            return algorithm.ComputeHash(plainTextWithSaltBytes);
        }

        /// <summary>
        /// Compares two byte arrays
        /// </summary>
        /// <param name="pArray1"></param>
        /// <param name="pArray2"></param>
        /// <returns>true if they are equal</returns>
        private bool CompareByteArrays(byte[] pArray1, byte[] pArray2)
        {
            if (pArray1.Length != pArray2.Length)
            {
                return false;
            }

            for (int i = 0; i < pArray1.Length; i++)
            {
                if (pArray1[i] != pArray2[i])
                {
                    return false;
                }
            }

            return true;
        }
        #endregion
        #endregion
    }
}
