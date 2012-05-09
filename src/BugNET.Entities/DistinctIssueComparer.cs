﻿using System.Collections.Generic;

namespace BugNET.Entities
{
    public class DistinctIssueComparer : IEqualityComparer<Issue>
    {

        #region IEqualityComparer<Issue> Members

        /// <summary>
        /// Equalses the specified x.
        /// </summary>
        /// <param name="x">The x.</param>
        /// <param name="y">The y.</param>
        /// <returns></returns>
        bool IEqualityComparer<Issue>.Equals(Issue x, Issue y)
        {
            if (ReferenceEquals(x, y)) return true;

            if (ReferenceEquals(x, null) || ReferenceEquals(y, null)) 
                return false;

            return x.Id == y.Id;
        }

        /// <summary>
        /// Returns a hash code for this instance.
        /// </summary>
        /// <param name="obj">The obj.</param>
        /// <returns>
        /// A hash code for this instance, suitable for use in hashing algorithms and data structures like a hash table. 
        /// </returns>
        int IEqualityComparer<Issue>.GetHashCode(Issue obj)
        {
            return ReferenceEquals(obj, null) ? 0 : obj.Id.GetHashCode();
        }

        #endregion
    }
}