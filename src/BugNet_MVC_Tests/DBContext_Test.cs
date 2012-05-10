using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting; 

namespace BugNET.Tests.MVC_Test
{
    [TestClass]
    public class DBContext_Test
    {
        [TestMethod]
        public void DBContextCreated()
        {
            BugNET.Entities.DataContext.BugNetDomainDataContext context = new BugNET.Entities.DataContext.BugNetDomainDataContext();

            try
            {
                var projects = context.BugNet_Projects.Local;
                Assert.IsNotNull(projects);
            }
            catch (Exception ex)
            {

                throw;
            }
            
            
           
        }
    }
}
