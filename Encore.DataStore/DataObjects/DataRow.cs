using System;
using System.Collections.Generic;

namespace Encore.DataStore.DataObjects
{
    public class DataRow
    {
        public int ReportID;
        public int SiteID;
        public DateTime RowDateTime;
        public List<int> Fields;
        public List<string> Values;
    }
}
