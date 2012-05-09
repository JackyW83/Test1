using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace BugNET.Entities.DataContext
{
    public class BugNetDataContext : DbContext
    { 
        public DbSet<Project> Projects { get; set; }
    }
}
