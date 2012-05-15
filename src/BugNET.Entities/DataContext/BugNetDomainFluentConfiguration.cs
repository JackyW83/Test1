using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace BugNET.Entities.DataContext
{
    internal class BugNetDomainFluentConfiguration
    {
        internal void Config(DbModelBuilder modelBuilder)
        {
            ConfigCustomFieldPart(modelBuilder);
   
            
        }

        private void ConfigCustomFieldPart(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CustomField>().ToTable("BugNet_ProjectCustomFields");
            
            modelBuilder.Entity<CustomField>().HasMany<CustomFieldSelection>(field => field.CustomFieldSelections)
                .WithRequired(s => s.CustomField);

            modelBuilder.Entity<CustomField>().HasMany<CustomFieldValue>(field => field.CustomFieldValues)
                .WithRequired(value => value.CustomField);

            modelBuilder.Entity<CustomField>().HasRequired<CustomFieldType>(field => field.CustomFieldType)
                .WithMany();

            modelBuilder.Entity<CustomFieldSelection>().HasRequired<CustomField>(cfs => cfs.CustomField);

            modelBuilder.Entity<CustomFieldType>().ToTable("BugNet_ProjectCustomFieldTypes");
            modelBuilder.Entity<CustomFieldType>().HasMany<CustomField>(type => type.CustomFields)
                .WithRequired(value => value.CustomFieldType).HasForeignKey(f => f.TypeId);

            modelBuilder.Entity<CustomFieldValue>().HasRequired<CustomField>(value => value.CustomField);
        }
    }
}
