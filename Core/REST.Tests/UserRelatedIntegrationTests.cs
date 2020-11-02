using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Models.General;

namespace REST.Tests
{
    [TestClass]
    public class UserRelatedIntegrationTests
    {
        private mdlUser User { get { return new mdlUser()
        {
            Comments = "CheckIfUserCanBeAdded [" + DateTime.Now.ToString() + "]",
            Email = "test@test.com",
            Mobile = "+35199115533",
            Name = "Test",
            Provider = "Integration Test",
            Session = Guid.NewGuid(),
            Token = "Integration Test"
        }; }}

        [TestMethod]
        public void CheckIfAGivenUserDoesNotExists()
        {
            var UserOperations = new REST.CodeBehind.General.UserOperations(Models.Constants.SCOPE_FINNANCIAL);
            Assert.IsFalse(UserOperations.doesExist("Test", "test"));
        }

        [TestMethod]
        public void CheckIfAnUserCanBeAdded()
        {
            var lUserOperations = new REST.CodeBehind.General.UserOperations(Models.Constants.SCOPE_FINNANCIAL);
            var lUser = User;

            Assert.IsNotNull(lUserOperations.newUser(lUser).ID);
            Assert.IsTrue(lUserOperations.doesExist(lUser.Name, lUser.Email));
        }

        [TestMethod]
        public void CheckIfAnUserCanBeModified()
        {
            var lUserOperations = new REST.CodeBehind.General.UserOperations(Models.Constants.SCOPE_FINNANCIAL);
            if (!lUserOperations.doesExist(User.Name, User.Email)) Assert.Inconclusive("USER IS NOT PRESENT IN THE DATABASE TO BE MODIFIED");
            mdlUser lUser = lUserOperations.getSingle(User.Email);
            DateTime ldtModified = DateTime.Now;
            lUser.dateModified = ldtModified;
            lUser.Comments = "MODIFIED";
            lUserOperations.saveUser(lUser);

            lUser = null;
            lUser = lUserOperations.getSingle(User.Email);
            Assert.IsTrue(lUser.Comments.Equals("MODIFIED"));
        }

        [TestMethod]
        public void CheckIfAnUserCanBeDeleted()
        {
            var lUserOperations = new REST.CodeBehind.General.UserOperations(Models.Constants.SCOPE_FINNANCIAL);
            if (!lUserOperations.doesExist(User.Name, User.Email)) Assert.Inconclusive("USER IS NOT PRESENT IN THE DATABASE TO BE DELETED");
            lUserOperations.deleteUser(lUserOperations.getSingle(User.Email));

            Assert.IsFalse(lUserOperations.doesExist(User.Name, User.Email));
        }
    }
}
