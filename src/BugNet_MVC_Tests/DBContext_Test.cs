using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using BugNET.Entities.DataContext; 

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
                var fields = context.CustomFields.Local;
                

                CustomFieldType type = new CustomFieldType();
                type.Id = Guid.NewGuid();
                type.Name = "Test type";
                context.CustomFieldTypes.Add(type);
             
                context.CustomFields.Add(new CustomField() 
                {
                    Id = Guid.NewGuid(),
                    DataType = 1,
                    Name = "Test",
                    Required = true,

                    CustomFieldType = type
                });

                context.SaveChanges();

                Assert.IsNotNull(fields);
                
            }
            catch (Exception ex)
            {

                throw;
            }
            
            
           
        }
    }
}
