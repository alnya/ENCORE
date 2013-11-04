using System.Collections.Generic;
using System.Linq;

using Db4objects.Db4o;
using Db4objects.Db4o.Internal.Reflect;
using Encore.DataStore.DataObjects;

namespace Encore.DataStore
{
    public class DataStore
    {
        private static string _dbStorePath;

        public DataStore(string pathToDatabase)
        {
            _dbStorePath = pathToDatabase;
        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Save data rows to store
        /// </summary>
        public void Store(List<DataRow> rows)
        {
            var config = Db4oEmbedded.NewConfiguration();
            config.Common.ObjectClass(typeof(DataRow)).ObjectField("ReportID").Indexed(true);

            IObjectContainer db = Db4oEmbedded.OpenFile(config, _dbStorePath);
            try
            {
                db.Store(rows);
            }
            finally
            {
                db.Close();
            }

        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Save data rows to store
        /// </summary>
        public List<DataRow> Retrieve(int reportid, int pagesize, int page, out int total)
        {
            var config = Db4oEmbedded.NewConfiguration();
            config.Common.ReflectWith(new FastNetReflector());

            IObjectContainer db = Db4oEmbedded.OpenFile(config, _dbStorePath);
            try
            {
                var rows = db.Query<DataRow>(row => row.ReportID == reportid);
                total = rows.Count;
                return rows.Skip((page - 1) * pagesize).Take(pagesize).ToList();
            }
            finally
            {
                db.Close();
            }
        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Save data rows to store
        /// </summary>
        public List<DataRow> Retrieve(int reportid)
        {
            var config = Db4oEmbedded.NewConfiguration();
            config.Common.ReflectWith(new FastNetReflector());

            IObjectContainer db = Db4oEmbedded.OpenFile(config, _dbStorePath);
            try
            {
                var rows = db.Query<DataRow>(row => row.ReportID == reportid);
                return rows.ToList();
            }
            finally
            {
                db.Close();
            }
        }

        /////////////////////////////////////////////////////////////
        /// <summary>
        /// Clear report results
        /// </summary>
        public void Remove(int reportID)
        {
            IObjectContainer db = Db4oEmbedded.OpenFile(
                Db4oEmbedded.NewConfiguration(), _dbStorePath);
            try
            {

                var rows = db.Query<DataRow>(row => row.ReportID == reportID);
                foreach(var row in rows)
                {
                    db.Delete(row);
                }
            }
            finally
            {
                db.Close();
            }

        }
    }
}
