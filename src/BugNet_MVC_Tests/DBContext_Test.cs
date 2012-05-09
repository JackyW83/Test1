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
            BugNET.Entities.DataContext.BugNetDataContext context = new Entities.DataContext.BugNetDataContext();

            try
            {
                var projects = context.Projects.ToList();
                Assert.IsNotNull(projects);
            }
            catch (Exception)
            {
                
                throw;
            }
            
            
           
        }
    }
}
